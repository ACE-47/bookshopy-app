import 'package:bookshopy_app/common/constants.dart';
import 'package:bookshopy_app/screens/about_us/about_us_screen.dart';
import 'package:bookshopy_app/screens/home/home_screen.dart';
import 'package:bookshopy_app/screens/search/search_screen.dart';
import 'package:flutter/material.dart';

import '../cart/cart_screen.dart';

class MainTabScreen extends StatefulWidget {
  static const routeName = '/main-tab';
  const MainTabScreen({super.key});

  @override
  State<MainTabScreen> createState() => _MainTabScreenState();
}

GlobalKey<ScaffoldState> sideMenuScaffoldKey = GlobalKey<ScaffoldState>();

class _MainTabScreenState extends State<MainTabScreen>
    with TickerProviderStateMixin {
  late TabController controller;
  int selectedPage = 0;

  List menuArr = [
    {"name": "Home", "icon": Icons.home},
    {"name": "About Us", "icon": Icons.book},
    {"name": "Our Stores", "icon": Icons.storefront},
    {"name": "Careers", "icon": Icons.business_center},
    {"name": "Sell With Us", "icon": Icons.attach_money},
    {"name": "Newsletter", "icon": Icons.newspaper},
    {"name": "Pop-up Leasing", "icon": Icons.open_in_new},
    {"name": "Account", "icon": Icons.account_circle}
  ];

  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: sideMenuScaffoldKey,
      endDrawer: Drawer(
        backgroundColor: Colors.transparent,
        elevation: 0,
        width: size.width * 0.8,
        // surfaceTintColor: Colors.transparent,
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
                    onTap: () {
                      setState(() {
                        selectedPage = index;
                      });
                      if (index == 1) {
                        Navigator.of(context)
                            .pushReplacementNamed(AboutUsScreen.routeName);
                        sideMenuScaffoldKey.currentState!.closeDrawer();
                      }
                    },
                    child: Container(
                      // margin: const EdgeInsets.symmetric(
                      //     horizontal: 15, vertical: 4),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 12),
                      decoration: index == selectedPage
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
                                color: selectedPage == index
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
                            color: selectedPage == index
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
                      IconButton(
                        onPressed: () {
                          //
                        },
                        icon: Icon(
                          Icons.settings,
                          color: TColor.subTitle,
                        ),
                      ),
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
      ),
      backgroundColor: Colors.white,
      body: TabBarView(controller: controller, children: [
        const HomeScreen(),
        const SearchScreen(),
        Container(),
        CartScreen(),
      ]),
      bottomNavigationBar: BottomAppBar(
          color: TColor.primary,
          child: TabBar(
              indicatorColor: Colors.transparent,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white54,
              controller: controller,
              tabs: const [
                Tab(
                  icon: Icon(Icons.home),
                  text: 'Home',
                ),
                Tab(
                  icon: Icon(Icons.search),
                  text: 'Search',
                ),
                Tab(
                  icon: Icon(Icons.menu),
                  text: 'WishList',
                ),
                Tab(
                  icon: Icon(Icons.shopping_bag),
                  text: 'Cart',
                ),
              ])),
    );
  }
}
