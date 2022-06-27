import 'dart:ui';
import 'package:dune/Provider/main_provider.dart';
import 'package:dune/Services/essentials.dart';
import 'package:dune/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class BasicDetails extends StatefulWidget {
  const BasicDetails({Key? key}) : super(key: key);

  @override
  State<BasicDetails> createState() => _BasicDetailsState();
}

class _BasicDetailsState extends State<BasicDetails> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    Dimension.init(context);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Essentials.hexToColor("#f5f5f5"),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Basic Details",
              style: Theme.of(context).textTheme.headline1!.merge(
                    TextStyle(
                      color: Essentials.hexToColor("#707070"),
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                color: Colors.white,
              ),
              height: 55,
              child: TextField(
                controller: name,
                textAlignVertical: TextAlignVertical.top,
                decoration: const InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                color: Colors.white,
              ),
              height: 55,
              child: TextField(
                controller: email,
                textAlignVertical: TextAlignVertical.top,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                color: Colors.white,
              ),
              height: 55,
              child: TextField(
                controller: address,
                textAlignVertical: TextAlignVertical.top,
                decoration: const InputDecoration(
                  labelText: "Address",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: GestureDetector(
                onTap: () async {
                  setState(() {
                    loading = true;
                  });
                  if (name.text.trim().isEmpty &&
                      email.text.trim().isEmpty &&
                      address.text.trim().isEmpty) {
                    // enter_mobile_number
                    _scaffoldKey.currentState
                        // ignore: deprecated_member_use
                        ?.showSnackBar(
                      SnackBar(
                        duration: Duration(seconds: 5),
                        content: Text(
                            AppLocalizations.of(context)!.enter_mobile_number),
                      ),
                    );
                    setState(() {
                      loading = false;
                    });
                  } else {
                    final String res =
                        await Provider.of<MainProvider>(context, listen: false)
                            .updateProfile(name.text.toString(),
                                email.text.toString(), address.text.toString());
                    if (res == "Success") {
                      Navigator.pushReplacementNamed(context, '/HomePage');
                      setState(() {
                        loading = false;
                      });
                    } else {
                      _scaffoldKey.currentState
                          // ignore: deprecated_member_use
                          ?.showSnackBar(
                        const SnackBar(
                          duration: Duration(seconds: 5),
                          content: Text("Try Again"),
                        ),
                      );
                      setState(() {
                        loading = false;
                      });
                    }
                  }
                },
                child: Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.all(15),
                    height: Dimension.scalePixel(15),
                    width: Dimension.scalePixel(50),
                    decoration: BoxDecoration(
                      color: Essentials.hexToColor("#0390d7"),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: loading == false
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppLocalizations.of(context)!
                                    .continuee
                                    .toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .merge(
                                      const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              const Icon(Icons.arrow_forward_ios,
                                  color: Colors.white),
                            ],
                          )
                        : const CircularProgressIndicator()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
