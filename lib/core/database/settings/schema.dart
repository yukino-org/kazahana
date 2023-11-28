import 'package:json_annotation/json_annotation.dart';
import 'package:kazahana/core/utils/exports.dart';
import 'package:kazahana/ui/utils/responsive.dart';

part 'schema.g.dart';

@JsonSerializable()
class SettingsSchema {
  SettingsSchema({
    this.locale,
    this.ignoreSSLCertificate = true,
    this.theme,
    this.themeMode,
    this.disableAnimations = false,
    this.scaleMultiplier = ResponsiveData.defaultScaleMultiplier,
  });

  factory SettingsSchema.fromJson(final JsonMap json) =>
      _$SettingsSchemaFromJson(json.cast<String, dynamic>());

  @JsonKey(fromJson: _localeFromJson, toJson: _localeToJson)
  Locale? locale;
  bool ignoreSSLCertificate;
  String? theme;
  String? themeMode;
  bool disableAnimations;
  double scaleMultiplier;

  JsonMap toJson() => _$SettingsSchemaToJson(this);

  static Locale? _localeFromJson(final String? value) =>
      value != null ? Locale.parse(value) : null;
  static String? _localeToJson(final Locale? value) => value?.code;
}
