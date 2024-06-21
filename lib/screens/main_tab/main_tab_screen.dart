import 'package:bookshopy_app/common/constants.dart';
import 'package:bookshopy_app/screens/home/home_screen.dart';
import 'package:bookshopy_app/screens/main_tab/components/app_drawer.dart';
import 'package:bookshopy_app/screens/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import '../../provider/cart.dart';
// import '../../provider/orders.dart';
import '../../provider/products.dart';
import '../cart/cart_screen.dart';
import '../favorite/favorite_screen.dart';

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

  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
    Provider.of<Products>(context, listen: false).fetchAndSetFrontProducts();
    Provider.of<Products>(context, listen: false).fetchAndSetProducts();
    Provider.of<Products>(context, listen: false).fetchAndSetFavoriteProduct();

    // Provider.of<Cart>(context, listen: false).fetchAndSetCart();
    // Provider.of<Orders>(context, listen: false).fetchAndSetOrders();
    // TODO: implement initState
    super.initState();
  }

  // @override
  // void dispose() {
  //   sideMenuScaffoldKey.currentState!.deactivate();
  //   // TODO: implement dispose
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: sideMenuScaffoldKey,
      endDrawer: AppDrawer(
        // sideMenuScaffoldKey: sideMenuScaffoldKey,
        selectedPage: 0,
      ),
      backgroundColor: Colors.white,
      body: TabBarView(controller: controller, children: const [
        HomeScreen(),
        SearchScreen(),
        FavoriteScreen(),
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
                  icon: Icon(Icons.favorite_sharp),
                  text: 'Favorate',
                ),
                Tab(
                  icon: Icon(Icons.shopping_bag),
                  text: 'Cart',
                ),
              ])),
    );
  }
}
