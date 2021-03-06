import 'dart:async';
import 'package:kazahana/core/exports.dart';
import '../../../exports.dart';

class UnderScoreHomePageAppBar extends StatefulWidget
    implements PreferredSizeWidget {
  const UnderScoreHomePageAppBar({
    super.key,
  });

  @override
  State<UnderScoreHomePageAppBar> createState() =>
      _UnderScoreHomePageAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _UnderScoreHomePageAppBarState extends State<UnderScoreHomePageAppBar> {
  StreamSubscription<AppEvent>? appEventSubscription;

  @override
  void initState() {
    super.initState();

    appEventSubscription = AppEvents.stream.listen((final AppEvent event) {
      if (event != AppEvent.anilistStateChange) return;
      setState(() {});
    });
  }

  @override
  void dispose() {
    appEventSubscription?.cancel();

    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => AppBar(
        centerTitle: true,
        title: Text(
          AppMeta.name,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontFamily: Fonts.greatVibes,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
        ),
        actions: <Widget>[
          Row(
            children: <Widget>[
              SizedBox.square(
                dimension: context.r.size(1.5),
                child: GestureDetector(
                  child: AnilistAuth.user?.avatarLarge != null
                      ? ClipRRect(
                          borderRadius:
                              BorderRadius.circular(context.r.size(1)),
                          child: Image.network(AnilistAuth.user!.avatarLarge!),
                        )
                      : ClipRRect(
                          borderRadius:
                              BorderRadius.circular(context.r.size(0.2)),
                          child: Image.asset(AssetPaths.anilistLogo),
                        ),
                  onTap: () {
                    Navigator.of(context).pusher.pushToAnilistPage();
                  },
                ),
              ),
            ],
          ),
          SizedBox(width: context.r.size(0.5)),
        ],
      );
}
