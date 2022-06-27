import 'package:dune/Pages/HomePage/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'package:dune/Services/essentials.dart';
import 'package:dune/config.dart';

import '../../Provider/main_provider.dart';

class EditPage extends StatefulWidget {
  String? id;
  EditPage({
    Key? key,
    this.id,
  }) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  bool? checkedValue = true;
  String? vehicleType = "Select Vehicle Type";
  String? enterQuantity = "Enter Quantity";
  String? baseRouteFrom = "Base Route From";
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
          title: Text(AppLocalizations.of(context)!.edit_vehicle.toUpperCase()),
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
                    initialValue: a.specificVehicle!.data.vehicleNo,
                    onChanged: (v) {
                      setState(() {
                        vehicleNumber.text = v;
                        print(vehicleNumber.text);
                      });
                    },
                    autofocus: false,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(color: Colors.grey),
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
                  color: Colors.white,
                  // elevation: 1.0,
                  shadowColor: Essentials.hexToColor("#707070"),
                  child: DropdownButtonFormField(
                    hint: Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        Text(a.specificVehicle!.data.vehicleType.toString()),
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
                      labelText:
                          AppLocalizations.of(context)!.select_vehicle_type,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(15),
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
                          
                          initialValue:
                              a.specificVehicle!.data.loadCapacity.toString(),
                          keyboardType: TextInputType.number,
                          autofocus: false,
                          onChanged: (v) {
                            setState(() {
                              loadCapacity.text = v;
                            });
                          },
                          decoration: InputDecoration(
                            hintStyle: const TextStyle(color: Colors.grey),
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
                        width: Dimension.scalePixel(45),
                        child: DropdownButtonFormField(
                          hint: Row(
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              Text(a.specificVehicle!.data.loadCapacityUnit
                                  .toString()),
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
                          decoration: InputDecoration(
                            labelText:
                                AppLocalizations.of(context)!.enter_quantuty,
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
                        Text(a.specificVehicle!.data.baseRouteFrom.toString()),
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
                        Text(a.specificVehicle!.data.baseRouteTo.toString()),
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
                      labelText: AppLocalizations.of(context)!.base_route_to,
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
                const Divider(),
                const SizedBox(
                  height: 15,
                ),
                Material(
                  child: TextFormField(
                    initialValue: a.specificVehicle!.data.driverName,
                    maxLength: 10,
                    onChanged: (v) {
                      setState(() {
                        driverName.text = v;
                      });
                    },
                    autofocus: false,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(color: Colors.grey),
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
                    initialValue: a.specificVehicle!.data.driverAddress,
                    autofocus: false,
                    onChanged: (value) {
                      driverNumber.text = value;
                    },
                    maxLength: 10,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(color: Colors.grey),
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
                          setState(() {
                            loading = true;
                          });
                          Essentials.showProgressDialog(context);
                          final dynamic res = await Provider.of<MainProvider>(
                                  context,
                                  listen: false)
                              .edit_vehicle(
                            widget.id.toString(),
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
                          setState(() {
                            loading = false;
                          });
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
