import 'package:dune/Pages/HomePage/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'package:dune/Services/essentials.dart';
import 'package:dune/config.dart';

import '../../Provider/main_provider.dart';

class LoadVehicle extends StatefulWidget {
  String? id;
  LoadVehicle({
    Key? key,
    this.id,
  }) : super(key: key);

  @override
  State<LoadVehicle> createState() => _LoadVehicleState();
}

class _LoadVehicleState extends State<LoadVehicle> {
  bool? checkedValue = true;
  bool? currentSame = true;
  String? vehicleType = "Select Vehicle Type";
  String? baseRouteFrom = "Base Route From";
  String? enterQuantity = "Enter Quantity";
  String? baseRouteTo = "Base Route To";
  String? currentRouteFrom = "Current Route From";
  String? currentRouteTo = "Current Route To";
  String? materialCategory = "Material Category";
  String? materialSubCategory = "Material Sub Category";
  TextEditingController vehicleNumber = TextEditingController();
  TextEditingController askPrice = TextEditingController();
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

  @override
  void initState() {
    checkedValue = Provider.of<MainProvider>(context, listen: false)
        .specificVehicle!
        .data
        .permission;
    vehicleType = Provider.of<MainProvider>(context, listen: false)
        .specificVehicle!
        .data
        .vehicleType;
    baseRouteFrom = Provider.of<MainProvider>(context, listen: false)
        .specificVehicle!
        .data
        .baseRouteFrom;
    baseRouteTo = Provider.of<MainProvider>(context, listen: false)
        .specificVehicle!
        .data
        .baseRouteTo;
    enterQuantity = Provider.of<MainProvider>(context, listen: false)
        .specificVehicle!
        .data
        .loadCapacityUnit
        .toString();
    materialCategory = Provider.of<MainProvider>(context, listen: false)
        .specificVehicle!
        .data
        .materialCategory;
    materialSubCategory = Provider.of<MainProvider>(context, listen: false)
        .specificVehicle!
        .data
        .materialSubCategory;
    super.initState();
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
          title: Text(AppLocalizations.of(context)!.load_vehicle.toUpperCase()),
        ),
        body: Consumer<MainProvider>(
          builder: (_, a, __) {
            return ListView(
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
                    enabled: false,
                    controller: vehicleNumber
                      ..text = a.specificVehicle!.data.vehicleNo,
                    autofocus: false,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.vehicle_number,
                      hintText: AppLocalizations.of(context)!.vehicle_number,
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
                  height: 15,
                ),
                Material(
                  child: TextFormField(
                    enabled: false,
                    initialValue: a.specificVehicle!.data.vehicleType,
                    autofocus: false,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.vehicle_type,
                      hintText: AppLocalizations.of(context)!.vehicle_type,
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
                  height: 15,
                ),
                // Material(
                //   child:
                // ),
                Material(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          enabled: false,
                          controller: loadCapacity
                            ..text =
                                a.specificVehicle!.data.loadCapacity.toString(),
                          keyboardType: TextInputType.number,
                          autofocus: false,
                          decoration: InputDecoration(
                            hintText:
                                AppLocalizations.of(context)!.load_capacity,
                            labelText:
                                AppLocalizations.of(context)!.load_capacity,
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: const EdgeInsets.fromLTRB(
                                20.0, 10.0, 20.0, 10.0),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 3.0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        width: 150,
                        child: TextFormField(
                          initialValue: enterQuantity.toString(),
                          decoration: const InputDecoration(
                            enabled: false,
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
                  child: TextFormField(
                    enabled: false,
                    initialValue: a.specificVehicle!.data.baseRouteFrom,
                    autofocus: false,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.base_route_from,
                      hintText: AppLocalizations.of(context)!.base_route_from,
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
                  height: 15,
                ),
                Material(
                  child: TextFormField(
                    enabled: false,
                    initialValue: a.specificVehicle!.data.baseRouteTo,
                    autofocus: false,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.base_route_to,
                      hintText: AppLocalizations.of(context)!.base_route_to,
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
                  height: 15,
                ),
                CheckboxListTile(
                  title: Text(
                    AppLocalizations.of(context)!
                        .if_current_route_is_same_as_base_route,
                  ),
                  value: currentSame,
                  onChanged: (newValue) {
                    setState(() {
                      currentSame = newValue;
                      print(currentSame);
                    });
                    if (newValue == true) {
                      setState(() {
                        currentRouteFrom = baseRouteFrom;
                        currentRouteTo = baseRouteTo;
                        print(currentRouteFrom);
                        print(currentRouteTo);
                      });
                    }
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
                const SizedBox(
                  height: 15,
                ),
                currentSame == false
                    ? Material(
                        color: Colors.white,
                        // elevation: 1.0,
                        shadowColor: Essentials.hexToColor("#707070"),
                        child: DropdownButtonFormField(
                          hint: Row(
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              Text(a.specificVehicle!.data.baseRouteFrom
                                  .toString()),
                            ],
                          ),
                          items: <String>['Mohali', 'Chandigarh']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            currentRouteFrom = value;
                          },
                          decoration: InputDecoration(
                            enabled: false,
                            labelText:
                                AppLocalizations.of(context)!.base_route_from,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(15),
                          ),
                        ),
                      )
                    : TextFormField(
                        enabled: false,
                        initialValue: a.specificVehicle!.data.baseRouteFrom,
                        autofocus: false,
                        decoration: InputDecoration(
                          labelText:
                              AppLocalizations.of(context)!.base_route_from,
                          hintText:
                              AppLocalizations.of(context)!.base_route_from,
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding:
                              const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: const BorderSide(
                                color: Colors.white, width: 3.0),
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 15,
                ),
                currentSame == false
                    ? Material(
                        color: Colors.white,
                        // elevation: 1.0,
                        shadowColor: Essentials.hexToColor("#707070"),
                        child: DropdownButtonFormField(
                          hint: Row(
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              Text(a.specificVehicle!.data.baseRouteTo
                                  .toString()),
                            ],
                          ),
                          items: <String>['Mohali', 'Chandigarh']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            currentRouteTo = value;
                          },
                          decoration: InputDecoration(
                            enabled: false,
                            labelText:
                                AppLocalizations.of(context)!.base_route_to,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(15),
                          ),
                        ),
                      )
                    : TextFormField(
                        enabled: false,
                        initialValue: a.specificVehicle!.data.baseRouteTo,
                        autofocus: false,
                        decoration: InputDecoration(
                          labelText:
                              AppLocalizations.of(context)!.base_route_to,
                          hintText: AppLocalizations.of(context)!.base_route_to,
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding:
                              const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: const BorderSide(
                                color: Colors.white, width: 3.0),
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
                        Text(a.specificVehicle!.data.materialCategory
                            .toString()),
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
                      labelText: AppLocalizations.of(context)!
                          .select_material_category,
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
                        Text(a.specificVehicle!.data.materialSubCategory
                            .toString()),
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
                      labelText: AppLocalizations.of(context)!
                          .select_material_subcategory,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Material(
                  child: TextFormField(
                    controller: askPrice,
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.ask_price,
                      labelText: AppLocalizations.of(context)!.ask_price,
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
                  height: 15,
                ),
                const Divider(),
                const SizedBox(
                  height: 15,
                ),
                Material(
                  child: TextFormField(
                    enabled: false,
                    maxLength: 10,
                    controller: driverName
                      ..text = a.specificVehicle!.data.driverName,
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText:
                          AppLocalizations.of(context)!.enter_drivers_name,
                      labelText:
                          AppLocalizations.of(context)!.enter_drivers_name,
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
                  height: 15,
                ),
                Material(
                  child: TextFormField(
                    enabled: false,
                    controller: driverNumber
                      ..text = a.specificVehicle!.data.driverAddress,
                    autofocus: false,
                    onChanged: (value) {
                      driverNumber.text = value;
                    },
                    decoration: InputDecoration(
                      hintText:
                          AppLocalizations.of(context)!.enter_drivers_number,
                      labelText:
                          AppLocalizations.of(context)!.enter_drivers_number,
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
                            color: Essentials.hexToColor("#727272")
                                .withOpacity(0.7),
                          ),
                          child: Center(
                            child: Text(
                              AppLocalizations.of(context)!
                                  .delete
                                  .toUpperCase(),
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
                          if (askPrice.text.toString() == "") {
                            _scaffoldKey.currentState
                                // ignore: deprecated_member_use
                                ?.showSnackBar(
                              SnackBar(
                                duration: const Duration(seconds: 5),
                                content: Text(
                                  AppLocalizations.of(context)!.enter_ask_price,
                                ),
                              ),
                            );
                          } else if (currentRouteFrom == "") {
                            _scaffoldKey.currentState
                                // ignore: deprecated_member_use
                                ?.showSnackBar(
                              SnackBar(
                                duration: const Duration(seconds: 5),
                                content: Text(
                                  AppLocalizations.of(context)!
                                      .enter_base_route_from,
                                ),
                              ),
                            );
                          } else if (currentRouteTo == "") {
                            _scaffoldKey.currentState
                                // ignore: deprecated_member_use
                                ?.showSnackBar(
                              SnackBar(
                                duration: const Duration(seconds: 5),
                                content: Text(
                                  AppLocalizations.of(context)!
                                      .enter_base_route_to,
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
                          } else if (materialSubCategory ==
                              "Material Sub Category") {
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
                          } else {
                            setState(() {
                              loading = true;
                            });
                            Essentials.showProgressDialog(context);
                            final dynamic res = await Provider.of<MainProvider>(
                                    context,
                                    listen: false)
                                .loadVehicle(
                              widget.id.toString(),
                              currentRouteFrom.toString(),
                              currentRouteTo.toString(),
                              askPrice.text.toString(),
                            );
                            setState(() {
                              loading = false;
                            });
                            Navigator.pop(context);
                            if (res == "Success") {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()));
                            } else {
                              _scaffoldKey.currentState
                                  // ignore: deprecated_member_use
                                  ?.showSnackBar(
                                SnackBar(
                                  duration: const Duration(seconds: 5),
                                  // fill_all_the_details
                                  content: Text(
                                    AppLocalizations.of(context)!.failed,
                                  ),
                                ),
                              );
                            }
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
                            color: Essentials.hexToColor("#0390d7")
                                .withOpacity(0.7),
                          ),
                          child: Center(
                            child: Text(
                              AppLocalizations.of(context)!
                                  .update
                                  .toUpperCase(),
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
            );
          },
        ));
  }
}
