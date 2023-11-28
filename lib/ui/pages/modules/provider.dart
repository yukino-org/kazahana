import 'package:kazahana/core/exports.dart';
import 'package:kazahana/ui/exports.dart';

class ModulesPageProvider extends StatedChangeNotifier {
  final Set<String> installing = <String>{};
  final Set<String> uninstalling = <String>{};

  Future<void> installTenkaStore(final String storeUrl) async {
    try {
      await TenkaManager.installStore(storeUrl);
    } catch (error) {
      Toast(
        content:
            Text('${Translator.currentTranslation.somethingWentWrong} $error'),
      ).show();
    }
    if (!mounted) return;
    notifyListeners();
  }

  Future<void> uninstallTenkaStore(final String storeUrl) async {
    await TenkaManager.uninstallStore(storeUrl);
    if (!mounted) return;
    notifyListeners();
  }

  Future<void> installTenkaModule(final TenkaMetadata metadata) async {
    installing.add(metadata.id);
    notifyListeners();
    await TenkaManager.installModule(metadata);
    if (!mounted) return;
    installing.remove(metadata.id);
    notifyListeners();
  }

  Future<void> uninstallTenkaModule(final TenkaMetadata metadata) async {
    uninstalling.add(metadata.id);
    notifyListeners();
    await TenkaManager.uninstallModule(metadata);
    if (!mounted) return;
    uninstalling.remove(metadata.id);
    notifyListeners();
  }
}
