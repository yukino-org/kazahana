import 'package:kazahana/core/exports.dart';
import 'package:kazahana/ui/exports.dart';
import 'package:kazahana/ui/pages/view/components/content/content.dart';
import 'package:kazahana/ui/pages/view/components/hero.dart';
import 'package:kazahana/ui/pages/view/components/overview.dart';
import 'package:kazahana/ui/pages/view/provider.dart';

enum _ViewPageTabs {
  overview,
  content,
}

extension on _ViewPageTabs {
  String getTitleCase(final Translation translation, final TenkaType type) =>
      switch (this) {
        _ViewPageTabs.overview => translation.overview,
        _ViewPageTabs.content => switch (type) {
            TenkaType.anime => translation.episodes,
            TenkaType.manga => translation.chapters,
          }
      };
}

class ViewPageBody extends StatefulWidget {
  const ViewPageBody({
    super.key,
  });

  @override
  State<ViewPageBody> createState() => _ViewPageBodyState();
}

class _ViewPageBodyState extends State<ViewPageBody>
    with SingleTickerProviderStateMixin {
  final List<_ViewPageTabs> tabs = <_ViewPageTabs>[
    _ViewPageTabs.overview,
    _ViewPageTabs.content,
  ];

  late final TabController tabController;
  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);
    scrollController = ScrollController()
      ..addListener(() {
        if (!mounted || !scrollController.hasClients) return;
        final ViewPageViewProvider provider =
            context.read<ViewPageViewProvider>();
        provider.setFloatingAppBarVisibility(
          visible: scrollController.position.pixels < 50,
        );
      });
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
    scrollController.dispose();
  }

  Widget buildTabBarViewPage({
    required final BuildContext context,
    required final WidgetBuilder builder,
  }) =>
      Builder(
        builder: (final BuildContext context) => CustomScrollView(
          slivers: <Widget>[
            SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
            SliverToBoxAdapter(child: builder(context)),
          ],
        ),
      );

  @override
  Widget build(final BuildContext context) {
    final ViewPageProvider provider = context.watch<ViewPageProvider>();
    final AnilistMedia media = provider.media.value;

    return NestedScrollView(
      controller: scrollController,
      floatHeaderSlivers: true,
      headerSliverBuilder:
          (final BuildContext context, final bool innerBoxIsScrolled) =>
              <Widget>[
        SliverList(
          delegate: SliverChildListDelegate.fixed(
            <Widget>[
              ViewPageHero(media),
              SizedBox(height: context.r.scale(0.75)),
              const Divider(height: 0, thickness: 0),
            ],
          ),
        ),
        SliverOverlapAbsorber(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          sliver: SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: _SliverTabBarHeaderDelegate(
              TabBar(
                indicatorColor: Theme.of(context).colorScheme.primary,
                labelStyle: Theme.of(context).textTheme.bodyLarge,
                controller: tabController,
                tabs: tabs
                    .asMap()
                    .map(
                      (final int i, final _ViewPageTabs x) =>
                          MapEntry<int, Widget>(
                        i,
                        Tab(
                          text: x.getTitleCase(
                            context.t,
                            media.type.asTenkaType,
                          ),
                        ),
                      ),
                    )
                    .values
                    .toList(),
              ),
            ),
          ),
        ),
      ],
      body: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: TabBarView(
          controller: tabController,
          children: <Widget>[
            buildTabBarViewPage(
              context: context,
              builder: (final _) => ViewPageOverview(media),
            ),
            buildTabBarViewPage(
              context: context,
              builder: (final _) => ViewPageContent(media),
            ),
          ],
        ),
      ),
    );
  }
}

class _SliverTabBarHeaderDelegate extends SliverPersistentHeaderDelegate {
  const _SliverTabBarHeaderDelegate(this.tabBar);

  final TabBar tabBar;

  @override
  Widget build(final BuildContext context, final _, final __) => DecoratedBox(
        decoration:
            BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
        child: tabBar,
      );

  @override
  bool shouldRebuild(final _SliverTabBarHeaderDelegate oldDelegate) => false;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;
}
