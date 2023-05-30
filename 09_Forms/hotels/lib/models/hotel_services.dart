import 'package:json_annotation/json_annotation.dart';

part 'hotel_services.g.dart';

@JsonSerializable(explicitToJson: true)
class HotelServices{
  @JsonKey(defaultValue: [])
  final List<String> free;
  @JsonKey(defaultValue: [])
  final List<String> paid;

  HotelServices(this.free, this.paid);

  factory HotelServices.fromJson(Map<String, dynamic> json) =>
      _$HotelServicesFromJson(json);
  Map<String, dynamic> toJson() => _$HotelServicesToJson(this);

  @override
  String toString() {
    return 'free: $free\n'
           'paid: $paid';
  }
}