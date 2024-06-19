part of '../screens/units_screen.dart';

class _UnitInformation extends StatelessWidget {
  final Unit unit;

  const _UnitInformation(this.unit);

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
                "Unit Information",
                style: context.appTextStyles.titleLarge,
              ),
              16.verticalSpace,
              _InfoItem(
                icon: const Icon(Icons.ac_unit_rounded),
                title: 'Model Id',
                subtitle: unit.modelId,
              ),
              _InfoItem(
                icon: const Icon(Icons.location_on),
                title: 'Location',
                subtitle: unit.location.addressName,
              ),
              16.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final Icon icon;
  final String title;
  final String subtitle;

  const _InfoItem({
    required this.title,
    required this.icon,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      titleAlignment: ListTileTitleAlignment.titleHeight,
      title: Text(
        title,
      ),
      subtitle: Text(
        subtitle,
        style: context.appTextStyles.bodyMedium.copyWith(
          color: context.appTheme.white.withOpacity(.7)
        ),
      ),
    );
  }
}
