class FilmeModel {
  late final String title;
  late final int episodeId;
  late final String openingCrawl;
  late final String director;
  late final String producer;
  late final String releaseDate;
  late final List<String> characters;
  late final List<String> planets;
  late final List<String> starships;
  late final List<String> vehicles;
  late final List<String> species;
  late final String created;
  late final String edited;
  late final String url;

  FilmeModel(
      {required this.title,
      required this.episodeId,
      required this.openingCrawl,
      required this.director,
      required this.producer,
      required this.releaseDate,
      required this.characters,
      required this.planets,
      required this.starships,
      required this.vehicles,
      required this.species,
      required this.created,
      required this.edited,
      required this.url});

  FilmeModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    episodeId = json['episode_id'];
    openingCrawl = json['opening_crawl'];
    director = json['director'];
    producer = json['producer'];
    releaseDate = json['release_date'];
    characters = json['characters'].cast<String>();
    planets = json['planets'].cast<String>();
    starships = json['starships'].cast<String>();
    vehicles = json['vehicles'].cast<String>();
    species = json['species'].cast<String>();
    created = json['created'];
    edited = json['edited'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = title;
    data['episode_id'] = episodeId;
    data['opening_crawl'] = openingCrawl;
    data['director'] = director;
    data['producer'] = producer;
    data['release_date'] = releaseDate;
    data['characters'] = characters;
    data['planets'] = planets;
    data['starships'] = starships;
    data['vehicles'] = vehicles;
    data['species'] = species;
    data['created'] = created;
    data['edited'] = edited;
    data['url'] = url;
    return data;
  }
}
