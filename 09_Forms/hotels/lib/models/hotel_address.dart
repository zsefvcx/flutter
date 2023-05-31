import 'package:json_annotation/json_annotation.dart';

part 'hotel_address.g.dart';

@JsonSerializable(explicitToJson: true)
class HotelCoords{
  @JsonKey(defaultValue: 0.00)
  final double lat;
  @JsonKey(defaultValue: 0.00)
  final double lan;

  HotelCoords(this.lat, this.lan);

  factory HotelCoords.fromJson(Map<String, dynamic> json) =>
      _$HotelCoordsFromJson(json);
  Map<String, dynamic> toJson() => _$HotelCoordsToJson(this);

  @override
  String toString() {
    return 'lat: $lat\n'
           'lan: $lan';
  }
}

@JsonSerializable(explicitToJson: true)
class HotelAddress{
  @JsonKey(defaultValue: 'None')
  final String country;
  @JsonKey(defaultValue: 'None')
  final String street;
  @JsonKey(defaultValue: 'None')
  final String city;
  @JsonKey(defaultValue: 'None')
  final String zipCode;

  final HotelCoords coords;

  HotelAddress(
      this.country, this.street, this.city, this.zipCode, this.coords);

  factory HotelAddress.fromJson(Map<String, dynamic> json) =>
      _$HotelAddressFromJson(json);
  Map<String, dynamic> toJson() => _$HotelAddressToJson(this);

  @override
  String toString() {
    return 'country: $country\n'
        'street: $street\n'
        'city: $city\n'
        'zipCode: $zipCode\n'
        'coords: $coords';
  }
}
