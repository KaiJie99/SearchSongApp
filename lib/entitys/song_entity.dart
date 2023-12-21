class SongDetails {
  List<Songs>? songs;

  SongDetails({this.songs});

  SongDetails.fromJson(Map<String, dynamic> json) {
    if (json['songs'] != null) {
      songs = <Songs>[];
      json['songs'].forEach((v) {
        songs!.add(new Songs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.songs != null) {
      data['songs'] = this.songs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Songs {
  num? rank;
  String? title;
  String? artist;
  String? album;
  String? year;

  Songs({this.rank, this.title, this.artist, this.album, this.year});

  Songs.fromJson(Map<String, dynamic> json) {
    rank = json['rank'];
    title = json['title'];
    artist = json['artist'];
    album = json['album'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rank'] = this.rank;
    data['title'] = this.title;
    data['artist'] = this.artist;
    data['album'] = this.album;
    data['year'] = this.year;
    return data;
  }
}