import 'package:bookshopy_app/screens/favorite/favorite_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/common/constants.dart';
import '/provider/products.dart';

import '../main_tab/components/app_drawer.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late Future _favoriteFuture;
  Future _obtainfavoritesFuture() {
    return Provider.of<Products>(context, listen: false)
        .fetchAndSetFavoriteProduct();
  }

  @override
  void initState() {
    _favoriteFuture = _obtainfavoritesFuture();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        endDrawer: AppDrawer(
            // sideMenuScaffoldKey: sideMenuScaffoldKey,
            selectedPage: 2),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: TColor.primary,
          title: const Text('Your Favorites Books'),
          leading: const SizedBox(),
        ),
        body: FutureBuilder(
          future: _favoriteFuture,
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.error != null) {
                return const Center(
                  child: Text('SomeThing went Wrong'),
                );
              } else {
                // final favoriteProducts =
                //     Provider.of<Products>(context, listen: false).favorites;
                return Consumer<Products>(
                    builder: (ctx, favoriteValue, _) => GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 3 / 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10),
                          itemCount: favoriteValue.favorites.length,
                          itemBuilder: (ctx, index) => FavoriteItem(
                            // favoriteProduct: favoriteProducts[index],
                            favoriteProduct: favoriteValue.favorites[index],
                          ),
                        ));
              }
            }
          },
        ));
  }
}
