import 'package:flutter/material.dart';
import '../../../../core/export/export.dart';
//main page
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppServicesGetIt();
  runApp(
    const AppMaterial(),
  );
}




class AppMaterial extends StatelessWidget {
  const AppMaterial({super.key});

  @override
  Widget build(final BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // ignore: lines_longer_than_80_chars
        BlocProvider<SettingsAppCubit>(
          create: (final context) =>
              instance<SettingsAppCubit>()..getSettingsApp(),
        ),
        BlocProvider<NotificationCubit>(
          create: (final context) => instance<NotificationCubit>(),
        ),
      ],
      child: BlocListener<NotificationCubit, NotificationState>(
        listener: (final context, final state) {
          if (state.flowStateApp == FlowStateApp.newNotification) {
            instance<LocalNotification>()
                .showNotification(state.currentNotification);
          }
        },
        child: const AppMaterials(),
      ),
    );
  }
}

class AppMaterials extends StatefulWidget {
  const AppMaterials({
    super.key,
  });

  @override
  State<AppMaterials> createState() => _AppMaterialsState();
}

class _AppMaterialsState extends State<AppMaterials>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final appSettings = context.select((SettingsAppCubit cubit) => cubit);
      return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: instance<AppRouter>().router,
        localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
        title: AppStrings.appName,
        supportedLocales: AppLocalizationsSetup.supportedLocales,
        localeResolutionCallback:
            AppLocalizationsSetup.localeResolutionCallBack,
        locale: appSettings.state.settingsApp.languageSettings.locale,
        themeMode: appSettings.state.settingsApp.themeSettings.themeMode,
        theme: appSettings.getThemes.getLightTheme,
        darkTheme: appSettings.getThemes.getLightTheme,
      );
    });
  }
}



