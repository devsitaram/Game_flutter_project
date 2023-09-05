class GameModel {
  String? _sports;
  List<Data>? _data;

  GameModel({String? sports, List<Data>? data}) {
    if (sports != null) {
      this._sports = sports;
    }
    if (data != null) {
      this._data = data;
    }
  }

  String? get sports => _sports;
  set sports(String? sports) => _sports = sports;
  List<Data>? get data => _data;
  set data(List<Data>? data) => _data = data;

  GameModel.fromJson(Map<String, dynamic> json) {
    _sports = json['sports'];
    if (json['data'] != null) {
      _data = <Data>[];
      json['data'].forEach((v) {
        _data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sports'] = this._sports;
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? _id;
  String? _title;
  String? _thumbnail;
  String? _shortDescription;
  String? _gameUrl;
  String? _genre;
  String? _platform;
  String? _publisher;
  String? _developer;
  String? _releaseDate;
  String? _freetogameProfileUrl;

  Data(
      {int? id,
      String? title,
      String? thumbnail,
      String? shortDescription,
      String? gameUrl,
      String? genre,
      String? platform,
      String? publisher,
      String? developer,
      String? releaseDate,
      String? freetogameProfileUrl}) {
    if (id != null) {
      this._id = id;
    }
    if (title != null) {
      this._title = title;
    }
    if (thumbnail != null) {
      this._thumbnail = thumbnail;
    }
    if (shortDescription != null) {
      this._shortDescription = shortDescription;
    }
    if (gameUrl != null) {
      this._gameUrl = gameUrl;
    }
    if (genre != null) {
      this._genre = genre;
    }
    if (platform != null) {
      this._platform = platform;
    }
    if (publisher != null) {
      this._publisher = publisher;
    }
    if (developer != null) {
      this._developer = developer;
    }
    if (releaseDate != null) {
      this._releaseDate = releaseDate;
    }
    if (freetogameProfileUrl != null) {
      this._freetogameProfileUrl = freetogameProfileUrl;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get thumbnail => _thumbnail;
  set thumbnail(String? thumbnail) => _thumbnail = thumbnail;
  String? get shortDescription => _shortDescription;
  set shortDescription(String? shortDescription) =>
      _shortDescription = shortDescription;
  String? get gameUrl => _gameUrl;
  set gameUrl(String? gameUrl) => _gameUrl = gameUrl;
  String? get genre => _genre;
  set genre(String? genre) => _genre = genre;
  String? get platform => _platform;
  set platform(String? platform) => _platform = platform;
  String? get publisher => _publisher;
  set publisher(String? publisher) => _publisher = publisher;
  String? get developer => _developer;
  set developer(String? developer) => _developer = developer;
  String? get releaseDate => _releaseDate;
  set releaseDate(String? releaseDate) => _releaseDate = releaseDate;
  String? get freetogameProfileUrl => _freetogameProfileUrl;
  set freetogameProfileUrl(String? freetogameProfileUrl) =>
      _freetogameProfileUrl = freetogameProfileUrl;

  Data.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _thumbnail = json['thumbnail'];
    _shortDescription = json['short_description'];
    _gameUrl = json['game_url'];
    _genre = json['genre'];
    _platform = json['platform'];
    _publisher = json['publisher'];
    _developer = json['developer'];
    _releaseDate = json['release_date'];
    _freetogameProfileUrl = json['freetogame_profile_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['title'] = this._title;
    data['thumbnail'] = this._thumbnail;
    data['short_description'] = this._shortDescription;
    data['game_url'] = this._gameUrl;
    data['genre'] = this._genre;
    data['platform'] = this._platform;
    data['publisher'] = this._publisher;
    data['developer'] = this._developer;
    data['release_date'] = this._releaseDate;
    data['freetogame_profile_url'] = this._freetogameProfileUrl;
    return data;
  }
}
