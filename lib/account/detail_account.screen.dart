import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_dio_getx/account/account_detail.controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class DetailAccountScreen extends StatefulWidget {
  final int id;
  const DetailAccountScreen({super.key, required this.id});

  @override
  State<DetailAccountScreen> createState() => _DetailAccountScreenState();
}

class _DetailAccountScreenState extends State<DetailAccountScreen> {
  final AccountDetailController accountDetailController =
      Get.put(AccountDetailController());
  @override
  void initState() {
    // TODO: implement initState
    accountDetailController.getDetailUser(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
          //replace with our own icon data.
        ),
        title: Text("Detail User"),
        centerTitle: false,
      ),
      body: Container(
          margin: EdgeInsets.only(left: 20, top: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Container(
                  margin: EdgeInsets.only(right: 20),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        accountDetailController.detailData.value.avatar!),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Obx((() => Text("Nama : " +
                      accountDetailController.detailData.value.firstName! +
                      " " +
                      accountDetailController.detailData.value.lastName!))),
                  Obx((() => Text("Email : " +
                      accountDetailController.detailData.value.email!))),
                ],
              ),
            ],
          )),
    );
  }
}
