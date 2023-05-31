import 'package:json_annotation/json_annotation.dart';

import 'package:hotels/models/models.dart';

part 'hotel_info_recognize.g.dart';

@JsonSerializable(explicitToJson: true)
class HotelInfoRecognize{
  final String uuid;
  @JsonKey(defaultValue: 'None')
  final String name;
  final String poster;
  final HotelAddress address;
  @JsonKey(defaultValue: 0)
  final double price;
  @JsonKey(defaultValue: 0)
  final double rating;
  final HotelServices services;
  final List<String> photos;

  HotelInfoRecognize(this.uuid, this.name, this.poster, this.address,
      this.price, this.rating, this.services, this.photos);

  factory HotelInfoRecognize.fromJson(Map<String, dynamic> json) =>
      _$HotelInfoRecognizeFromJson(json);
  Map<String, dynamic> toJson() => _$HotelInfoRecognizeToJson(this);

  @override
  String toString() {
    return 'uuid: $uuid\n'
        'name: $name\n'
        'poster: $poster\n'
        'price: $price\n'
        'photos: $photos\n'
        'rating: $rating\n'
        'services: $services\n'
        'address: $address';

  }

}