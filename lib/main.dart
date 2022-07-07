import 'package:flutter/material.dart';
import 'package:ocebot/firebase_options.dart';
import 'package:ocebot/pages/login_page.dart';
import 'package:ocebot/providers/auth_provider.dart';
import 'themes.dart';
import 'pages/entry_form.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'pages/main_page.dart';
import 'pages/auth_checker.dart';
import 'pages/loading_screen.dart';
import 'pages/error_screen.dart';
import 'providers/auth_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _auth = ref.watch(authenticationProvider);
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ocebot',
      theme: OcebotTheme.lightTheme,
      home: LoginScreen()
    );
  }
}

