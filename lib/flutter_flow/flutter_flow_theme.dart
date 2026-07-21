// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';

SharedPreferences? _prefs;

abstract class FlutterFlowTheme {
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();

  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static FlutterFlowTheme of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? DarkModeTheme()
        : LightModeTheme();
  }

  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;

  late Color onPrimary;
  late Color primaryContainer;
  late Color onPrimaryContainer;
  late Color onSecondary;
  late Color secondaryContainer;
  late Color onSecondaryContainer;
  late Color onAccent;
  late Color accentContainer;
  late Color onAccentContainer;
  late Color onBackground;
  late Color onSurface;
  late Color surfaceVariant;
  late Color onSurfaceVariant;
  late Color onSuccess;
  late Color onWarning;
  late Color onError;
  late Color onInfo;
  late Color transparent;
  late Color fullContrast;
  late Color onPrimaryContainer60;
  late Color onPrimaryContainer20;
  late Color background40;
  late Color onPrimaryContainer30;
  late Color background60;
  late Color onPrimaryContainer40;
  late Color fullContrast60;
  late Color secondary10;
  late Color secondary30;
  late Color primary20;
  late Color secondaryText40;
  late Color background15;
  late Color background80;

  FFDesignTokens get designToken => FFDesignTokens(this);

  @Deprecated('Use displaySmallFamily instead')
  String get title1Family => displaySmallFamily;
  @Deprecated('Use displaySmall instead')
  TextStyle get title1 => typography.displaySmall;
  @Deprecated('Use headlineMediumFamily instead')
  String get title2Family => typography.headlineMediumFamily;
  @Deprecated('Use headlineMedium instead')
  TextStyle get title2 => typography.headlineMedium;
  @Deprecated('Use headlineSmallFamily instead')
  String get title3Family => typography.headlineSmallFamily;
  @Deprecated('Use headlineSmall instead')
  TextStyle get title3 => typography.headlineSmall;
  @Deprecated('Use titleMediumFamily instead')
  String get subtitle1Family => typography.titleMediumFamily;
  @Deprecated('Use titleMedium instead')
  TextStyle get subtitle1 => typography.titleMedium;
  @Deprecated('Use titleSmallFamily instead')
  String get subtitle2Family => typography.titleSmallFamily;
  @Deprecated('Use titleSmall instead')
  TextStyle get subtitle2 => typography.titleSmall;
  @Deprecated('Use bodyMediumFamily instead')
  String get bodyText1Family => typography.bodyMediumFamily;
  @Deprecated('Use bodyMedium instead')
  TextStyle get bodyText1 => typography.bodyMedium;
  @Deprecated('Use bodySmallFamily instead')
  String get bodyText2Family => typography.bodySmallFamily;
  @Deprecated('Use bodySmall instead')
  TextStyle get bodyText2 => typography.bodySmall;

  String get displayLargeFamily => typography.displayLargeFamily;
  bool get displayLargeIsCustom => typography.displayLargeIsCustom;
  TextStyle get displayLarge => typography.displayLarge;
  String get displayMediumFamily => typography.displayMediumFamily;
  bool get displayMediumIsCustom => typography.displayMediumIsCustom;
  TextStyle get displayMedium => typography.displayMedium;
  String get displaySmallFamily => typography.displaySmallFamily;
  bool get displaySmallIsCustom => typography.displaySmallIsCustom;
  TextStyle get displaySmall => typography.displaySmall;
  String get headlineLargeFamily => typography.headlineLargeFamily;
  bool get headlineLargeIsCustom => typography.headlineLargeIsCustom;
  TextStyle get headlineLarge => typography.headlineLarge;
  String get headlineMediumFamily => typography.headlineMediumFamily;
  bool get headlineMediumIsCustom => typography.headlineMediumIsCustom;
  TextStyle get headlineMedium => typography.headlineMedium;
  String get headlineSmallFamily => typography.headlineSmallFamily;
  bool get headlineSmallIsCustom => typography.headlineSmallIsCustom;
  TextStyle get headlineSmall => typography.headlineSmall;
  String get titleLargeFamily => typography.titleLargeFamily;
  bool get titleLargeIsCustom => typography.titleLargeIsCustom;
  TextStyle get titleLarge => typography.titleLarge;
  String get titleMediumFamily => typography.titleMediumFamily;
  bool get titleMediumIsCustom => typography.titleMediumIsCustom;
  TextStyle get titleMedium => typography.titleMedium;
  String get titleSmallFamily => typography.titleSmallFamily;
  bool get titleSmallIsCustom => typography.titleSmallIsCustom;
  TextStyle get titleSmall => typography.titleSmall;
  String get labelLargeFamily => typography.labelLargeFamily;
  bool get labelLargeIsCustom => typography.labelLargeIsCustom;
  TextStyle get labelLarge => typography.labelLarge;
  String get labelMediumFamily => typography.labelMediumFamily;
  bool get labelMediumIsCustom => typography.labelMediumIsCustom;
  TextStyle get labelMedium => typography.labelMedium;
  String get labelSmallFamily => typography.labelSmallFamily;
  bool get labelSmallIsCustom => typography.labelSmallIsCustom;
  TextStyle get labelSmall => typography.labelSmall;
  String get bodyLargeFamily => typography.bodyLargeFamily;
  bool get bodyLargeIsCustom => typography.bodyLargeIsCustom;
  TextStyle get bodyLarge => typography.bodyLarge;
  String get bodyMediumFamily => typography.bodyMediumFamily;
  bool get bodyMediumIsCustom => typography.bodyMediumIsCustom;
  TextStyle get bodyMedium => typography.bodyMedium;
  String get bodySmallFamily => typography.bodySmallFamily;
  bool get bodySmallIsCustom => typography.bodySmallIsCustom;
  TextStyle get bodySmall => typography.bodySmall;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFFD97A5F);
  late Color secondary = const Color(0xFF8DAA91);
  late Color tertiary = const Color(0xFF324A3E);
  late Color alternate = const Color(0xFFE8E1D5);
  late Color primaryText = const Color(0xFF2C2C2C);
  late Color secondaryText = const Color(0xFF6B655E);
  late Color primaryBackground = const Color(0xFFFAF7F2);
  late Color secondaryBackground = const Color(0xFFFFFFFF);
  late Color accent1 = const Color(0x00000000);
  late Color accent2 = const Color(0x00000000);
  late Color accent3 = const Color(0xFFA69F95);
  late Color accent4 = const Color(0x00000000);
  late Color success = const Color(0xFF6B8E6E);
  late Color warning = const Color(0xFFE6A23C);
  late Color error = const Color(0xFFC05648);
  late Color info = const Color(0xFF7A9E9F);

  late Color onPrimary = const Color(0xFFFFFFFF);
  late Color primaryContainer = const Color(0x1AD97A5F);
  late Color onPrimaryContainer = const Color(0xFF2C2C2C);
  late Color onSecondary = const Color(0xFFFFFFFF);
  late Color secondaryContainer = const Color(0x1A8DAA91);
  late Color onSecondaryContainer = const Color(0xFF2C2C2C);
  late Color onAccent = const Color(0xFFFFFFFF);
  late Color accentContainer = const Color(0x1A324A3E);
  late Color onAccentContainer = const Color(0xFF2C2C2C);
  late Color onBackground = const Color(0xFF2C2C2C);
  late Color onSurface = const Color(0xFF2C2C2C);
  late Color surfaceVariant = const Color(0xFFEBE4D8);
  late Color onSurfaceVariant = const Color(0xFF6B655E);
  late Color onSuccess = const Color(0xFFFFFFFF);
  late Color onWarning = const Color(0xFFFFFFFF);
  late Color onError = const Color(0xFFFFFFFF);
  late Color onInfo = const Color(0xFFFFFFFF);
  late Color transparent = const Color(0x00000000);
  late Color fullContrast = const Color(0xFF000000);
  late Color onPrimaryContainer60 = const Color(0x992C2C2C);
  late Color onPrimaryContainer20 = const Color(0x332C2C2C);
  late Color background40 = const Color(0x66FAF7F2);
  late Color onPrimaryContainer30 = const Color(0x4D2C2C2C);
  late Color background60 = const Color(0x99FAF7F2);
  late Color onPrimaryContainer40 = const Color(0x662C2C2C);
  late Color fullContrast60 = const Color(0x99000000);
  late Color secondary10 = const Color(0x1A8DAA91);
  late Color secondary30 = const Color(0x4D8DAA91);
  late Color primary20 = const Color(0x33D97A5F);
  late Color secondaryText40 = const Color(0x666B655E);
  late Color background15 = const Color(0x26FAF7F2);
  late Color background80 = const Color(0xCCFAF7F2);
}

