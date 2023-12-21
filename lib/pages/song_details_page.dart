import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:song_assessment/models/song_model.dart';

import '../entitys/song_entity.dart';

class SongDetailsPage extends StatefulWidget {
  const SongDetailsPage({this.title});

  final String? title;

  @override
  State<SongDetailsPage> createState() => _SongDetailsPageState();
}

class _SongDetailsPageState extends State<SongDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SongModel>(builder: (context, model, child){
      final List<Songs> filteredSongs = model.songDetails!.songs!.where((e) => e.title == widget.title).toList();
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Song Detail'
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(right: 16.0, left: 16.0),
          child: Column(
            children: [
              ...filteredSongs.map((e) =>
              Column(
                children: [
                  Text('Rank: ${e.rank}'),
                  Text('Title: ${e.title}'),
                  Text('Artist: ${e.artist}'),
                  Text('Album: ${e.album}'),
                  Text('Year: ${e.year}'),
                ],
              )
              )
            ],
          ),
        ),
      );
    });
  }
}
