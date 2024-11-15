part of 'app_config.dart';

/// uygulama teması
class AppTheme {
  AppTheme._();

  /// uygulama teması
  static ThemeData get appLightTheme => _theme();

  /// uygulama teması dark
  static ThemeData get appDarkTheme => _themeDark();

  /// uygulama teması
  static ThemeData _theme() => FlexThemeData.light(
    scheme: FlexScheme.verdunHemlock,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 40,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 10,
      blendOnColors: false,
      useTextTheme: true,
      useM2StyleDividerInM3: true,
      adaptiveSplash: FlexAdaptive.apple(),
      splashTypeAdaptive: FlexSplashType.inkRipple,
      textButtonRadius: 11.0,
      filledButtonRadius: 3.0,
      elevatedButtonRadius: 9.0,
      elevatedButtonSecondarySchemeColor: SchemeColor.onSecondaryContainer,
      inputDecoratorBorderType: FlexInputBorderType.underline,
      inputDecoratorUnfocusedBorderIsColored: false,
      fabUseShape: true,
      fabRadius: 14.0,
      alignedDropdown: true,
      useInputDecoratorThemeInDialogs: true,
      menuPadding: EdgeInsetsDirectional.fromSTEB(32, 0, 0, 0),
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    // To use the Playground font, add GoogleFonts package and uncomment
    // fontFamily: GoogleFonts.notoSans().fontFamily,
  );

  /// uygulama teması dark
  static ThemeData _themeDark() => FlexThemeData.dark(
        primary: const Color(0xFFff7f00),
        secondary: const Color(0xFF333333),
        tertiary: const Color(0xffF2F2F2),
        onPrimary: const Color(0xFFFFFFFF),
        primaryContainer: const Color(0xFF333333),
        onPrimaryContainer: const Color(0xFFFFFFFF),
        onSecondary: const Color(0xFF333333),
        secondaryContainer: const Color(0xFFFFFFFF),
        onSecondaryContainer: const Color(0xFF333333),
        onTertiary: const Color(0xFFFFFFFF),
        tertiaryContainer: const Color(0xFFFFFFFF),
        onTertiaryContainer: const Color(0xFF9D9D9D),
        appBarBackground: const Color(0xFF121212),
        surface: const Color(0xFF1C1C1C),
        dialogBackground: const Color(0xFF1C1C1C),
        error: const Color(0xFFFF1111),
        background: const Color(0xFF000000),
        onBackground: const Color(0xFFFFFFFF),
        onError: const Color(0xFFE2E2E2),
        onSurface: const Color(0xFFFFFFFF),
        scaffoldBackground: const Color(0xff111111),
        appBarElevation: 0.5,
        blendLevel: 0,
        subThemesData: const FlexSubThemesData(
          defaultRadius: 10,
          popupMenuRadius: 5,
          bottomSheetRadius: 25,
          inputDecoratorFillColor: Color(0x00ffffff),
          inputDecoratorSchemeColor: SchemeColor.primary,
        ),
        textTheme: _textTheme(Colors.white),
        fontFamily: GoogleFonts.montserrat().fontFamily,
      );

  static TextTheme? _textTheme(Color textColor) => TextTheme(
        titleLarge: TextStyle(
          color: textColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          color: textColor,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        titleSmall: TextStyle(
          color: textColor,
          fontSize: 15,
          fontWeight: FontWeight.w700,
        ),
        bodyLarge: TextStyle(
          color: textColor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        bodyMedium: TextStyle(
          color: textColor,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w200,
        ),
        labelLarge: TextStyle(
          color: textColor,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      );
}
