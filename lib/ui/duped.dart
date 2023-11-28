import 'package:kazahana/core/exports.dart';
import 'package:kazahana/ui/components/exports.dart';
import 'package:kazahana/ui/utils/exports.dart';

class DupedApp extends StatelessWidget {
  const DupedApp({
    super.key,
  });

  @override
  Widget build(final BuildContext context) => WidgetsApp(
        color: Colors.transparent,
        builder: (final BuildContext context, final _) => Composer(
          child: Container(
            color: context.colorScheme.background,
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    AppMeta.name,
                    style: context.textTheme.heading.copyWith(
                      fontFamily: Fonts.greatVibes,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    context.t.youCanCloseThisWindow,
                    style: context.textTheme.body,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
