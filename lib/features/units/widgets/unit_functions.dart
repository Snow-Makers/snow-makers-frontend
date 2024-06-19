part of '../screens/units_screen.dart';

class _UnitFunctions extends StatelessWidget {
  final Unit unit;

  const _UnitFunctions({required this.unit});

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
                "Unit Functions",
                style: context.appTextStyles.titleLarge,
              ),
              16.verticalSpace,
              _Functions(unit: unit),
              16.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}

class _Functions extends ConsumerStatefulWidget {
  final Unit unit;

  const _Functions({required this.unit});

  @override
  ConsumerState<_Functions> createState() => _FunctionsState();
}

class _FunctionsState extends ConsumerState<_Functions> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        ref.read(UnitsHolder.provider.notifier).functions =
            UnitFunctions.fromValue(widget.unit.unitFunction);
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
          title: const Text('Manual'),
          value: unitHolderState.functions == UnitFunctions.manual,
          activeColor: Colors.white,
          activeTrackColor: Colors.blueAccent,
          onChanged: (bool isOn) {
            if (widget.unit.isActive != null && widget.unit.isActive!) {
              unitHolder.functions =
                  isOn ? UnitFunctions.manual : UnitFunctions.none;
              _updateUnit(widget.unit);
            }
          },
        ),
        SwitchListTile(
          title: const Text('Automatic'),
          value: unitHolderState.functions == UnitFunctions.automatic,
          activeColor: Colors.white,
          activeTrackColor: Colors.blueAccent,
          onChanged: (bool isOn) {
            if (widget.unit.isActive != null && widget.unit.isActive!) {
              unitHolder.functions =
                  isOn ? UnitFunctions.automatic : UnitFunctions.none;
              _updateUnit(widget.unit);
            }
          },
        ),
        SwitchListTile(
          title: const Text('Temperature'),
          value: unitHolderState.functions == UnitFunctions.temperature,
          activeColor: Colors.white,
          activeTrackColor: Colors.blueAccent,
          onChanged: (bool isOn) {
            if (widget.unit.isActive != null && widget.unit.isActive!) {
              unitHolder.functions =
                  isOn ? UnitFunctions.temperature : UnitFunctions.none;
              _updateUnit(widget.unit);
            }
          },
        ),
        20.verticalSpace,
        if (widget.unit.isActive != null && !widget.unit.isActive!)
          Text(
            'Unit is Disconnected',
            style: context.appTextStyles.bodyMedium.copyWith(
              color: Colors.red,
            ),
          )
        else
          Text(
            'Unit is Connected',
            style: context.appTextStyles.bodyMedium.copyWith(
              color: Colors.green,
            ),
          ),
      ],
    );
  }
}
