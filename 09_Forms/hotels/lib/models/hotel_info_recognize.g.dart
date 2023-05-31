// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_info_recognize.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelInfoRecognize _$HotelInfoRecognizeFromJson(Map<String, dynamic> json) =>
    HotelInfoRecognize(
      json['uuid'] as String,
      json['name'] as String? ?? 'None',
      json['poster'] as String,
      HotelAddress.fromJson(json['address'] as Map<String, dynamic>),
      (json['price'] as num?)?.toDouble() ?? 0,
      (json['rating'] as num?)?.toDouble() ?? 0,
      HotelServices.fromJson(json['services'] as Map<String, dynamic>),
      (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$HotelInfoRecognizeToJson(HotelInfoRecognize instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'poster': instance.poster,
      'address': instance.address.toJson(),
      'price': instance.price,
      'rating': instance.rating,
      'services': instance.services.toJson(),
      'photos': instance.photos,
    };
