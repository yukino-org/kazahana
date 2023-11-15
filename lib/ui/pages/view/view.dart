import 'package:kazahana/core/exports.dart';
import 'package:kazahana/ui/exports.dart';
import 'package:kazahana/ui/pages/view/components/exports.dart';
import 'package:kazahana/ui/pages/view/provider.dart';

class ViewPage extends StatelessWidget {
  const ViewPage({
    required this.mediaId,
    this.media,
    super.key,
  });

  final int mediaId;
  final AnilistMedia? media;

  @override
  Widget build(final BuildContext context) => MultiProvider(
        providers: <SingleChildWidget>[
          ChangeNotifierProvider<ViewPageViewProvider>(
            create: (final _) => ViewPageViewProvider(),
          ),
          ChangeNotifierProvider<ViewPageProvider>(
            create: (final _) =>
                ViewPageProvider()..initialize(id: mediaId, media: media),
          ),
        ],
        child: Consumer<ViewPageProvider>(
          builder: (
            final BuildContext context,
            final ViewPageProvider provider,
            final _,
          ) =>
              Scaffold(
            appBar: const ViewPageAppBar(),
            extendBodyBehindAppBar: true,
            extendBody: true,
            body: StatedBuilder(
              provider.media.state,
              waiting: (final _) => const SizedBox.shrink(),
              processing: (final _) => const SizedBox.shrink(),
              finished: (final _) => const ViewPageBody(),
              failed: (final _) => const SizedBox.shrink(),
            ),
          ),
        ),
      );
}