abstract class Typography {
  String get displayLargeFamily;
  bool get displayLargeIsCustom;
  TextStyle get displayLarge;
  String get displayMediumFamily;
  bool get displayMediumIsCustom;
  TextStyle get displayMedium;
  String get displaySmallFamily;
  bool get displaySmallIsCustom;
  TextStyle get displaySmall;
  String get headlineLargeFamily;
  bool get headlineLargeIsCustom;
  TextStyle get headlineLarge;
  String get headlineMediumFamily;
  bool get headlineMediumIsCustom;
  TextStyle get headlineMedium;
  String get headlineSmallFamily;
  bool get headlineSmallIsCustom;
  TextStyle get headlineSmall;
  String get titleLargeFamily;
  bool get titleLargeIsCustom;
  TextStyle get titleLarge;
  String get titleMediumFamily;
  bool get titleMediumIsCustom;
  TextStyle get titleMedium;
  String get titleSmallFamily;
  bool get titleSmallIsCustom;
  TextStyle get titleSmall;
  String get labelLargeFamily;
  bool get labelLargeIsCustom;
  TextStyle get labelLarge;
  String get labelMediumFamily;
  bool get labelMediumIsCustom;
  TextStyle get labelMedium;
  String get labelSmallFamily;
  bool get labelSmallIsCustom;
  TextStyle get labelSmall;
  String get bodyLargeFamily;
  bool get bodyLargeIsCustom;
  TextStyle get bodyLarge;
  String get bodyMediumFamily;
  bool get bodyMediumIsCustom;
  TextStyle get bodyMedium;
  String get bodySmallFamily;
  bool get bodySmallIsCustom;
  TextStyle get bodySmall;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Plus Jakarta Sans';
  bool get displayLargeIsCustom => false;
  TextStyle get displayLarge => GoogleFonts.plusJakartaSans(
        fontWeight: FontWeight.bold,
        fontSize: 58.0,
        height: 1.1,
      );
  String get displayMediumFamily => 'Plus Jakarta Sans';
  bool get displayMediumIsCustom => false;
  TextStyle get displayMedium => GoogleFonts.plusJakartaSans(
        fontWeight: FontWeight.bold,
        fontSize: 46.0,
        height: 1.15,
      );
  String get displaySmallFamily => 'Plus Jakarta Sans';
  bool get displaySmallIsCustom => false;
  TextStyle get displaySmall => GoogleFonts.plusJakartaSans(
        fontWeight: FontWeight.bold,
        fontSize: 38.0,
        height: 1.2,
      );
  String get headlineLargeFamily => 'Plus Jakarta Sans';
  bool get headlineLargeIsCustom => false;
  TextStyle get headlineLarge => GoogleFonts.plusJakartaSans(
        fontWeight: FontWeight.bold,
        fontSize: 32.0,
        height: 1.2,
      );
  String get headlineMediumFamily => 'Plus Jakarta Sans';
  bool get headlineMediumIsCustom => false;
  TextStyle get headlineMedium => GoogleFonts.plusJakartaSans(
        fontWeight: FontWeight.w600,
        fontSize: 26.0,
        height: 1.3,
      );
  String get headlineSmallFamily => 'Plus Jakarta Sans';
  bool get headlineSmallIsCustom => false;
  TextStyle get headlineSmall => GoogleFonts.plusJakartaSans(
        fontWeight: FontWeight.w600,
        fontSize: 24.0,
        height: 1.3,
      );
  String get titleLargeFamily => 'Plus Jakarta Sans';
  bool get titleLargeIsCustom => false;
  TextStyle get titleLarge => GoogleFonts.plusJakartaSans(
        fontWeight: FontWeight.w600,
        fontSize: 21.0,
        height: 1.4,
      );
  String get titleMediumFamily => 'Plus Jakarta Sans';
  bool get titleMediumIsCustom => false;
  TextStyle get titleMedium => GoogleFonts.plusJakartaSans(
        fontWeight: FontWeight.w600,
        fontSize: 17.0,
        height: 1.4,
      );
  String get titleSmallFamily => 'Plus Jakarta Sans';
  bool get titleSmallIsCustom => false;
  TextStyle get titleSmall => GoogleFonts.plusJakartaSans(
        fontWeight: FontWeight.w600,
        fontSize: 14.0,
        height: 1.4,
      );
  String get labelLargeFamily => 'Outfit';
  bool get labelLargeIsCustom => false;
  TextStyle get labelLarge => GoogleFonts.outfit(
        fontWeight: FontWeight.w600,
        fontSize: 14.0,
        height: 1.3,
      );
  String get labelMediumFamily => 'Outfit';
  bool get labelMediumIsCustom => false;
  TextStyle get labelMedium => GoogleFonts.outfit(
        fontWeight: FontWeight.w600,
        fontSize: 12.0,
        height: 1.3,
      );
  String get labelSmallFamily => 'Outfit';
  bool get labelSmallIsCustom => false;
  TextStyle get labelSmall => GoogleFonts.outfit(
        fontWeight: FontWeight.w600,
        fontSize: 10.0,
        height: 1.2,
      );
  String get bodyLargeFamily => 'Outfit';
  bool get bodyLargeIsCustom => false;
  TextStyle get bodyLarge => GoogleFonts.outfit(
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
        height: 1.6,
      );
  String get bodyMediumFamily => 'Outfit';
  bool get bodyMediumIsCustom => false;
  TextStyle get bodyMedium => GoogleFonts.outfit(
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
        height: 1.6,
      );
  String get bodySmallFamily => 'Outfit';
  bool get bodySmallIsCustom => false;
  TextStyle get bodySmall => GoogleFonts.outfit(
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
        height: 1.5,
      );
}

class DarkModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFFE39682);
  late Color secondary = const Color(0xFFA5C0A8);
  late Color tertiary = const Color(0xFFF1E6D6);
  late Color alternate = const Color(0xFF3D3A37);
  late Color primaryText = const Color(0xFFFAF7F2);
  late Color secondaryText = const Color(0xFFC7C1B8);
  late Color primaryBackground = const Color(0xFF1A1A1A);
  late Color secondaryBackground = const Color(0xFF2C2C2C);
  late Color accent1 = const Color(0x00000000);
  late Color accent2 = const Color(0x00000000);
  late Color accent3 = const Color(0xFF8C867E);
  late Color accent4 = const Color(0x00000000);
  late Color success = const Color(0xFF8DAA91);
  late Color warning = const Color(0xFFEBCB8B);
  late Color error = const Color(0xFFD97A5F);
  late Color info = const Color(0xFF81A1C1);

  late Color onPrimary = const Color(0xFFFFFFFF);
  late Color primaryContainer = const Color(0x24E39682);
  late Color onPrimaryContainer = const Color(0xFFFAF7F2);
  late Color onSecondary = const Color(0xFFFFFFFF);
  late Color secondaryContainer = const Color(0x24A5C0A8);
  late Color onSecondaryContainer = const Color(0xFFFAF7F2);
  late Color onAccent = const Color(0xFF000000);
  late Color accentContainer = const Color(0x24F1E6D6);
  late Color onAccentContainer = const Color(0xFFFAF7F2);
  late Color onBackground = const Color(0xFFFAF7F2);
  late Color onSurface = const Color(0xFFFAF7F2);
  late Color surfaceVariant = const Color(0xFF3D3D3D);
  late Color onSurfaceVariant = const Color(0xFFC7C1B8);
  late Color onSuccess = const Color(0xFFFFFFFF);
  late Color onWarning = const Color(0xFF000000);
  late Color onError = const Color(0xFFFFFFFF);
  late Color onInfo = const Color(0xFFFFFFFF);
  late Color transparent = const Color(0x00000000);
  late Color fullContrast = const Color(0xFFFFFFFF);
  late Color onPrimaryContainer60 = const Color(0x99FAF7F2);
  late Color onPrimaryContainer20 = const Color(0x33FAF7F2);
  late Color background40 = const Color(0x661A1A1A);
  late Color onPrimaryContainer30 = const Color(0x4DFAF7F2);
  late Color background60 = const Color(0x991A1A1A);
  late Color onPrimaryContainer40 = const Color(0x66FAF7F2);
  late Color fullContrast60 = const Color(0x99FFFFFF);
  late Color secondary10 = const Color(0x1AA5C0A8);
  late Color secondary30 = const Color(0x4DA5C0A8);
  late Color primary20 = const Color(0x33E39682);
  late Color secondaryText40 = const Color(0x66C7C1B8);
  late Color background15 = const Color(0x261A1A1A);
  late Color background80 = const Color(0xCC1A1A1A);
}

