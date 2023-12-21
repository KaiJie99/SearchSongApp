import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:song_assessment/models/song_model.dart';
import 'package:song_assessment/pages/home_page.dart';
import 'package:song_assessment/pages/song_details_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SongModel>(
      create: (_)=> SongModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
        routes: {
          '/homePage': (context)=> HomePage(),
          '/songDetails': (context) => SongDetailsPage(),
        },
      ),
    );
  }
}

