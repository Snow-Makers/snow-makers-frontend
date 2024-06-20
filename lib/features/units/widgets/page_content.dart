part of '../screens/units_screen.dart';

class _PageContent extends ConsumerStatefulWidget {
  final Unit unit;

  const _PageContent({required this.unit, Key? key}) : super(key: key);

  @override
  ConsumerState<_PageContent> createState() => _PageContentState();
}

class _PageContentState extends ConsumerState<_PageContent> {
  late ScrollController _scrollController;
  Color _appBarBackgroundColor = Colors.transparent;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    final offset = _scrollController.offset;
    if (offset > 200) {
      setState(() {
        _appBarBackgroundColor = context.appTheme.button;
      });
    } else {
      setState(() {
        _appBarBackgroundColor = context.appTheme.moon;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverAppBar(
          backgroundColor: _appBarBackgroundColor,
          elevation: 0,
          snap: true,
          pinned: true,
          floating: true,
          expandedHeight: 30.h * 7,
          centerTitle: true,
          title: const Text('Snow Makers'),
          leading: IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu),
            color: Colors.white,
            iconSize: 30.h,
          ),
          flexibleSpace: FlexibleSpaceBar(
            background: _Header(widget.unit),
          ),
          actions: [
            IconButton(
              onPressed: () async {
                showModalBottomSheet(
                  backgroundColor: context.appTheme.button,
                  context: context,
                  builder: (context) => SizedBox(
                    width: context.width,
                    child: _Options(
                      unit: widget.unit,
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.more_vert),
              color: Colors.white,
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              30.verticalSpace,
              _UnitInformation(widget.unit),
              30.verticalSpace,
              _TimerUnit(seconds: widget.unit.timer,),
              30.verticalSpace,
              _UnitFunctions(unit: widget.unit),
              30.verticalSpace,
              _CalendarUnit(
                unitId: widget.unit.modelId,
              ),
              30.verticalSpace,
            ],
          ),
        ),
      ],
    );
  }
}
