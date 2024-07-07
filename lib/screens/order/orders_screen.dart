import 'package:bookshopy_app/common/constants.dart';
import 'package:bookshopy_app/provider/orders.dart';
import 'package:bookshopy_app/screens/main_tab/components/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/order_widget.dart';

class OrdersScreen extends StatefulWidget {
  static const routeName = '/orders';
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

// GlobalKey<ScaffoldState> sideMenuScaffoldKey = GlobalKey<ScaffoldState>();

class _OrdersScreenState extends State<OrdersScreen> {
  late Future _orderFuture;
  Future _obtainOrdersFutre() {
    return Provider.of<Orders>(context, listen: false).fetchAndSetOrders();
  }

  @override
  void initState() {
    _orderFuture = _obtainOrdersFutre();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: sideMenuScaffoldKey,

      backgroundColor: Colors.white,
      endDrawer: AppDrawer(
          // sideMenuScaffoldKey: sideMenuScaffoldKey,
          selectedPage: 2),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Builder(builder: (context) {
        return SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Your Orders',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            //..
                            Scaffold.of(context).openEndDrawer();
                            // sideMenuScaffoldKey.currentState!.openEndDrawer();
                          },
                          icon: Icon(
                            size: 25,
                            Icons.menu,
                            color: TColor.primary,
                          )),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  // width: double.infinity,
                  child: FutureBuilder(
                    future: _orderFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        if (snapshot.error != null) {
                          return const Center(
                            child: Text('Something Went Wrongr'),
                          );
                        } else {
                          return Consumer<Orders>(
                            builder: (ctx, orderData, _) => ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                itemCount: orderData.orders.length,
                                itemBuilder: (ctx, index) => OrderW(
                                      order: orderData.orders[index],
                                    )),
                          );
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
