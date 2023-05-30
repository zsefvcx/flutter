import 'package:json_annotation/json_annotation.dart';

part 'hotel_info.g.dart';

@JsonSerializable(explicitToJson: true)
class HotelInfo {
  //uuid: ff14a060-abab-4305-8c1e-cd768036f6ef,
  final String uuid;
  //name: Golden Ratio,
  @JsonKey(defaultValue: 'None')
  final String name;
  //poster: golden_ratio_1.jpg,
  final String poster;

  // address: {
  // country: Spain,
  // street: Сан-Мигель Торремолинос,
  // city: Ампле,
  // zip_code: 416041,
  // coords: {
  //   lat: -31.31,
  //   lan: 76.311
  // }
  // },
  final Map<String, dynamic> address;

  //price: 2.1,
  @JsonKey(defaultValue: 0)
  double price;

  //rating: 7.2,
  @JsonKey(defaultValue: 0)
  double rating;

  // services: {
  // free: [
  // Номера для некурящих,
  // Бесплатный Wi-Fi,
  // Лифт,
  // Парковка,
  // Трансфер,
  // Wi-Fi доступен на всей территории,
  // Завтрак,
  // Телевизор
  // ],
  // paid: [
  // Wi-Fi доступен на всей территории,
  // Завтрак,
  // Телевизор
  // ]
  // },
  final Map<String, List<String>> services;

  // photos: [
  // golden_ratio_1.jpg,
  // golden_ratio_2.jpg,
  // golden_ratio_3.jpg,
  // golden_ratio_4.jpg,
  // golden_ratio_5.jpg,
  // golden_ratio_6.jpg,
  // golden_ratio_7.jpg,
  // golden_ratio_8.jpg
  // ]
  final  List<String> photos;

  HotelInfo({
    required this.uuid,
    required this.name,
    required this.poster,
    required this.price,
    required this.photos,
    required this.rating,
    required this.services,
    required this.address,
  });

  factory HotelInfo.fromJson(Map<String, dynamic> json) =>
      _$HotelInfoFromJson(json);
  Map<String, dynamic> toJson() => _$HotelInfoToJson(this);

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