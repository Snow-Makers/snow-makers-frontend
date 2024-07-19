part of '../screens/units_screen.dart';

class _AdvancedSettings extends StatelessWidget {
  const _AdvancedSettings({
    Key? key,
    required this.unit,
  }) : super(key: key);

  final Unit unit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SizedBox(
        width: context.width,
        child: Card(
          child: Column(
            children: [
              16.verticalSpace,
              Text(
                "Advanced Settings",
                style: context.appTextStyles.titleLarge,
              ),
              16.verticalSpace,
              _Settings(unit: unit),
              16.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}

class _Settings extends ConsumerStatefulWidget {
  final Unit unit;

  const _Settings({required this.unit});

  @override
  ConsumerState<_Settings> createState() => _SettingsState();
}

class _SettingsState extends ConsumerState<_Settings> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        ref.read(UnitsHolder.provider.notifier).isOccupationActive =
            widget.unit.isOccupation;
        ref.read(UnitsHolder.provider.notifier).maxTemperature =
            widget.unit.maxTemperature;
        final currentTime = widget.unit.duration == 0
            ? '00:00'
            : time.DateFormat(
                'dd MMMM yyyy HH:mm',
              ).format(
                DateTime.fromMillisecondsSinceEpoch(widget.unit.duration));
        ref.read(UnitsHolder.provider.notifier).duration.text = currentTime;
        ref.read(UnitsHolder.provider.notifier).miliseconds =
            widget.unit.duration;
      }
    });
  }

  void _updateUnit(Unit unit) {
    if (mounted) {
      ref.read(UpdateUnitProvider.provider.notifier).updateUnit(unit);
    }
  }

  @override
  Widget build(BuildContext context) {
    final unitHolder = ref.read(UnitsHolder.provider.notifier);
    final unitHolderState = ref.watch(UnitsHolder.provider);
    return Column(
      children: [
        SwitchListTile(
          title: const Text('Occupation'),
          value: unitHolderState.isOccupationActive ?? true,
          activeColor: Colors.white,
          activeTrackColor: Colors.blueAccent,
          onChanged: (bool isOn) {
            unitHolder.isOccupationActive = isOn;
          },
        ),
        10.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: TextInputField(
            label: 'Max. Temperature (°C)',
            initialValue: widget.unit.maxTemperature.toString(),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
            ],
            inputType: TextInputType.number,
            onChanged: (value) {
              unitHolder.maxTemperature = double.parse(value);
            },
          ),
        ),
        10.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: _FunctionsSelector(
            unit: widget.unit,
          ),
        ),
        20.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: ElevatedButton(
            onPressed: () {
              _updateUnit(widget.unit);
            },
            child: const Text('Save'),
          ),
        ),
      ],
    );
  }
}

class _FunctionsSelector extends ConsumerWidget {
  const _FunctionsSelector({
    Key? key,
    required this.unit,
  }) : super(key: key);

  final Unit unit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unitHolder = ref.read(UnitsHolder.provider.notifier);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: TextInputField(
            controller: unitHolder.duration,
            label: 'Duration',
            inputType: TextInputType.number,
          ),
        ),
        IconButton(
          onPressed: () {
            DatePicker.showDatePicker(
              context,
              dateFormat: 'dd MMMM yyyy HH:mm',
              initialDateTime: DateTime.now(),
              minDateTime: DateTime.now(),
              maxDateTime: DateTime(3000),
              onMonthChangeStartWithFirstDate: true,
              pickerTheme: DateTimePickerTheme(
                backgroundColor: context.appTheme.button,
                confirmTextStyle: context.appTextStyles.titleLarge,
                cancelTextStyle: context.appTextStyles.titleLarge,
                itemTextStyle: context.appTextStyles.headlineMedium.copyWith(
                  color: Colors.white,
                ),
              ),
              onConfirm: (dateTime, List<int> index) {
                DateTime selectDate = dateTime;
                final selIOS =
                    time.DateFormat('dd-MMM-yyyy - HH:mm').format(selectDate);
                final milliseconds = selectDate.millisecondsSinceEpoch;
                unitHolder.duration.text = selIOS;
                unitHolder.miliseconds = milliseconds;
              },
            );
          },
          icon: const Icon(
            Icons.date_range_rounded,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
