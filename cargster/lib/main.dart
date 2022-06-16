import 'package:cargster/screens/welcome/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './local/app_localizations.dart';
import './routes.dart';
import './screens/home/home_screen.dart';
import './theme.dart';

//Provider container which holds the state of all my providers
//This would normally be inaccessible inside of the ProviderScope
final providerContainer = ProviderContainer();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(//Here is where we pass in the providerContainer declared above
      UncontrolledProviderScope(
    container: providerContainer,
    child: App(),
  ));
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: [
        Locale('en', 'US'),
        Locale('hr', ''),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      title: 'Cargster App',
      theme: theme(),
      // home: ShipperAddTransportersScreen(),
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (ctx, userSnapshot) {
            if (userSnapshot.hasData && (!userSnapshot.data.isAnonymous)) {
              return HomeScreen();
            }
            // Navigator.pop(context);
            return WelcomeScreen();
          }),
      routes: routes,
    );
  }
}
