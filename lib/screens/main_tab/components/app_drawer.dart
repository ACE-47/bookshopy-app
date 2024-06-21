import 'package:bookshopy_app/provider/auth.dart';
import 'package:bookshopy_app/screens/main_tab/main_tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/constants.dart';
import '../../about_us/about_us_screen.dart';
import '../../order/orders_screen.dart';

class AppDrawer extends StatefulWidget {
  AppDrawer({super.key, this.selectedPage = 0});
  // final GlobalKey<ScaffoldState> sideMenuScaffoldKey;
  int selectedPage;
  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  // int selectedPage = 0;

  List menuArr = [
    {"name": "Home", "icon": Icons.home},
    {"name": "About Us", "icon": Icons.book},
    {"name": "My Orders", "icon": Icons.location_on},
    {"name": "Careers", "icon": Icons.business_center},
    {"name": "Sell With Us", "icon": Icons.attach_money},
    {"name": "Newsletter", "icon": Icons.newspaper},
    {"name": "Account", "icon": Icons.account_circle},
    {"name": "LogOut", "icon": Icons.logout_outlined},
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Drawer(
      backgroundColor: Colors.transparent,
      elevation: 0,
      width: size.width * 0.8,
      // surfaceTintColor: Colors.red,
      child: Container(
        decoration: BoxDecoration(
            color: TColor.dColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(size.width * 0.7)),
            boxShadow: const [
              BoxShadow(color: Colors.black54, blurRadius: 15)
            ]),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: size.width * 0.2,
              ),
              ...List.generate(
                menuArr.length,
                (index) => GestureDetector(
                  //... here is navigato to drawer pages
                  onTap: () async {
                    if (widget.selectedPage == index) {
                      Navigator.of(context).pop();
                      // sideMenuScaffoldKey.currentState!.closeDrawer();
                      return;
                    }
                    setState(() {
                      widget.selectedPage = index;
                    });
                    Navigator.of(context).pop();
                    // sideMenuScaffoldKey.currentState!.deactivate();
                    if (index == 0) {
                      Navigator.of(context).pushNamed(MainTabScreen.routeName);

                      sideMenuScaffoldKey.currentState!.closeDrawer();
                    }
                    if (index == 1) {
                      Navigator.of(context).pushNamed(AboutUsScreen.routeName);
                      sideMenuScaffoldKey.currentState!.closeDrawer();
                    }
                    if (index == 2) {
                      Navigator.of(context)
                          .pushReplacementNamed(OrdersScreen.routeName);
                      sideMenuScaffoldKey.currentState!.closeDrawer();
                    }
                    if (index == 7) {
                      await Provider.of<Auth>(context, listen: false).logOut();
                      sideMenuScaffoldKey.currentState!.closeDrawer();
                    }
                  },
                  child: Container(
                    // margin: const EdgeInsets.symmetric(
                    //     horizontal: 15, vertical: 4),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 12),
                    decoration: index == widget.selectedPage
                        ? BoxDecoration(
                            // borderRadius: BorderRadius.circular(25),
                            color: TColor.primary,
                            boxShadow: [
                                BoxShadow(
                                    color: TColor.primary,
                                    blurRadius: 4,
                                    offset: const Offset(0, 3))
                              ])
                        : null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          menuArr[index]['name'],
                          style: TextStyle(
                              color: widget.selectedPage == index
                                  ? Colors.white
                                  : TColor.text,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Icon(
                          menuArr[index]['icon'],
                          color: widget.selectedPage == index
                              ? Colors.white
                              : TColor.primary,
                          size: 35,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // IconButton(
                    //   onPressed: () {
                    //     //
                    //   },
                    //   icon: Icon(
                    //     Icons.settings,
                    //     color: TColor.subTitle,
                    //   ),
                    // ),
                    TextButton(
                        onPressed: () {
                          //
                        },
                        child: Text(
                          'Terms',
                          style: TextStyle(
                              fontSize: 17,
                              color: TColor.subTitle,
                              fontWeight: FontWeight.w700),
                        )),
                    TextButton(
                        onPressed: () {
                          //
                        },
                        child: Text(
                          'Privecy',
                          style: TextStyle(
                              fontSize: 17,
                              color: TColor.subTitle,
                              fontWeight: FontWeight.w700),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
