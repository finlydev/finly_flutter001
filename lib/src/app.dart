import 'package:finly_flutter001/src/bloc/login/login_bloc.dart';
import 'package:finly_flutter001/src/pages/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'pages/login/login_page.dart';

final navigatorState = GlobalKey<NavigatorState>();
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider(create: (context) => LoginBloc());
    return MultiBlocProvider(
        providers: [
          loginBloc
        ],
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'c variableName = ;',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      routes: AppRoute.all,
      home: LoginPage(),
          navigatorKey: navigatorState,
    ),
    );
  }
}
