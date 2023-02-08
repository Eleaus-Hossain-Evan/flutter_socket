//** THEME CONTROLLER */
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    scheme: FlexScheme.hippieBlue,
    appBarElevation: 5.0,
    lightIsWhite: true,
    subThemesData: const FlexSubThemesData(
      useFlutterDefaults: true,
      defaultRadius: 8.0,
      elevatedButtonSchemeColor: SchemeColor.onPrimary,
      elevatedButtonSecondarySchemeColor: SchemeColor.primary,
      outlinedButtonOutlineSchemeColor: SchemeColor.primary,
      unselectedToggleIsColored: true,
      inputDecoratorIsFilled: false,
      inputDecoratorRadius: 8.0,
      dialogBackgroundSchemeColor: SchemeColor.onPrimary,
      dialogRadius: 24.0,
      timePickerDialogRadius: 24.0,
      appBarBackgroundSchemeColor: SchemeColor.onPrimary,
      bottomSheetRadius: 24.0,
    ),

    keyColors: const FlexKeyColors(
      useSecondary: true,
      useTertiary: true,
      keepPrimary: true,
      keepTertiary: true,
    ),
    tones: FlexTones.vividBackground(Brightness.light)
        .onMainsUseBW()
        .onSurfacesUseBW(),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    // To use the playground font, add GoogleFonts package and uncomment
    fontFamily: GoogleFonts.notoSans().fontFamily,
  );
  static final darkTheme = FlexThemeData.dark(
    scheme: FlexScheme.hippieBlue,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 15,
    subThemesData: const FlexSubThemesData(
      useFlutterDefaults: true,
      defaultRadius: 8.0,
      elevatedButtonSchemeColor: SchemeColor.onPrimary,
      elevatedButtonSecondarySchemeColor: SchemeColor.primary,
      outlinedButtonOutlineSchemeColor: SchemeColor.primary,
      unselectedToggleIsColored: true,
      inputDecoratorIsFilled: false,
      inputDecoratorRadius: 8.0,
      dialogBackgroundSchemeColor: SchemeColor.onPrimary,
      dialogRadius: 24.0,
      timePickerDialogRadius: 24.0,
      bottomSheetRadius: 24.0,
    ),
    keyColors: const FlexKeyColors(
      useSecondary: true,
      useTertiary: true,
    ),
    tones: FlexTones.vividBackground(Brightness.dark),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    // To use the Playground font, add GoogleFonts package and uncomment
    fontFamily: GoogleFonts.notoSans().fontFamily,
  );
// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,
}
