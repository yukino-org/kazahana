import 'package:kazahana/core/exports.dart';
import 'package:kazahana/ui/exports.dart';
import 'package:kazahana/ui/pages/_home/components/exports.dart';
import 'package:kazahana/ui/pages/_home/provider.dart';

class UnderScoreHomePage extends StatelessWidget {
  const UnderScoreHomePage({
    super.key,
  });

  @override
  Widget build(final BuildContext context) =>
      ChangeNotifierProvider<UnderScoreHomePageProvider>(
        create: (final _) => UnderScoreHomePageProvider()..initialize(),
        lazy: false,
        child: Consumer<UnderScoreHomePageProvider>(
          builder: (
            final BuildContext context,
            final UnderScoreHomePageProvider provider,
            final _,
          ) =>
              Scaffold(
            appBar: const UnderScoreHomePageAppBar(),
            extendBody: true,
            body: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: context.r.scale(2.5)),
              child: const UnderScoreHomePageBody(),
            ),
            bottomNavigationBar:
                UnderScoreHomePageBottomBar(provider: provider),
          ),
        ),
      );
}
