// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_services.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelServices _$HotelServicesFromJson(Map<String, dynamic> json) =>
    HotelServices(
      (json['free'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
      (json['paid'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
    );

Map<String, dynamic> _$HotelServicesToJson(HotelServices instance) =>
    <String, dynamic>{
      'free': instance.free,
      'paid': instance.paid,
    };
