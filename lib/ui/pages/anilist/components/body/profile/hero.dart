import 'package:kazahana/core/exports.dart';
import 'package:kazahana/ui/exports.dart';
import 'package:kazahana/ui/pages/anilist/components/body/profile/provider.dart';

class AnilistPageProfileBodyHero extends StatelessWidget {
  const AnilistPageProfileBodyHero({
    required this.provider,
    super.key,
  });

  final AnilistPageProfileProvider provider;

  Widget buildStatisticsChild({
    required final BuildContext context,
    required final String title,
    required final String value,
  }) =>
      RichText(
        text: TextSpan(
          children: <InlineSpan>[
            TextSpan(
              text: '$title: ',
              style: ColorTheme.of(context).textTheme.bodySmall,
            ),
            TextSpan(
              text: value,
              style: ColorTheme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: ColorTheme.of(context).colorScheme.primary,
                  ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      );

  List<Widget> buildStatisticsTiles(final BuildContext context) {
    switch (provider.category.type) {
      case AnilistMediaType.anime:
        final AnilistUserStatistics? stats = user.animeStatistics;
        return <Widget>[
          buildStatisticsChild(
            context: context,
            title: context.t.totalAnime,
            value: stats?.count.toString() ?? Translation.unk,
          ),
          buildStatisticsChild(
            context: context,
            title: context.t.episodesWatched,
            value: stats?.episodesWatched.toString() ?? Translation.unk,
          ),
          buildStatisticsChild(
            context: context,
            title: context.t.timeSpent,
            value: stats?.minutesWatched != null
                ? PrettyDurations.prettyHoursMinutesShort(
                    context.t,
                    Duration(minutes: stats!.minutesWatched!),
                  )
                : Translation.unk,
          ),
          buildStatisticsChild(
            context: context,
            title: context.t.meanScore,
            value: stats != null ? '${stats.meanScore}%' : Translation.unk,
          ),
        ];

      case AnilistMediaType.manga:
        final AnilistUserStatistics? stats = user.mangaStatistics;
        return <Widget>[
          buildStatisticsChild(
            context: context,
            title: context.t.totalManga,
            value: stats?.count.toString() ?? Translation.unk,
          ),
          buildStatisticsChild(
            context: context,
            title: context.t.volumesRead,
            value: stats?.volumesRead.toString() ?? Translation.unk,
          ),
          buildStatisticsChild(
            context: context,
            title: context.t.chaptersRead,
            value: stats?.chaptersRead.toString() ?? Translation.unk,
          ),
          buildStatisticsChild(
            context: context,
            title: context.t.meanScore,
            value: stats != null ? '${stats.meanScore}%' : Translation.unk,
          ),
        ];
    }
  }

  Widget buildHeroContent(final BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(context.r.scale(0.25)),
            child: SizedBox(
              height: context.r.scale(5),
              child: user.avatarLarge != null
                  ? Image.network(
                      user.avatarLarge!,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(AssetPaths.anilistLogo),
            ),
          ),
          SizedBox(width: context.r.scale(1)),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ...buildStatisticsTiles(context),
                const Divider(),
                Text(
                  user.name,
                  style: ColorTheme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
        ],
      );

  @override
  Widget build(final BuildContext context) => SliverList(
        delegate: SliverChildListDelegate.fixed(
          <Widget>[
            Container(
              color: ColorTheme.of(context).bottomAppBarTheme.color,
              height: context.r.scale(10),
              child: Stack(
                children: <Widget>[
                  if (user.bannerImage != null)
                    Positioned.fill(
                      child: Image.network(
                        user.bannerImage!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                            Colors.transparent,
                            ColorTheme.of(context)
                                .bottomAppBarTheme
                                .color!
                                .withOpacity(0.75),
                          ],
                        ),
                      ),
                      child: const SizedBox.expand(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.all(
                        HorizontalBodyPadding.paddingValue(context),
                      ),
                      child: buildHeroContent(context),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  AnilistUser get user => provider.pageProvider.user!;
}
