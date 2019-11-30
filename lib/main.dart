import 'package:flutter/material.dart';
import 'package:fluttertube/screens/home.dart';
import 'package:fluttertube/store/favorite_store.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FavoriteStore>(create: (_) => FavoriteStore(),)
      ],
      child: MaterialApp(
        title: 'Flutter Tube',
        theme: ThemeData.dark(),
        home: Home(),
      ),
    );
  }
}
