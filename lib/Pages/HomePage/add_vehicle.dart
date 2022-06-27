import 'package:dune/Pages/HomePage/homepage.dart';
import 'package:dune/Services/essentials.dart';
import 'package:dune/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../Provider/main_provider.dart';

class AddVehicle extends StatefulWidget {
  const AddVehicle({Key? key}) : super(key: key);

  @override
  State<AddVehicle> createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  bool? checkedValue = true;
  String? vehicleType = "Select Vehicle Type";
  String? baseRouteFrom = "Base Route From";
  String? enterQuantity = "Enter Quantity";
  String? baseRouteTo = "Base Route To";
  String? materialCategory = "Material Category";
  String? materialSubCategory = "Material Sub Category";
  TextEditingController vehicleNumber = TextEditingController();
  TextEditingController loadCapacity = TextEditingController();
  TextEditingController driverName = TextEditingController();
  TextEditingController driverNumber = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool loading = false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    vehicleNumber.dispose();
    loadCapacity.dispose();
    driverName.dispose();
    driverNumber.dispose();
  }

  Future<bool> showSavePopUp(context) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                content: Container(
                  height: 90,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppLocalizations.of(context)!
                          .do_you_want_to_add_this_vehical),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                AppLocalizations.of(context)!.no.toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Essentials.hexToColor("#727272"),
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                              child: ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                loading = true;
                              });
                              Essentials.showProgressDialog(context);
                              final dynamic res =
                                  await Provider.of<MainProvider>(context,
                                          listen: false)
                                      .add_vehicle(
                                vehicleNumber.text.toString(),
                                vehicleType.toString(),
                                loadCapacity.text.toString(),
                                enterQuantity.toString(),
                                baseRouteFrom.toString(),
                                baseRouteTo.toString(),
                                materialCategory.toString(),
                                materialSubCategory.toString(),
                                driverName.text.toString(),
                                driverNumber.text.toString(),
                                checkedValue!,
                              );
                              Navigator.pop(context);
                              Navigator.pop(context);
                              if (res == "Success") {
                                setState(() {});
                              }
                              setState(() {
                                loading = false;
                              });
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => const HomePage()),
                                ),
                              );
                            },
                            child: Text(
                              AppLocalizations.of(context)!.yes.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Essentials.hexToColor("#0390d7"),
                            ),
                          ))
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Dimension.init(context);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Essentials.hexToColor("#f5f5f5"),
      appBar: AppBar(
        backgroundColor: Essentials.hexToColor("#0390d7"),
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        title: Text(AppLocalizations.of(context)!.add_vehicle.toUpperCase()),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Image.asset(
            "assets/select_image.png",
            height: 150,
          ),
          const SizedBox(
            height: 15,
          ),
          Material(
            child: TextFormField(
              controller: vehicleNumber,
              autofocus: false,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.vehicle_number,
                labelText: AppLocalizations.of(context)!.vehicle_number,
                fillColor: Colors.white,
                filled: true,
                contentPadding:
                    const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: const BorderSide(color: Colors.white, width: 3.0),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Material(
            color: Colors.white,
            // elevation: 1.0,
            shadowColor: Essentials.hexToColor("#707070"),
            child: DropdownButtonFormField(
              hint: Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Text(vehicleType.toString()),
                ],
              ),
              items: <String>['TRUCK', 'TROLLEY'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                vehicleType = value;
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: AppLocalizations.of(context)!.select_vehicle_type,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Material(
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: loadCapacity,
                    keyboardType: TextInputType.number,
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.load_capacity,
                      labelText: AppLocalizations.of(context)!.load_capacity,
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding:
                          const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 3.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                SizedBox(
                  width: 170,
                  child: DropdownButtonFormField(
                    hint: Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        Text(enterQuantity.toString()),
                      ],
                    ),
                    items: <String>['Kgs', 'Q'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      enterQuantity = value;
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Divider(),
          const SizedBox(
            height: 15,
          ),
          Material(
            color: Colors.white,
            // elevation: 1.0,
            shadowColor: Essentials.hexToColor("#707070"),
            child: DropdownButtonFormField(
              hint: Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Text(baseRouteFrom.toString()),
                ],
              ),
              items: <String>['Mohali', 'Chandigarh'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                baseRouteFrom = value;
              },
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.base_route_from,
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Material(
            color: Colors.white,
            // elevation: 1.0,
            shadowColor: Essentials.hexToColor("#707070"),
            child: DropdownButtonFormField(
              hint: Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Text(baseRouteTo.toString()),
                ],
              ),
              items: <String>['Mohali', 'Chandigarh'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                baseRouteTo = value;
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: AppLocalizations.of(context)!.base_route_to,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Material(
            color: Colors.white,
            // elevation: 1.0,
            shadowColor: Essentials.hexToColor("#707070"),
            child: DropdownButtonFormField(
              hint: Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Text(materialCategory.toString()),
                ],
              ),
              items: <String>['Rodi', 'Matter'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                materialCategory = value;
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText:
                    AppLocalizations.of(context)!.select_material_category,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Material(
            color: Colors.white,
            // elevation: 1.0,
            shadowColor: Essentials.hexToColor("#707070"),
            child: DropdownButtonFormField(
              hint: Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Text(materialSubCategory.toString()),
                ],
              ),
              items: <String>['Rodi', 'Matter'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                materialSubCategory = value;
              },
              decoration: InputDecoration(
                labelText:
                    AppLocalizations.of(context)!.select_material_subcategory,
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Divider(),
          const SizedBox(
            height: 15,
          ),
          Material(
            child: TextFormField(
              controller: driverName,
              maxLength: 10,
              autofocus: false,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.enter_drivers_name,
                labelText: AppLocalizations.of(context)!.enter_drivers_name,
                fillColor: Colors.white,
                filled: true,
                contentPadding:
                    const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: const BorderSide(color: Colors.white, width: 3.0),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Material(
            child: TextFormField(
              controller: driverNumber,
              autofocus: false,
              maxLength: 10,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.enter_drivers_number,
                labelText: AppLocalizations.of(context)!.enter_drivers_number,
                fillColor: Colors.white,
                filled: true,
                contentPadding:
                    const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: const BorderSide(color: Colors.white, width: 3.0),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          CheckboxListTile(
            title: Text(AppLocalizations.of(context)!
                .the_driver_has_permission_to_sell_load),
            value: checkedValue,
            onChanged: (newValue) {
              setState(() {
                checkedValue = newValue;
              });
            },
            controlAffinity:
                ListTileControlAffinity.leading, //  <-- leading Checkbox
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 35,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Essentials.hexToColor("#727272"),
                      ),
                      color: Essentials.hexToColor("#727272").withOpacity(0.7),
                    ),
                    child: Center(
                      child: Text(
                        AppLocalizations.of(context)!.delete.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: InkWell(
                  onTap: () async {
                    if (vehicleNumber.text.toString() == "") {
                      _scaffoldKey.currentState
                          // ignore: deprecated_member_use
                          ?.showSnackBar(
                        SnackBar(
                          duration: const Duration(seconds: 5),
                          content: Text(
                            AppLocalizations.of(context)!.vehicle_number,
                          ),
                        ),
                      );
                    } else if (vehicleType == "Select Vehicle Type") {
                      _scaffoldKey.currentState
                          // ignore: deprecated_member_use
                          ?.showSnackBar(
                        SnackBar(
                          duration: const Duration(seconds: 5),
                          content: Text(
                            AppLocalizations.of(context)!.select_vehicle_type,
                          ),
                        ),
                      );
                    } else if (loadCapacity.text.toString() == "") {
                      _scaffoldKey.currentState
                          // ignore: deprecated_member_use
                          ?.showSnackBar(
                        SnackBar(
                          duration: const Duration(seconds: 5),
                          content: Text(
                            AppLocalizations.of(context)!.load_capacity,
                          ),
                        ),
                      );
                    } else if (baseRouteFrom == "Base Route From") {
                      _scaffoldKey.currentState
                          // ignore: deprecated_member_use
                          ?.showSnackBar(
                        SnackBar(
                          duration: const Duration(seconds: 5),
                          content: Text(
                            AppLocalizations.of(context)!.enter_base_route_from,
                          ),
                        ),
                      );
                    } else if (baseRouteTo == "Base Route To") {
                      _scaffoldKey.currentState
                          // ignore: deprecated_member_use
                          ?.showSnackBar(
                        SnackBar(
                          duration: const Duration(seconds: 5),
                          content: Text(
                            AppLocalizations.of(context)!.enter_base_route_to,
                          ),
                        ),
                      );
                    } else if (materialCategory == "Material Category") {
                      _scaffoldKey.currentState
                          // ignore: deprecated_member_use
                          ?.showSnackBar(
                        SnackBar(
                          duration: const Duration(seconds: 5),
                          content: Text(
                            AppLocalizations.of(context)!
                                .select_material_category,
                          ),
                        ),
                      );
                    } else if (materialSubCategory == "Material Sub Category") {
                      _scaffoldKey.currentState
                          // ignore: deprecated_member_use
                          ?.showSnackBar(
                        SnackBar(
                          duration: const Duration(seconds: 5),
                          content: Text(
                            AppLocalizations.of(context)!
                                .select_material_subcategory,
                          ),
                        ),
                      );
                    } else if (driverName.text.toString() == "") {
                      _scaffoldKey.currentState
                          // ignore: deprecated_member_use
                          ?.showSnackBar(
                        SnackBar(
                          duration: const Duration(seconds: 5),
                          content: Text(
                            AppLocalizations.of(context)!.enter_driver_name,
                          ),
                        ),
                      );
                    } else if (enterQuantity.toString() == "") {
                      _scaffoldKey.currentState
                          // ignore: deprecated_member_use
                          ?.showSnackBar(
                        SnackBar(
                          duration: const Duration(seconds: 5),
                          content: Text(
                            AppLocalizations.of(context)!.enter_quantuty,
                          ),
                        ),
                      );
                    } else if (driverNumber.text.toString() == "") {
                      _scaffoldKey.currentState
                          // ignore: deprecated_member_use
                          ?.showSnackBar(
                        SnackBar(
                          duration: const Duration(seconds: 5),
                          content: Text(
                            AppLocalizations.of(context)!.enter_driver_number,
                          ),
                        ),
                      );
                    } else {
                      showSavePopUp(context);
                    }
                  },
                  child: Container(
                    height: 35,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Essentials.hexToColor("#0390d7"),
                      ),
                      color: Essentials.hexToColor("#0390d7").withOpacity(0.7),
                    ),
                    child: Center(
                      child: loading == true
                          ? const CircularProgressIndicator()
                          : Text(
                              AppLocalizations.of(context)!.save.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
