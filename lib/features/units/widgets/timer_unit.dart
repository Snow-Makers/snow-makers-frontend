part of '../screens/units_screen.dart';

class _TimerUnit extends StatelessWidget {
  final int seconds;

  const _TimerUnit({this.seconds = 0});

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
                "Timer",
                style: context.appTextStyles.titleLarge,
              ),
              30.verticalSpace,
              Center(
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Center(
                      child: TweenAnimationBuilder<double>(
                        tween: Tween<double>(
                            begin: 0.0, end: LogicHelpers.getNearestEnd(seconds)),
                        duration: const Duration(milliseconds: 1000),
                        builder: (context, value, _) => SizedBox(
                          height: 200.w,
                          width: 200.w,
                          child: CircularProgressIndicator(
                            value: value,
                            backgroundColor: Colors.grey,
                            color: const Color(0xFF004B8D),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            LogicHelpers.getTimeFromSeconds(seconds),
                            style: context.appTextStyles.displayLarge.copyWith(
                              fontSize: 35.sp,
                              height: 0,
                            ),
                          ),
                          Text(
                            LogicHelpers.getTimeIsSecondOrMinOrHour(seconds),
                            style: context.appTextStyles.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              16.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
