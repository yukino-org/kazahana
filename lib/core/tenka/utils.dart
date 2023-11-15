import 'package:kazahana/core/translator/exports.dart';
import 'package:tenka/tenka.dart';

extension TenkaTypeUtils on TenkaType {
  String getTitleCase(final Translation translation) => switch (this) {
        TenkaType.anime => translation.anime,
        TenkaType.manga => translation.manga,
      };
}
