part of '../screens/units_screen.dart';

class _UnitsBody extends ConsumerStatefulWidget {
  const _UnitsBody();

  @override
  ConsumerState<_UnitsBody> createState() => _UnitsBodyState();
}

class _UnitsBodyState extends ConsumerState<_UnitsBody> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final unitsState = ref.watch(IUnitsService.provider).getUnits();
    unitsState.listen((units) {
      if (units.isEmpty) {
        context.go(
          '/addUnit',
          extra: false,
        );
      }
    });
    return StreamBuilder<List<Unit>>(
      stream: unitsState,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          final units = snapshot.data!;
          return Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _pageController,
                  children:
                      units.map((unit) => _PageContent(unit: unit)).toList(),
                ),
              ),
              if (units.length > 1)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: units.length,
                    effect: const WormEffect(
                      type: WormType.normal,
                      activeDotColor: Colors.blueAccent,
                    ),
                  ),
                ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
