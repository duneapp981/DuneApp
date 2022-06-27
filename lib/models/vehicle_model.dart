class VehicleModel {
  VehicleModel({
    required this.message,
    required this.data,
  });
  late final String message;
  late final List<Data> data;

  VehicleModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.permission,
    required this.id,
    required this.vehicleNo,
    required this.vehicleType,
    required this.loadCapacity,
    required this.loadCapacityUnit,
    required this.askPrice,
    required this.baseRouteFrom,
    required this.baseRouteTo,
    required this.materialCategory,
    required this.materialSubCategory,
    required this.driverName,
    required this.driverAddress,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
  });
  late final bool? permission;
  late final String id;
  late final String vehicleNo;
  late final String? vehicleType;
  late final dynamic? loadCapacity;
  late final dynamic loadCapacityUnit;
  late final int? askPrice;
  late final String status;
  late final String baseRouteFrom;
  late final String baseRouteTo;
  late final String materialCategory;
  late final String materialSubCategory;
  late final String driverName;
  late final String? driverAddress;
  late final String createdAt;
  late final String updatedAt;
  late final int V;

  Data.fromJson(Map<String, dynamic> json) {
    permission = json['permission'];
    id = json['_id'];
    vehicleNo = json['vehicleNo'];
    askPrice = json['askPrice'];
    vehicleType = json['vehicleType'];
    status = json['status'];
    loadCapacity = json['loadCapacity'];
    loadCapacityUnit = json['loadCapacityUnit'];
    baseRouteFrom = json['baseRouteFrom'];
    baseRouteTo = json['baseRouteTo'];
    materialCategory = json['materialCategory'];
    materialSubCategory = json['materialSubCategory'];
    driverName = json['driverName'];
    driverAddress = json['driverAddress'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['permission'] = permission;
    _data['_id'] = id;
    _data['vehicleNo'] = vehicleNo;
    _data['vehicleType'] = vehicleType;
    _data['status'] = status;
    _data['loadCapacity'] = loadCapacity;
    _data['loadCapacityUnit'] = loadCapacityUnit;
    _data['baseRouteFrom'] = baseRouteFrom;
    _data['baseRouteTo'] = baseRouteTo;
    _data['materialCategory'] = materialCategory;
    _data['materialSubCategory'] = materialSubCategory;
    _data['driverName'] = driverName;
    _data['driverAddress'] = driverAddress;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    return _data;
  }
}
