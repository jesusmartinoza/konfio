/// Class that represent dog object.
/// Instead of fromJson and toJson could use Freezed package :p
class DogModel {
  final String dogName;
  final String description;
  final int age;
  final String image;

  DogModel({
    required this.dogName,
    required this.description,
    required this.age,
    required this.image,
  });

  factory DogModel.fromJson(Map<String, dynamic> json) {
    return DogModel(
      dogName: json['dogName'],
      description: json['description'],
      age: json['age'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dogName': dogName,
      'description': description,
      'age': age,
      'image': image,
    };
  }
}
