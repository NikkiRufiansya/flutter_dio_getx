import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_dio_getx/account/account_detail.controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class DetailAccountScreen extends StatefulWidget {
  final String id;
  const DetailAccountScreen({super.key, required this.id});

  @override
  State<DetailAccountScreen> createState() => _DetailAccountScreenState();
}

class _DetailAccountScreenState extends State<DetailAccountScreen> {

  @override
  Widget build(BuildContext context) {
    final AccountDetailController accountDetailController =
        Get.put(AccountDetailController());
    accountDetailController.getDetailUser(widget.id);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
            //replace with our own icon data.
          ),
          title: const Text("Detail User"),
          centerTitle: false,
        ),
        body: Container(
            margin: EdgeInsets.only(left: 20, top: 20),
            child: Obx(
              () {
                if (accountDetailController.isLoading.value) {
                  return Text("Loading....");
                } else if (accountDetailController.isError.value) {
                  return SizedBox();
                } else {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              accountDetailController.detailData.value.avatar!),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                              "Nama : ${accountDetailController.detailData.value.firstName!} ${accountDetailController.detailData.value.lastName!}"),
                          Text(
                              "Email : ${accountDetailController.detailData.value.email!}")
                        ],
                      ),
                    ],
                  );
                }
              },
            )));
  }
}
