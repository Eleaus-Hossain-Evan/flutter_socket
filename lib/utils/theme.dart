//** THEME CONTROLLER */
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../application/local_storage/storage_handler.dart';
import 'utils.dart';

final themeProvider = ChangeNotifierProvider<ThemeController>((ref) {
  final database = ref.watch(databaseService);

  return ThemeController(database);
});

class ThemeController with ChangeNotifier {
  ThemeController(this._database);

  late final DatabaseService _database;

  String get theme => _database.savedTheme;

  void toggle(bool mode) {
    (mode)
        ? _database.toggleSaveTheme("dark")
        : _database.toggleSaveTheme("light");

    notifyListeners();
  }
}

//** DATABASE CLASS */
final databaseService = Provider<DatabaseService>((ref) {
  return DatabaseService(ref);
});

class DatabaseService {
  final Ref ref;

  DatabaseService(this.ref) {
    initTheme();
  }

  get savedTheme => ref.watch(hiveProvider).get(KStrings.theme);

  void initTheme() {
    ref.watch(hiveProvider).put(KStrings.theme, 'light');
  }

  void toggleSaveTheme(String mode) =>
      ref.watch(hiveProvider).put(KStrings.theme, mode);
}

class MyTheme {
  static final lightTheme = FlexThemeData.light(
    scheme: FlexScheme.money,
    surfaceMode: FlexSurfaceMode.highSurfaceLowScaffold,
    blendLevel: 4,
    appBarStyle: FlexAppBarStyle.material,
    tabBarStyle: FlexTabBarStyle.forBackground,
    lightIsWhite: true,
    tooltipsMatchBackground: true,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 40,
      buttonMinSize: Size.fromHeight(40),
      elevatedButtonRadius: 8.0,
      outlinedButtonRadius: 8.0,
      elevatedButtonSchemeColor: SchemeColor.onInverseSurface,
      elevatedButtonSecondarySchemeColor: SchemeColor.primary,
      outlinedButtonOutlineSchemeColor: SchemeColor.primary,
      switchSchemeColor: SchemeColor.primary,
      checkboxSchemeColor: SchemeColor.primary,
      radioSchemeColor: SchemeColor.primary,
      unselectedToggleIsColored: true,
      inputDecoratorSchemeColor: SchemeColor.primaryContainer,
      inputDecoratorRadius: 40.0,
      inputDecoratorUnfocusedHasBorder: false,
      fabUseShape: false,
      snackBarBackgroundSchemeColor: SchemeColor.outline,
      chipSchemeColor: SchemeColor.primaryContainer,
      chipRadius: 40.0,
      dialogRadius: 8.0,
      timePickerDialogRadius: 8.0,
      // buttonMinSize: Size.fromHeight(40),
      bottomNavigationBarSelectedLabelSchemeColor: SchemeColor.primary,
      bottomNavigationBarUnselectedLabelSchemeColor:
          SchemeColor.onPrimaryContainer,
      bottomNavigationBarSelectedIconSchemeColor: SchemeColor.primary,
      bottomNavigationBarUnselectedIconSchemeColor:
          SchemeColor.onPrimaryContainer,
      navigationBarUnselectedLabelSchemeColor: SchemeColor.onSecondaryContainer,
      navigationBarUnselectedIconSchemeColor: SchemeColor.onSecondaryContainer,
      navigationBarBackgroundSchemeColor: SchemeColor.background,
      appBarBackgroundSchemeColor: SchemeColor.background,
    ),
    keyColors: const FlexKeyColors(
      useSecondary: true,
      useTertiary: true,
      keepPrimary: true,
      keepSecondary: true,
      keepTertiary: true,
      keepPrimaryContainer: true,
      keepSecondaryContainer: true,
      keepTertiaryContainer: true,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    // To use the playground font, add GoogleFonts package and uncomment
    // fontFamily: GoogleFonts.notoSans().fontFamily,
  );
  static final darkTheme = FlexThemeData.dark(
    scheme: FlexScheme.money,
    surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
    blendLevel: 15,
    appBarStyle: FlexAppBarStyle.material,
    tabBarStyle: FlexTabBarStyle.forBackground,
    tooltipsMatchBackground: true,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 30,
      buttonMinSize: Size.fromHeight(40),
      elevatedButtonRadius: 8.0,
      outlinedButtonRadius: 8.0,
      elevatedButtonSchemeColor: SchemeColor.onInverseSurface,
      elevatedButtonSecondarySchemeColor: SchemeColor.primary,
      outlinedButtonOutlineSchemeColor: SchemeColor.primary,
      switchSchemeColor: SchemeColor.primary,
      checkboxSchemeColor: SchemeColor.primary,
      radioSchemeColor: SchemeColor.primary,

      unselectedToggleIsColored: true,
      inputDecoratorRadius: 40.0,
      inputDecoratorUnfocusedHasBorder: false,
      fabUseShape: false,
      snackBarBackgroundSchemeColor: SchemeColor.outline,
      chipSchemeColor: SchemeColor.primaryContainer,
      chipRadius: 40.0,
      dialogRadius: 8.0,
      timePickerDialogRadius: 8.0,
      // buttonMinSize: Size.fromHeight(40),
      bottomNavigationBarSelectedLabelSchemeColor: SchemeColor.primary,
      bottomNavigationBarUnselectedLabelSchemeColor:
          SchemeColor.onPrimaryContainer,
      bottomNavigationBarSelectedIconSchemeColor: SchemeColor.primary,
      bottomNavigationBarUnselectedIconSchemeColor:
          SchemeColor.onPrimaryContainer,
      navigationBarUnselectedLabelSchemeColor: SchemeColor.onSecondaryContainer,
      navigationBarUnselectedIconSchemeColor: SchemeColor.onSecondaryContainer,
      navigationBarBackgroundSchemeColor: SchemeColor.background,
      appBarBackgroundSchemeColor: SchemeColor.background,
      dialogBackgroundSchemeColor: SchemeColor.primaryContainer,
    ),
    keyColors: const FlexKeyColors(
      useSecondary: true,
      useTertiary: true,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    // To use the playground font, add GoogleFonts package and uncomment
    // fontFamily: GoogleFonts.notoSans().fontFamily,
  );
// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,
}
