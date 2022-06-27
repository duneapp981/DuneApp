import 'dart:io';

import 'package:dune/Pages/Auth/login.dart';
import 'package:dune/Pages/HomePage/add_vehicle.dart';
import 'package:dune/Pages/HomePage/empty_container.dart';
import 'package:dune/Pages/HomePage/loaded_container.dart';
import 'package:dune/Pages/HomePage/sold_container.dart';
import 'package:dune/Pages/SelectLanguage/selectLanguage.dart';
import 'package:dune/Pages/SelectLanguage/select_language.dart';
import 'package:dune/Provider/main_provider.dart';
import 'package:dune/Services/essentials.dart';
import 'package:dune/prefs/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<bool> showSavePopUp(context) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
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
                          exit(0);
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
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showSavePopUp(context),
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Essentials.hexToColor("#0390d7"),
            // leading: const Icon(Icons.menu),
            title: Text(AppLocalizations.of(context)!.my_vehicles),
            bottom: TabBar(
              tabs: [
                Tab(text: AppLocalizations.of(context)!.all),
                Tab(text: AppLocalizations.of(context)!.sold),
                Tab(text: AppLocalizations.of(context)!.loaded),
                Tab(text: AppLocalizations.of(context)!.empty),
              ],
            ),
            actions: const [
              Icon(
                Icons.miscellaneous_services_rounded,
              ),
              SizedBox(
                width: 20,
              )
            ],
          ),
          drawer: Drawer(
            child: ListView(
              children: [
                ListTile(
                  onTap: () async {
                    SharedPrefs.removeUser();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  title: Text("Log-out"),
                ),
                ListTile(
                  onTap: () async {
                    SharedPrefs.removeUser();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SelectLanguageSetting()));
                  },
                  title: Text("Select Language"),
                ),
              ],
            ),
          ),
          body: Consumer<MainProvider>(
            builder: (_, a, __) {
              if (a.vehicleModel != null) {
                return TabBarView(
                  children: [
                    ListView.builder(
                      itemCount: a.vehicleModel!.data.length,
                      itemBuilder: (context, index) {
                        if (a.vehicleModel!.data[index].status == "EMPTY") {
                          return EmptyContainer(
                            capacityUnit: a
                                .vehicleModel!.data[index].loadCapacityUnit
                                .toString(),
                            driverName: a.vehicleModel!.data[index].driverName
                                .toString(),
                            vehicleName: a.vehicleModel!.data[index].driverName
                                .toString(),
                            id: a.vehicleModel!.data[index].id.toString(),
                            truckCapacity: a
                                .vehicleModel!.data[index].loadCapacity
                                .toString(),
                            vehicleNo: a.vehicleModel!.data[index].vehicleNo
                                .toString(),
                          );
                        } else if (a.vehicleModel!.data[index].status ==
                            "LOADED") {
                          return LoadedContainer(
                            truckCapacityUnit: a
                                .vehicleModel!.data[index].loadCapacityUnit
                                .toString(),
                            askPrice:
                                a.vehicleModel!.data[index].askPrice.toString(),
                            driverName: a.vehicleModel!.data[index].driverName
                                .toString(),
                            vehicleName: a.vehicleModel!.data[index].driverName
                                .toString(),
                            id: a.vehicleModel!.data[index].id.toString(),
                            truckCapacity: a
                                .vehicleModel!.data[index].loadCapacity
                                .toString(),
                            vehicleNo: a.vehicleModel!.data[index].vehicleNo
                                .toString(),
                          );
                        } else {
                          return SoldContainer();
                        }
                      },
                    ),
                    ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        if (a.sold.isEmpty) {
                          return const SoldContainer();
                        } else {
                          return const SoldContainer();
                        }
                      },
                    ),
                    ListView.builder(
                      itemCount: a.loaded.length,
                      itemBuilder: (context, index) {
                        return LoadedContainer(
                          truckCapacityUnit:
                              a.loaded[index].loadCapacityUnit.toString(),
                          askPrice: a.loaded[index].askPrice.toString(),
                          driverName: a.loaded[index].driverName.toString(),
                          vehicleName: a.loaded[index].driverName.toString(),
                          id: a.loaded[index].id.toString(),
                          truckCapacity:
                              a.loaded[index].loadCapacity.toString(),
                          vehicleNo: a.loaded[index].vehicleNo.toString(),
                        );
                      },
                    ),
                    ListView.builder(
                      itemCount: a.empty.length,
                      itemBuilder: (context, index) {
                        return EmptyContainer(
                          capacityUnit:
                              a.empty[index].loadCapacityUnit.toString(),
                          driverName: a.empty[index].driverName.toString(),
                          vehicleName: a.empty[index].driverName.toString(),
                          id: a.empty[index].id.toString(),
                          truckCapacity: a.empty[index].loadCapacity.toString(),
                          vehicleNo: a.empty[index].vehicleNo.toString(),
                        );
                      },
                    ),
                  ],
                );
              } else {
                return const TabBarView(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ],
                );
              }
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddVehicle()));
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
