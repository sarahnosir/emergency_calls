import 'package:emergency_calls/view/home_screen.dart';
import 'package:emergency_calls/view/request_call_screen.dart';
import 'package:emergency_calls/view/requests_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'theme.dart';
import 'view model/app_view_model.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppViewModel(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Emergency Calls',
      theme: bulidapptheme(),
      routerConfig: _router,
    );
  }
}

final _router = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
  GoRoute(
      path: '/makerequest',
      builder: (context, state) => const RequestCallScreen()),
  GoRoute(
      path: '/requests', builder: (context, state) => const RequestsScreen()),
]);
