import 'package:kazahana/core/exports.dart';
import 'package:kazahana/ui/exports.dart';
import 'package:kazahana/ui/pages/modules/components/exports.dart';
import 'package:kazahana/ui/pages/modules/provider.dart';

class ModulesPage extends StatelessWidget {
  const ModulesPage({
    super.key,
  });

  VoidCallback createOnPressed({
    required final ModulesPageProvider provider,
    required final TenkaMetadata metadata,
  }) =>
      () {
        if (TenkaManager.isModuleInstalled(metadata)) {
          provider.uninstallTenkaModule(metadata);
          return;
        }
        provider.installTenkaModule(metadata);
      };

  Widget buildModuleTile({
    required final BuildContext context,
    required final ModulesPageProvider provider,
    required final TenkaMetadata metadata,
  }) {
    final bool isInstalling = provider.installing.contains(metadata.id);
    final bool isUninstalling = provider.uninstalling.contains(metadata.id);
    final bool isInstalled = TenkaManager.isModuleInstalled(metadata);

    final IconData icon;
    Color? iconColor;
    if (isInstalling) {
      icon = Icons.hourglass_bottom_rounded;
    } else if (isUninstalling) {
      icon = Icons.hourglass_bottom_rounded;
    } else if (isInstalled) {
      icon = Icons.done_rounded;
      iconColor = Theme.of(context).colorScheme.primary;
    } else {
      icon = Icons.add_rounded;
      iconColor = Theme.of(context).colorScheme.primary;
    }

    final VoidCallback? onPressed = isInstalling || isUninstalling
        ? null
        : createOnPressed(provider: provider, metadata: metadata);

    return ListTile(
      contentPadding: EdgeInsets.only(
        left: context.r.scale(0.75),
        right: context.r.scale(0.25),
      ),
      leading: SizedBox(
        height: double.infinity,
        child: SizedBox.square(
          dimension: context.r.scale(1.5),
          child: Image.network(
            TenkaManager.findStoreFromMetadataId(metadata.id)!
                .resolveUrl((metadata.thumbnail as TenkaCloudDS).url)
                .toString(),
          ),
        ),
      ),
      title: RichText(
        text: TextSpan(
          children: <InlineSpan>[
            TextSpan(text: metadata.name),
            if (metadata.nsfw)
              TextSpan(
                text: '  (${context.t.nsfw})',
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: ForegroundColors.red),
              ),
          ],
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      subtitle: Text(
        <String>[
          metadata.type.getTitleCase(context.t),
          context.t.byX(metadata.author),
          metadata.hash,
        ].join(' / '),
      ),
      trailing: IconButton(
        icon: Icon(icon, color: iconColor),
        onPressed: onPressed,
      ),
      onTap: onPressed,
    );
  }

  @override
  Widget build(final BuildContext context) =>
      ChangeNotifierProvider<ModulesPageProvider>(
        create: (final _) => ModulesPageProvider(),
        child: Consumer<ModulesPageProvider>(
          builder: (
            final BuildContext context,
            final ModulesPageProvider provider,
            final _,
          ) =>
              Scaffold(
            appBar: AppBar(
              title: Text(context.t.modules),
              actions: <Widget>[
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (final _) => ModulesPageTenkaRepositoriesDialog(
                        provider: provider,
                      ),
                    );
                  },
                  icon: const Icon(Icons.settings),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: TenkaManager.allModulesIterable()
                    .sortedBy((final TenkaMetadata x) => x.name)
                    .map(
                      (final TenkaMetadata x) => buildModuleTile(
                        context: context,
                        provider: provider,
                        metadata: x,
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      );
}
