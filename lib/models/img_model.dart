class ImgModel {
  final int id;
  final String image;
  final String title;
  final String body;

  ImgModel({
    required this.id,
    required this.image,
    required this.title,
    required this.body,
  });

  factory ImgModel.fromJson(Map<String, dynamic> json) {
    return ImgModel(
      id: json['id'] as int,
      image: json['image'] as String,
      title: json['tile'] as String, // Note: JSON has 'tile'
      body: json['body'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'image': image, 'tile': title, 'body': body};
  }
}
