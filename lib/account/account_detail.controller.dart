import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dio_getx/model/detail.account.model.dart';
import 'package:flutter_dio_getx/service/account.repostory.dart';
import 'package:flutter_dio_getx/service/dio.helper.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AccountDetailController extends GetxController {
  var isError = false.obs;
  var errMsg = "".obs;
  Rx<DetailData> detailData = DetailData().obs;

  Dio dio = Dio();

  @override
  void onInit() {
    // TODO: implement onInit
   
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  Future getDetailUser(int id) async {
    try {
      
      final result = await ApiClient().getDetailUser(ApiConst.detailUser+id.toString());
      var  data = result["data"];
      isError(false);
      detailData.value = DetailData.fromJson(data);
      return detailData;
    } catch (e) {
      isError(true);
      errMsg(e.toString());
      throw Exception(e);
    }
  }
}