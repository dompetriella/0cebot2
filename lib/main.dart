import 'package:flutter/material.dart';
import 'package:ocebot/firebase_options.dart';
import 'package:ocebot/providers/auth_provider.dart';
import 'themes.dart';
import 'pages/entry_form.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'pages/main_page.dart';
import 'pages/auth_checker.dart';
import 'pages/loading_screen.dart';
import 'pages/error_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: const MyApp()));
}

final firebaseInitializerProvider = FutureProvider<FirebaseApp>((ref) async {
  return await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
});

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inititalize = ref.watch(firebaseInitializerProvider);
    final _auth = ref.watch(authenticationProvider);
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ocebot',
      theme: OcebotTheme.lightTheme,
      home: inititalize.when(
        data: (data) {
          return AuthChecker();
        },
        loading: () => const LoadingScreen(),
        error: (e, stackTrace) => ErrorScreen(e, stackTrace)
      ),
    );
  }
}

