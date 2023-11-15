import 'package:kazahana/core/exports.dart';
import 'package:kazahana/ui/exports.dart';

class AnilistMediaSlide extends StatefulWidget {
  const AnilistMediaSlide(
    this.media, {
    super.key,
  });

  final AnilistMedia media;

  @override
  State<AnilistMediaSlide> createState() => _AnilistMediaSlideState();
}

class _AnilistMediaSlideState extends State<AnilistMediaSlide>
    with AutomaticKeepAliveClientMixin {
  Widget buildThumbnail(final BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(context.r.scale(1)),
        child: AspectRatio(
          aspectRatio: AnilistMediaTile.coverRatio,
          child: FadeInImage(
            placeholder: MemoryImage(Placeholders.transparent1x1Image),
            image: NetworkImage(widget.media.coverImageExtraLarge),
            fit: BoxFit.cover,
          ),
        ),
      );

  Widget buildContent(final BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Wrap(
            spacing: context.r.scale(0.25),
            runSpacing: context.r.scale(0.2),
            alignment: WrapAlignment.center,
            children: <Widget>[
              AnilistMediaTile.buildFormatChip(
                context: context,
                media: widget.media,
              ),
              AnilistMediaTile.buildWatchtimeChip(
                context: context,
                media: widget.media,
              ),
              if (widget.media.averageScore != null)
                AnilistMediaTile.buildRatingChip(
                  context: context,
                  media: widget.media,
                ),
              if (widget.media.startDate != null ||
                  widget.media.endDate != null)
                AnilistMediaTile.buildAirdateChip(
                  context: context,
                  media: widget.media,
                ),
              if (widget.media.isAdult)
                AnilistMediaTile.buildNSFWChip(
                  context: context,
                  media: widget.media,
                ),
            ],
          ),
          SizedBox(height: context.r.scale(0.5)),
          Text(
            widget.media.titleUserPreferred,
            style: context.r
                .responsive(
                  Theme.of(context).textTheme.titleLarge,
                  md: Theme.of(context).textTheme.headlineSmall,
                )!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: context.r.scale(0.25)),
          if (widget.media.description != null)
            Text(
              widget.media.description!,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
        ],
      );

  @override
  Widget build(final BuildContext context) {
    super.build(context);
    return Stack(
      children: <Widget>[
        Container(color: Theme.of(context).bottomAppBarTheme.color),
        Positioned.fill(
          child: FadeInImage(
            placeholder: MemoryImage(Placeholders.transparent1x1Image),
            image: NetworkImage(
              widget.media.bannerImage ?? widget.media.coverImageExtraLarge,
            ),
            fit: BoxFit.cover,
          ),
        ),
        if (widget.media.bannerImage == null)
          ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: const SizedBox.expand(),
            ),
          ),
        Positioned.fill(
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Theme.of(context)
                          .colorScheme
                          .background
                          .withOpacity(0.25),
                      Theme.of(context)
                          .colorScheme
                          .background
                          .withOpacity(0.75),
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context)
                    .pusher
                    .pushToViewPageFromMedia(widget.media);
              },
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: IgnorePointer(
            child: Padding(
              padding: EdgeInsets.all(context.r.scale(1)),
              child: context.r.responsiveBuilder(
                () => Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: buildThumbnail(context),
                    ),
                    SizedBox(height: context.r.scale(1)),
                    buildContent(context),
                  ],
                ),
                md: () => Row(
                  children: <Widget>[
                    buildThumbnail(context),
                    SizedBox(width: context.r.scale(1.5)),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          buildContent(context),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
