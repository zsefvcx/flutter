import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

import 'package:hotels/models/models.dart';

enum TypeSender{
  hotelPreviewSnd,
  hotelInfoSnd,
}

class GetDataHttp{

  TypeSender typeSender;

  GetDataHttp(this.typeSender);

  Future<(dynamic, bool, bool)> getData(
        String authority,
        String unencodedPath,
        Map<String, dynamic>? queryParameters
      ) async {
    bool isError = false;
    bool isLoading = true;
    dynamic data;
    try{
      var url = Uri.https(authority,
          unencodedPath, queryParameters);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        if (typeSender == TypeSender.hotelPreviewSnd) {
          var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
          //print(jsonResponse);

          data = jsonResponse.map((e) {
            if (e is Map<String, dynamic>) {
              return HotelPreview.fromJson(e);
            } else {
              throw 'Error received data $e';
            }
          }).toList();
        } else if (typeSender == TypeSender.hotelInfoSnd){
          var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
          //print(jsonResponse);

          HotelInfo hotelInfo = HotelInfo.fromJson(jsonResponse);
          HotelAddress hotelAddress = HotelAddress.fromJson(hotelInfo.address);
          HotelServices hotelServices = HotelServices.fromJson(hotelInfo.services);
          HotelCoords hotelCoords = HotelCoords.fromJson(hotelAddress.coords);
          List<dynamic> dataHotelInfo = [
            hotelInfo,
            hotelAddress,
            hotelServices,
            hotelCoords,
          ];

          data = dataHotelInfo;

        } else{
          throw 'Type data is not recognize ${data.runtimeType}.';
        }

        isLoading = false;
      } else {
        throw 'Request failed with status: ${response.statusCode}.';
      }
    } catch (e, t) {
      print('recognition error jsonResponse. Error:\n$e \n$t');
      isError = true;
      isLoading = false;
    }
    return (data, isError, isLoading);
  }


}