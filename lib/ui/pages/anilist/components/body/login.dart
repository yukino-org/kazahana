import 'package:kazahana/core/exports.dart';
import 'package:kazahana/ui/exports.dart';

class AnilistPageLoginBody extends StatelessWidget {
  const AnilistPageLoginBody({
    super.key,
  });

  @override
  Widget build(final BuildContext context) => SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: HorizontalBodyPadding.paddingValue(context),
          vertical: MediaQuery.of(context).size.height * 0.2,
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  AppMeta.name,
                  style: context.r
                      .builder(
                        () => ColorTheme.of(context).textTheme.displaySmall!,
                        md: () =>
                            ColorTheme.of(context).textTheme.displayMedium!,
                      )
                      .copyWith(fontFamily: Fonts.greatVibes),
                ),
                SizedBox(width: context.r.scale(1)),
                Text(
                  '+',
                  style: ColorTheme.of(context).textTheme.titleLarge!.copyWith(
                        color: ColorTheme.of(context)
                            .textTheme
                            .titleLarge!
                            .color!
                            .withOpacity(0.3),
                      ),
                ),
                SizedBox(width: context.r.scale(1)),
                ClipRRect(
                  borderRadius: BorderRadius.circular(context.r.scale(0.5)),
                  child: SizedBox.square(
                    dimension: context.r.scale(3, md: 4),
                    child: Image.asset(
                      AssetPaths.anilistLogo,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: context.r.scale(1)),
            const Divider(),
            SizedBox(height: context.r.scale(1)),
            Text(
              context.t.trackYourProgressUsingAnilist,
              style: ColorTheme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: context.r.scale(1.5)),
            TextButton.icon(
              icon: const Icon(Icons.login_rounded),
              label: Text(context.t.loginUsingAnilist),
              style: OutlinedButton.styleFrom(
                backgroundColor:
                    ColorTheme.of(context).colorScheme.secondaryContainer,
                foregroundColor:
                    ColorTheme.of(context).colorScheme.onSecondaryContainer,
                textStyle: ColorTheme.of(context).textTheme.bodySmall,
                padding:
                    EdgeInsets.symmetric(horizontal: context.r.scale(0.75)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(context.r.scale(0.5)),
                ),
              ),
              onPressed: () async {
                try {
                  final bool didLaunch = await launchUrl(
                    Uri.parse(AnilistAuth.oauthUrl),
                    mode: LaunchMode.externalApplication,
                  );
                  if (!didLaunch) {
                    throw Exception('Failed to launch URL');
                  }
                } catch (error) {
                  if (!context.mounted) return;
                  Toast(
                    content: Text('${context.t.somethingWentWrong} $error'),
                  ).show();
                }
              },
            ),
          ],
        ),
      );
}
