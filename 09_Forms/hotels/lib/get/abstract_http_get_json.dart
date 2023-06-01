import '../models/models.dart';

abstract class AbstractGetHotelDataInfo {

  Future<(List<HotelPreview>, bool)> getDataHotelPreview();
  Future<(List<HotelPreview>, bool)> getDataHotelPreviewWithTimeOut();

  Future<(HotelInfoRecognize?, bool)> getDataHotelInfo({required String uuid});
  Future<(HotelInfoRecognize?, bool)>  getDataHotelInfoWithTimeOut({required String uuid});

}