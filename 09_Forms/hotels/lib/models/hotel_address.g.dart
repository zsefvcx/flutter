// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelCoords _$HotelCoordsFromJson(Map<String, dynamic> json) => HotelCoords(
      (json['lat'] as num?)?.toDouble() ?? 0.0,
      (json['lan'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$HotelCoordsToJson(HotelCoords instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lan': instance.lan,
    };

HotelAddress _$HotelAddressFromJson(Map<String, dynamic> json) => HotelAddress(
      json['country'] as String? ?? 'None',
      json['street'] as String? ?? 'None',
      json['city'] as String? ?? 'None',
      json['zipCode'] as String? ?? 'None',
      HotelCoords.fromJson(json['coords'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HotelAddressToJson(HotelAddress instance) =>
    <String, dynamic>{
      'country': instance.country,
      'street': instance.street,
      'city': instance.city,
      'zipCode': instance.zipCode,
      'coords': instance.coords.toJson(),
    };
