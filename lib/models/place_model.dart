class PlaceModel {
  const PlaceModel({
    required this.name,
    required this.location,
    required this.image,
    required this.description,
    required this.tag,
    required this.rating,
    required this.bestTime,
    required this.duration,
  });

  final String name;
  final String location;
  final String image;
  final String description;
  final String tag;
  final String rating;
  final String bestTime;
  final String duration;

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      name: json['name'] as String,
      location: json['location'] as String,
      image: json['image'] as String,
      description: json['description'] as String,
      tag: json['tag'] as String,
      rating: json['rating'] as String,
      bestTime: json['bestTime'] as String,
      duration: json['duration'] as String,
    );
  }
}
