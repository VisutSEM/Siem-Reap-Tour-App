class ImgModel {
  final int id;
  final int rating;
  final String image;
  final String title;
  final String body;

  ImgModel({
    required this.id,
    required this.rating,
    required this.image,
    required this.title,
    required this.body,
  });

  factory ImgModel.fromJson(Map<String, dynamic> json) {
    return ImgModel(
      id: json['id'] as int,
      rating: json['rating'] as int,
      image: json['image'] as String,
      title: json['tile'] as String, // Note: JSON has 'tile'
      body: json['body'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'rating': rating,
      'image': image,
      'tile': title,
      'body': body,
    };
  }
}
