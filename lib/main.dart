import 'package:aladia_demo_app/auth/presentation/bloc/bloc/theme_bloc.dart';
import 'package:aladia_demo_app/auth/presentation/bloc/bloc/theme_state.dart';
import 'package:aladia_demo_app/routes/bloc_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'routes/apps_route.dart';
import 'package:aladia_demo_app/core/injection/injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  final router = await AppRouter.router;
  runApp(MyApp(router: router));
}

class MyApp extends StatelessWidget {
  final GoRouter router;
  final BlocMultiProvider blocMultiProvider = BlocMultiProvider();

  MyApp({Key? key, required this.router}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocMultiProvider.blocMultiProvider(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: AppRouter.router,
            title: 'Aladia',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              brightness: Brightness.light,
              primaryColorDark: Colors.white,
              primaryColor: Colors.white,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(color: Colors.white),
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primaryColorDark: Colors.black,
              primaryColor: Colors.black,
              scaffoldBackgroundColor: Colors.black,
              appBarTheme: const AppBarTheme(color: Colors.black),
            ),
            themeMode:
                state.themeMode, // Use the current theme mode from ThemeBloc
          );
        },
      ),
    );
  }
}
