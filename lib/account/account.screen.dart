import 'package:flutter/material.dart';
import 'package:flutter_dio_getx/account/account.controller.dart';
import 'package:flutter_dio_getx/account/detail_account.screen.dart';
import 'package:get/get.dart';

import 'package:shimmer/shimmer.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AccountController accountController = Get.put(AccountController());
    return Scaffold(
        appBar: AppBar(title: const Text("List Users")),
        body: Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(20),
            child: Obx(() {
              if (accountController.isLoading.value) {
                return Shimmer.fromColors(
                    baseColor: Colors.grey[400]!,
                    highlightColor: Colors.grey[300]!,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        height: 80,
                        width: 200,
                      ),
                    ));
              } else if (accountController.isError.value) {
                return Text(
                    "Error: ${accountController.errMsg.value.capitalize}");
              } else //if loading == true, show progress indicator
                // ignore: curly_braces_in_flow_control_structures
                return Container(
                    //if there is any error, show error message
                    child: Column(
                  //if everything fine, show the JSON as widget
                  children:
                      // ignore: invalid_use_of_protected_member
                      accountController.accountData.value.map<Widget>((user) {
                    return Card(
                      child: ListTile(
                        onTap: () {
                          Get.to(DetailAccountScreen(id: user.id.toString()));
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
