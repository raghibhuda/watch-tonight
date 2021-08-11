import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watch_tonight/providers/navigation_providers.dart';
import 'package:watch_tonight/providers/user_provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            onGenerateRoute: NavigationProvider.of(context).onGenerateRoute,
          );
        },
      ),
    );
  }
}
