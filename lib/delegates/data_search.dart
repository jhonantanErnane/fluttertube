import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertube/store/theme_store.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class DataSearch extends SearchDelegate<String> {
  DataSearch() : super(searchFieldLabel: 'procurar');

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    Future.delayed(Duration.zero).then((_) => close(context, query));
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    } else {
      return FutureBuilder<List>(
        future: suggestions(query),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(snapshot.data[index]),
                leading: Icon(Icons.play_arrow),
                onTap: () {
                  close(context, snapshot.data[index]);
                },
              );
            },
          );
        },
      );
    }
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Provider.of<ThemeStore>(context).isDarkTheme
        ? ThemeData.dark()
        : ThemeData.light().copyWith(
            inputDecorationTheme: InputDecorationTheme(
            hintStyle:
                Theme.of(context).textTheme.title.copyWith(color: Colors.white60),
          ));
  }

  Future<List> suggestions(String search) async {
    http.Response response = await http.get(
        'http://suggestqueries.google.com/complete/search?hl=en&ds=yt&client=youtube&hjson=t&cp=1&q=$search&format=5&alt=json');
    if (response.statusCode == 200) {
      return json.decode(response.body)[1].map((d) => d[0]).toList();
    } else {
      throw Exception('Failed to load suggestions');
    }
  }
}