class FFDesignTokens {
  const FFDesignTokens(this.theme);
  final FlutterFlowTheme theme;
  FFSpacing get spacing => const FFSpacing();
  FFRadius get radius => const FFRadius();
  FFShadows get shadow => FFShadows(theme);
}

class FFSpacing {
  const FFSpacing();
  double get none => 0.0;
  double get xs => 4.0;
  double get sm => 8.0;
  double get md => 16.0;
  double get lg => 24.0;
  double get xl => 32.0;
  double get xxl => 48.0;
  double get xxxl => 64.0;
}

class FFRadius {
  const FFRadius();
  double get none => 0.0;
  double get xs => 4.0;
  double get sm => 8.0;
  double get md => 16.0;
  double get lg => 24.0;
  double get xl => 32.0;
  double get xxl => 40.0;
  double get full => 9999.0;
}

class FFShadows {
  const FFShadows(this.theme);
  final FlutterFlowTheme theme;
  BoxShadow get none => const BoxShadow(
      blurRadius: 0.0,
      color: Color(0x00000000),
      offset: Offset(0.0, 0.0),
      spreadRadius: 0.0);
  BoxShadow get xs => const BoxShadow(
      blurRadius: 4.0,
      color: Color(0x0A2C2C2C),
      offset: Offset(0.0, 2.0),
      spreadRadius: 0.0);
  BoxShadow get sm => const BoxShadow(
      blurRadius: 8.0,
      color: Color(0x0F2C2C2C),
      offset: Offset(0.0, 4.0),
      spreadRadius: 0.0);
  BoxShadow get md => const BoxShadow(
      blurRadius: 16.0,
      color: Color(0x142C2C2C),
      offset: Offset(0.0, 8.0),
      spreadRadius: -2.0);
  BoxShadow get lg => const BoxShadow(
      blurRadius: 24.0,
      color: Color(0x1A2C2C2C),
      offset: Offset(0.0, 12.0),
      spreadRadius: -4.0);
  BoxShadow get xl => const BoxShadow(
      blurRadius: 40.0,
      color: Color(0x212C2C2C),
      offset: Offset(0.0, 20.0),
      spreadRadius: -8.0);
  BoxShadow get xxl => const BoxShadow(
      blurRadius: 64.0,
      color: Color(0x292C2C2C),
      offset: Offset(0.0, 32.0),
      spreadRadius: -12.0);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    TextStyle? font,
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = false,
    TextDecoration? decoration,
    double? lineHeight,
    List<Shadow>? shadows,
    String? package,
  }) {
    if (useGoogleFonts && fontFamily != null && fontFamily.isNotEmpty) {
      font = GoogleFonts.getFont(fontFamily,
          fontWeight: fontWeight ?? this.fontWeight,
          fontStyle: fontStyle ?? this.fontStyle);
    }

    return font != null
        ? font.copyWith(
            color: color ?? this.color,
            fontSize: fontSize ?? this.fontSize,
            letterSpacing: letterSpacing ?? this.letterSpacing,
            fontWeight: fontWeight ?? this.fontWeight,
            fontStyle: fontStyle ?? this.fontStyle,
            decoration: decoration,
            height: lineHeight,
            shadows: shadows,
          )
        : copyWith(
            fontFamily: fontFamily,
            package: package,
            color: color,
            fontSize: fontSize,
            letterSpacing: letterSpacing,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            decoration: decoration,
            height: lineHeight,
            shadows: shadows,
          );
  }
}
