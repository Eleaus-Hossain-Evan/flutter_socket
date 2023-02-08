import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_socket/route/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'application/global.dart';
import 'application/local_storage/storage_handler.dart';
import 'utils/utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final container = ProviderContainer(
    observers: [ProviderLog()],
  );

  Logger.init(
    true, // isEnable ，if production ，please false
    isShowFile: false, // In the IDE, whether the file name is displayed
    isShowTime: false, // In the IDE, whether the time is displayed
    levelVerbose: 247,
    levelDebug: 15,
    levelInfo: 10,
    levelWarn: 5,
    levelError: 9,
    phoneVerbose: Colors.white,
    phoneDebug: Colors.lightBlue,
    phoneInfo: Colors.greenAccent,
    phoneWarn: Colors.yellow.shade600,
    phoneError: Colors.redAccent,
  );

  final box = container.read(hiveProvider);
  await box.init();

  // container.read(firebasePushNotificationProvider);
  container.read(themeProvider);

  final String token = box.get(KStrings.token, defaultValue: '');

  NetworkHandler.instance
    ..setup(baseUrl: APIRoute.BASE_URL, showLogs: false)
    ..setToken(
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MDcyOTcyMzYsImRhdGEiOnsiX2lkIjoiNjNjY2RmY2U3OTFmNDgxZDAyOWNjOTJkIiwicm9sZSI6InVzZXIifSwiaWF0IjoxNjc1NzYxMjM2fQ.Gwm5UO-6Zv3Jr6Po-RdOj_IGqLjpMNIC8Iy5cmEaaoY');

  Logger.d('token: $token');

  runApp(
    ProviderScope(
      parent: container,
      child: const MyApp(),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(themeProvider).theme;
    final router = ref.watch(routerProvider);

    return ScreenUtilInit(
      designSize: const Size(411.4, 843.4),
      builder: (context, child) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: MaterialApp.router(
            title: 'LMS',
            debugShowCheckedModeBanner: false,
            themeMode: mode.isEmpty
                ? ThemeMode.system
                : mode == "dark"
                    ? ThemeMode.dark
                    : ThemeMode.light,
            theme: MyTheme.lightTheme,
            darkTheme: MyTheme.darkTheme,
            scaffoldMessengerKey: ref.watch(scaffoldKeyProvider),
            routeInformationParser: router.routeInformationParser,
            routerDelegate: router.routerDelegate,
            routeInformationProvider: router.routeInformationProvider,

            scrollBehavior: const ScrollBehavior().copyWith(
              physics: const BouncingScrollPhysics(),
            ),
            // home: child,
            builder: BotToastInit(),
          ),
        );
      },
    );
  }
}

class ProviderLog extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    Logger.i('''
{
  "PROVIDER": "${provider.name}; ${provider.runtimeType.toString()}"
  
}''');
    log("$newValue");
  }
}
