import 'package:kazahana/core/exports.dart';
import 'package:kazahana/ui/exports.dart';
import 'package:kazahana/ui/pages/modules/provider.dart';

class ModulesPageTenkaRepositoriesDialog extends StatefulWidget {
  const ModulesPageTenkaRepositoriesDialog({
    required this.provider,
    super.key,
  });

  final ModulesPageProvider provider;

  @override
  State<ModulesPageTenkaRepositoriesDialog> createState() =>
      _ModulesPageTenkaRepositoriesDialogState();
}

class _ModulesPageTenkaRepositoriesDialogState
    extends State<ModulesPageTenkaRepositoriesDialog> {
  late TextEditingController textEditingController;
  bool showTextInput = false;
  bool hasTextInput = false;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(final BuildContext context) => Dialog(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: HorizontalBodyPadding.paddingValue(context),
              vertical: context.r.scale(0.5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  context.t.tenkaRepositories,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                ...TenkaManager.allStoresIterable().map(
                  (final String x) => ListTile(
                    title: Text(x),
                    trailing: IconButton(
                      onPressed: () {
                        widget.provider.uninstallTenkaStore(x);
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ),
                ),
                if (showTextInput)
                  LayoutBuilder(
                    builder: (
                      final BuildContext context,
                      final BoxConstraints constraints,
                    ) =>
                        SizedBox(
                      width: constraints.minWidth,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TextField(
                            controller: textEditingController,
                            onChanged: (final String text) {
                              setState(() {
                                hasTextInput = text.isNotEmpty;
                              });
                            },
                          ),
                          IconButton(
                            onPressed: () {
                              if (hasTextInput) {
                                widget.provider.installTenkaStore(
                                    textEditingController.text);
                              }
                              textEditingController.text = '';
                              showTextInput = false;
                            },
                            icon:
                                Icon(hasTextInput ? Icons.check : Icons.close),
                          ),
                        ],
                      ),
                    ),
                  ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        setState(() {
                          showTextInput = !showTextInput;
                        });
                      },
                      child: Text(context.t.add),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
