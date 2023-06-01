import '../models/models.dart';

abstract class AbstractGetHotelDataInfo {

  Future<(List<HotelPreview>, bool)> getDataHotelPreview();

  Future<(HotelInfoRecognize?, bool)> getDataHotelInfo({required String uuid});

}