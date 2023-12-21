import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:song_assessment/models/song_model.dart';
import 'package:searchfield/searchfield.dart';
import 'package:song_assessment/pages/song_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchController = TextEditingController();
  bool _showSuggestions = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<SongModel>(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SearchField(
                          controller: _searchController,
                          suggestions: _showSuggestions
                              ? model.songDetails!.songs
                              ?.where((song) => song.title!.toLowerCase().contains(_searchController.text.toLowerCase()))
                              .map((e) => SearchFieldListItem(
                            '${e.title}',
                            item: e,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(child: Text('${e.title}')),
                                ],
                              ),
                            ),
                          ))
                              .toList() ??
                              []
                              : [],
                          onSuggestionTap: (item) {
                            print('it em select => ${item.searchKey}');
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> SongDetailsPage(title: item.searchKey,)));
                          },
                          onSearchTextChanged: (text) {
                            setState(() {
                              _showSuggestions = text.isNotEmpty;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(right: 16.0, left: 16.0),
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                ...model.songDetails!.songs!.map((e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(12.0)),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Rank ${e.rank}',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Title: ${e.title}'),
                                Text('Artist: ${e.artist}'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> SongDetailsPage(title: e.title,)));                    },
                  ),
                ))
              ],
            ),
          ),
        );
      },
    );
  }
}


