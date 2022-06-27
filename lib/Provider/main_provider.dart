import 'dart:convert';

import 'package:dune/models/login_model.dart';
import 'package:dune/models/perVehicle.dart';
import 'package:dune/models/specific_model.dart';
import 'package:dune/prefs/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/vehicle_model.dart';

class MainProvider extends ChangeNotifier {
  String baseUrl = "http://52.91.212.169/api";
  LoginModel? loginModel = null;
  List<PerVehicle> sold = [];
  List<PerVehicle> loaded = [];
  List<PerVehicle> empty = [];

  Future<dynamic> login(String firebaseId, String phone) async {
    print(phone);
    print(firebaseId);
    var map = Map<String, dynamic>();
    map['phone'] = phone;
    map['password'] = firebaseId;
    print(map);
    var response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      body: json.encode(map),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    dynamic res = jsonDecode(response.body);
    if (response.statusCode == 200) {
      loginModel = LoginModel.fromJson(res);
      SharedPrefs.setAccessToken(loginModel!.token);
      notifyListeners();
      getVehicle();
      if (loginModel!.message == "Login success") {
        return "Login";
      } else if (loginModel!.message == "User registered success") {
        return "Register";
      } else {
        return loginModel!.message;
      }
    } else {
      return "Failed";
    }
  }

  Future<dynamic> splashFun() async {
    dynamic res = getVehicle();
    return res;
  }

  Future<dynamic> updateProfile(
      String name, String email, String address) async {
    var response = await http.post(
      Uri.parse('$baseUrl/auth/edit'),
      body: json.encode(
        {
          "name": name,
          "email": email,
          "address": address,
        },
      ),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': loginModel!.token,
      },
    );
    // Request Successful
    dynamic res = jsonDecode(response.body);
    if (res['message'] == "Request Successful") {
      return "Success";
    } else {
      return "Failed";
    }
  }

  Future<dynamic> add_vehicle(
    String vehicleNo,
    String vehicleType,
    String loadCapacity,
    String loadCapacityUnit,
    String baseRouteFrom,
    String baseRouteTo,
    String materialCategory,
    String materialSubCategory,
    String driverName,
    String driverAddress,
    bool permission,
  ) async {
    String token = await SharedPrefs.getData('token');
    var response = await http.post(
      Uri.parse('$baseUrl/vehicle/add'),
      body: json.encode(
        {
          "vehicleNo": vehicleNo,
          "vehicleType": vehicleType,
          "loadCapacity": int.parse(loadCapacity),
          "loadCapacityUnit": loadCapacityUnit,
          "baseRouteFrom": baseRouteFrom,
          "baseRouteTo": baseRouteTo,
          "materialCategory": materialCategory,
          "materialSubCategory": materialSubCategory,
          "driverName": driverName,
          "driverAddress": driverAddress,
          "permission": permission
        },
      ),
      headers: {
        'Authorization': token,
        'Content-Type': 'application/json',
      },
    );
    dynamic res = jsonDecode(response.body);
    if (res['message'] == "Request Successful") {
      getVehicle();
      return "Success";
    } else {
      return "Failed";
    }
  }

  VehicleModel? vehicleModel = null;

  void emptyList() {
    sold = [];
    loaded = [];
    empty = [];
    notifyListeners();
  }

  Future<dynamic> getVehicle() async {
    emptyList();
    notifyListeners();
    String token = await SharedPrefs.getData('token');
    var headersList = {
      'Authorization': token,
    };
    var url = Uri.parse('$baseUrl/vehicle/get');
    var response = await http.get(url, headers: headersList);
    dynamic res = jsonDecode(response.body);
    print("--------------- ooooooooooooooo");
    print(res);
    if (response.statusCode == 200) {
      vehicleModel = VehicleModel.fromJson(res);
      notifyListeners();
      for (var i = 0; i < vehicleModel!.data.length; i++) {
        if (vehicleModel!.data[i].status == "EMPTY") {
          empty.add(PerVehicle.fromJson(res['data'][i]));
          notifyListeners();
        } else if (vehicleModel!.data[i].status == "LOADED") {
          print(res['data'][i]);
          loaded.add(PerVehicle.fromJson(res['data'][i]));
          notifyListeners();
        } else {
          sold.add(PerVehicle.fromJson(res['data'][i]));
          notifyListeners();
        }
      }
      return "Success";
    } else if (res['message'] == "User session expired, Please log in again!") {
      return "Login Again";
    } else {
      return "Failed";
    }
  }

  SpecificVehicle? specificVehicle = null;

  Future<dynamic> getVehicleById(String id) async {
    String token = await SharedPrefs.getData('token');
    specificVehicle = null;
    notifyListeners();
    var headersList = {
      'Authorization': token,
    };
    var url = Uri.parse('$baseUrl/vehicle/get?id=$id');

    var response = await http.get(url, headers: headersList);
    dynamic res = jsonDecode(response.body);
    print(res);

    if (response.statusCode == 200) {
      specificVehicle = SpecificVehicle.fromJson(res);
      notifyListeners();
    } else {
      return "Failed";
    }
  }

  Future<dynamic> edit_vehicle(
    String id,
    String vehicleNo,
    String vehicleType,
    String loadCapacity,
    String loadCapacityUnit,
    String baseRouteFrom,
    String baseRouteTo,
    String materialCategory,
    String materialSubCategory,
    String driverName,
    String driverAddress,
    bool permission,
  ) async {
    String token = await SharedPrefs.getData('token');
    print(id);
    var response = await http.post(
      Uri.parse('$baseUrl/vehicle/edit'),
      body: json.encode(
        {
          "id": id,
          "vehicleNo": vehicleNo,
          "vehicleType": vehicleType,
          "loadCapacity": loadCapacity,
          "loadCapacityUnit": loadCapacityUnit,
          "baseRouteFrom": baseRouteFrom,
          "baseRouteTo": baseRouteTo,
          "materialCategory": materialCategory,
          "materialSubCategory": materialSubCategory,
          "driverName": driverName,
          "driverAddress": driverAddress,
          "permission": permission
        },
      ),
      headers: {
        'Authorization': token,
        'Content-Type': 'application/json',
      },
    );
    dynamic res = jsonDecode(response.body);
    print(res);
    if (res['message'] == "Request Successful") {
      getVehicle();
      return "Success";
    } else {
      return "Failed";
    }
  }

  Future<dynamic> loadVehicle(
    String id,
    String currentRouteFrom,
    String currentRouteTo,
    String askPrice,
  ) async {
    String token = await SharedPrefs.getData('token');
    print(id);

    var response = await http.post(
      Uri.parse('$baseUrl/vehicle/load?id=$id'),
      body: json.encode(
        {
          "status": "LOADED",
          "currentRouteFrom": currentRouteFrom,
          "currentRouteTo": currentRouteTo,
          "askPrice": askPrice
        },
      ),
      headers: {
        'Authorization': token,
        'Content-Type': 'application/json',
      },
    );
    dynamic res = jsonDecode(response.body);
    print(res);
    if (response.statusCode == 200) {
      getVehicle();
      return "Success";
    } else {
      return "Failed";
    }
  }
}
