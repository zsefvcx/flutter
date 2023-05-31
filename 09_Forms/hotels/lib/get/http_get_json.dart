import 'dart:convert' as convert;

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:hotels/models/models.dart';

enum TypeSender{
  hotelPreviewSnd,
  hotelInfoSnd,
}

class GetDataInfo{
  late bool _isError;
  late bool _isLoading;

  bool get isError => _isError;
  bool get isLoading => _isLoading;

  GetDataInfo(){
    _isError = false;
    _isLoading = true;
  }

  Future<(List<HotelPreview>, bool, bool)> getDataHotelPreview() async{
    List<HotelPreview> data = [];
    try{
      var url = Uri.https('run.mocky.io',
          '/v3/ac888dc5-d193-4700-b12c-abb43e289301');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
        data = jsonResponse.map((e) {
          if (e is Map<String, dynamic>) {
            return HotelPreview.fromJson(e);
          } else {
            throw 'Error received data ${e.runtimeType}';
          }
        }).toList();
        _isError = false;
        _isLoading = false;
      } else {
        throw 'Request failed with status: ${response.statusCode}.';
      }
    } catch (e, t) {
      debugPrint('recognition error jsonResponse. Error:\n$e \n$t');
      _isError = true;
      _isLoading = false;
    }
    return (data, _isError, _isLoading);
  }

  Future<(List<dynamic>, bool, bool)> getDataHotelInfo({required String uuid}) async{
    List<dynamic> data = [];
    try{
      var url = Uri.https('run.mocky.io','/v3/$uuid');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body) as Map<String,dynamic>;

        HotelInfo hotelInfo = HotelInfo.fromJson(jsonResponse);
        HotelAddress hotelAddress = HotelAddress.fromJson(hotelInfo.address);
        HotelServices hotelServices = HotelServices.fromJson(hotelInfo.services);
        HotelCoords hotelCoords = HotelCoords.fromJson(hotelAddress.coords);
        data.addAll([
          hotelInfo,
          hotelAddress,
          hotelServices,
          hotelCoords,
        ]);

        _isError = false;
        _isLoading = false;
      } else {
        throw 'Request failed with status: ${response.statusCode}.';
      }
    } catch (e, t) {
      debugPrint('recognition error jsonResponse. Error:\n$e \n$t');
      _isError = true;
      _isLoading = false;
    }
    return (data, _isError, _isLoading);
  }

}