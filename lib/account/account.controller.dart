import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dio_getx/model/account.model.dart';
import 'package:get/get.dart';

import '../service/account.repostory.dart';
import '../service/dio.helper.dart';

class AccountController extends GetxController {
  var isLoading = true.obs; 
  var isError = false.obs;
  var errMsg = "".obs;
  var accountData = <UserModel>[].obs;

  Dio dio = Dio();
  @override
  void onInit() {
    // TODO: implement onInit
    getUser();
    super.onInit();

  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

 Future<List<UserModel>> getUser() async {
    isLoading(true);
    try {
      final result = await ApiClient().getData(ApiConst.path);
      final List data = result["data"];
      isLoading(false);
      isError(false);
      accountData.value = data.map((e) => UserModel.fromMap(e)).toList();
      return accountData;
    } catch (e) {
      isLoading(false);
      isError(true);
      errMsg(e.toString());
      throw Exception(e);
    }
  }

  showToast(fName, lName, context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("${fName}  ${lName}"),
    ));
  }
}