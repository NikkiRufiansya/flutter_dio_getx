import 'package:flutter/material.dart';
import 'package:flutter_dio_getx/account/account.controller.dart';
import 'package:flutter_dio_getx/account/detail_account.screen.dart';
import 'package:get/get.dart';

import 'package:shimmer/shimmer.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AccountController productController = Get.put(AccountController());
    return Scaffold(
        appBar: AppBar(title: const Text("List Users")),
        body: Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(20),
            child: Obx(() {
              if (productController.isLoading.value)
                return Shimmer.fromColors(
                    baseColor: Colors.grey[400]!,
                    highlightColor: Colors.grey[300]!,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        height: 100,
                        width: 200,
                      ),
                    ));
              else if (productController.isError.value)
                return Text(
                    "Error: ${productController.errMsg.value.capitalize}");
              else //if loading == true, show progress indicator
                // ignore: curly_braces_in_flow_control_structures
                return Container(
                    //if there is any error, show error message
                    child: Column(
                  //if everything fine, show the JSON as widget
                  children:
                      productController.accountData.value.map<Widget>((user) {
                    return Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailAccountScreen(id: user.id,)));
                         
                        },
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(user.avatar),
                        ),
                        title: Text(user.firstName),
                        subtitle: Text(user.email),
                      ),
                    );
                  }).toList(),
                ));
            })));
  }
}
