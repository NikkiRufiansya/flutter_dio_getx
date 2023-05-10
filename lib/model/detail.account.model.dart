import 'dart:convert';

List<DetailUserModel> userDetailModelFromMap(String str) =>
    List<DetailUserModel>.from(
        json.decode(str).map((x) => DetailUserModel.fromJson(x)));

String detailUserModelToMap(List<DetailUserModel> data) =>
    json.encode(List<dynamic>.from(data.map((e) => e.toJson())));

class DetailUserModel {
  DetailData? data;
  Support? support;

  DetailUserModel({this.data, this.support});

  DetailUserModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new DetailData.fromJson(json['data']) : null;
    support =
        json['support'] != null ? new Support.fromJson(json['support']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.support != null) {
      data['support'] = this.support!.toJson();
    }
    return data;
  }
}

class DetailData {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  DetailData({this.id, this.email, this.firstName, this.lastName, this.avatar});

  DetailData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['avatar'] = this.avatar;
    return data;
  }
}

class Support {
  String? url;
  String? text;

  Support({this.url, this.text});

  Support.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['text'] = this.text;
    return data;
  }
}
