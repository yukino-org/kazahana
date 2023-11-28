import 'package:kazahana/core/exports.dart';
import 'package:kazahana/ui/exports.dart';
import 'package:kazahana/ui/pages/_home/view.dart';
import 'package:kazahana/ui/pages/_splash/view.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    AppLoader.initializeLevel1().then((final _) async {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(final BuildContext context) => PageTransitionSwitcher(
        duration: AnimationDurations.defaultLongAnimation,
        transitionBuilder: (
          final Widget child,
          final Animation<double> animation,
          final Animation<double> secondaryAnimation,
        ) =>
            FadeThroughTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        ),
        child: AppLoader.ready
            ? const UnderScoreHomePage()
            : const UnderScoreSplashPage(),
      );
}
