import 'dart:convert' as convert;

import 'package:flutter/cupertino.dart';
import 'package:hotels/get/abstract_http_get_json.dart';
import 'package:http/http.dart' as http;

import 'package:hotels/models/models.dart';

class GetHotelDataInfo implements AbstractGetHotelDataInfo{

  final String _authority = 'run.mocky.io';
  final int _timeOut = 5;

  @override
  Future<(List<HotelPreview>, bool)> getDataHotelPreview() async{
    List<HotelPreview> data = [];
    bool isError = true;
    String unencodedPath = '/v3/ac888dc5-d193-4700-b12c-abb43e289301';
    try{
      var url = Uri.https(_authority, unencodedPath);
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
        isError = false;
      } else {
        throw 'Request failed with status: ${response.statusCode}.';
      }
    } catch (e, t) {
      debugPrint('recognition error jsonResponse. Error:\n$e \n$t');
      isError = true;
    }
    return (data, isError);
  }

  @override
  Future<(List<HotelPreview>, bool)> getDataHotelPreviewWithTimeOut() async =>
    await getDataHotelPreview().timeout(Duration(seconds: _timeOut),
      onTimeout: () {
        debugPrint('time out getDataHotelPreview.');
        return (<HotelPreview>[], true);
      },
    );

  @override
  Future<(HotelInfoRecognize?, bool)> getDataHotelInfo({required String uuid}) async{
    HotelInfoRecognize? data;
    bool isError = true;
    String unencodedPath = '/v3/$uuid';
    try{
      var url = Uri.https(_authority, unencodedPath);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body) as Map<String,dynamic>;
        data = HotelInfoRecognize.fromJson(jsonResponse);
        isError = false;
      } else {
        throw 'Request failed with status: ${response.statusCode}.';
      }
    } catch (e, t) {
      debugPrint('recognition error jsonResponse. Error:\n$e \n$t');
      isError = true;
    }
    return (data, isError);
  }

  @override
  Future<(HotelInfoRecognize?, bool)> getDataHotelInfoWithTimeOut({required String uuid}) async =>
      await getDataHotelInfo(uuid: uuid).timeout(Duration(seconds: _timeOut),
        onTimeout: () {
          debugPrint('time out getDataHotelInfo.');
          return (null, true);
        },
      );

}