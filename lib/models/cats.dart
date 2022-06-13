import 'package:json_annotation/json_annotation.dart';
part 'cats.g.dart';

@JsonSerializable()
class Breed{
  String id;
  String name;
  String description;
  String temperament;

  Breed({required this.id, required this.name,required this.description,required this.temperament});

  factory Breed.fromJson(Map<String, dynamic> json) => _$BreedFromJson(json);
  Map<String, dynamic> toJson() => _$BreedToJson(this);
}
@JsonSerializable()
class BreedList{
  List<Breed> breeds;

  BreedList({required this.breeds});
  factory BreedList.fromJson(List<dynamic> json) {
    return BreedList(
        breeds: json
            .map((e) => Breed.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}
@JsonSerializable()
class Cat{
  String name;
  String description;
  String life_span;

  Cat({required this.name,required this.description,required this.life_span});
  factory Cat.fromJson(Map<String, dynamic> json) => _$CatFromJson(json);

  Map<String, dynamic> toJson() => _$CatToJson(this);
}
@JsonSerializable()
class CatBreed{
  String id;
  String url;
  int width;
  int height;
  List<Cat> breeds;

  CatBreed({required this.id,required this.url,required this.width,required this.height, required this.breeds});
  factory CatBreed.fromJson(Map<String, dynamic> json) =>
      _$CatBreedFromJson(json);

  Map<String, dynamic> toJson() => _$CatBreedToJson(this);

}
@JsonSerializable()
class CatList{
  List<CatBreed> breeds;

  CatList({required this.breeds});
  factory CatList.fromJson(List<dynamic> json) {
    return CatList(
        breeds: json
            .map((e) => CatBreed.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}
