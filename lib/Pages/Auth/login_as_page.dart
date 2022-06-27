import 'package:dune/Services/essentials.dart';
import 'package:dune/components/button.dart';
import 'package:dune/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginAsPage extends StatefulWidget {
  const LoginAsPage({Key? key}) : super(key: key);

  @override
  State<LoginAsPage> createState() => _LoginAsPageState();
}

class _LoginAsPageState extends State<LoginAsPage> {
  int selectLang = -1;
  List<String> userType = [
    'Shopkeeper',
    'Broker',
    'User',
  ];
  @override
  Widget build(BuildContext context) {
    Dimension.init(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: Dimension.scalePixel(20),
          ),
          Center(
            child: Text(
              AppLocalizations.of(context)!.login_as,
              style: Theme.of(context).textTheme.headline1!.merge(
                    const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: Dimension.scalePixel(130),
            width: Dimension.scalePixel(50),
            child: ListView.separated(
              itemCount: 3,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 15,
                );
              },
              itemBuilder: (context, index) {
                return Container(
                  width: Dimension.scalePixel(50),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: selectLang == index
                          ? Essentials.hexToColor("#0390d7")
                          : Essentials.hexToColor("#707070"),
                      width: 1.0,
                    ),
                    color: Essentials.hexToColor("#0390d7").withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 22,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Text(
                          userType[index],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          BlockButtonWidget(
            color: Essentials.hexToColor("#0390d7"),
            onPressed: () {},
            text: const Text("Broker"),
          )
        ],
      ),
    );
  }
}
