import 'package:flutter/material.dart';
import 'package:fluttertube/screens/home.dart';
import 'package:fluttertube/services/shared_preferences_service.dart';
import 'package:fluttertube/store/favorite_store.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  var sharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp(SharedPreferencesService(sharedPreferences)));
}

class MyApp extends StatelessWidget {
  final SharedPreferencesService _preferencesService;

  const MyApp(this._preferencesService);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SharedPreferencesService>(
          create: (_) => _preferencesService,
        ),
        Provider<FavoriteStore>(
          create: (_) => FavoriteStore(_preferencesService),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Tube',
        theme: ThemeData.dark(),
        home: Home(),
      ),
    );
  }
}
