import 'package:bookshopy_app/common/constants.dart';
import 'package:bookshopy_app/common/extension.dart';
import 'package:bookshopy_app/screens/search/search_filter_screen.dart';
import 'package:bookshopy_app/screens/search/search_force_screen.dart';
import 'package:bookshopy_app/screens/search/search_grid_cell.dart';
import 'package:bookshopy_app/screens/search/search_resault.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController textSearch;

  List searchArr = [
    {
      "name": "Biography",
      "img": "assets/img/b1.jpg",
    },
    {
      "name": "Business",
      "img": "assets/img/b2.jpg",
    },
    {
      "name": "Children",
      "img": "assets/img/b3.jpg",
    },
    {
      "name": "Cookery",
      "img": "assets/img/b4.jpg",
    },
    {
      "name": "Fiction",
      "img": "assets/img/b5.jpg",
    },
    {
      "name": "Graphic Novels",
      "img": "assets/img/b6.jpg",
    },
    {
      "name": "Biography",
      "img": "assets/img/b1.jpg",
    },
    {
      "name": "Business",
      "img": "assets/img/b2.jpg",
    },
    {
      "name": "Children",
      "img": "assets/img/b3.jpg",
    },
    {
      "name": "Cookery",
      "img": "assets/img/b4.jpg",
    },
    {
      "name": "Fiction",
      "img": "assets/img/b5.jpg",
    },
    {
      "name": "Graphic Novels",
      "img": "assets/img/b6.jpg",
    }
  ];

  List sResultArr = [
    {
      "name": "The Heart of Hell",
      "img": "assets/img/h1.jpg",
      "author": "Mitch Weiss",
      "description":
          "The untold story of courage and sacrifice in the shadow of Iwo Jima.",
      "rate": 5.0
    },
    {
      "name": "Adrennes 1944",
      "img": "assets/img/h2.jpg",
      "author": "Antony Beevor",
      "description":
          "#1 international bestseller and award winning history book.",
      "rate": 4.0
    },
    {
      "name": "War on the Gothic Line",
      "img": "assets/img/h3.jpg",
      "author": "Christian Jennings",
      "description":
          "Through the eyes of thirteen men and women from seven different nations",
      "rate": 3.0
    }
  ];

  @override
  void initState() {
    textSearch = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 0,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  // padding: const EdgeInsets.all(),
                  decoration: BoxDecoration(
                      color: TColor.textbox,
                      borderRadius: BorderRadius.circular(25)),
                  child: TextField(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchForceScreen(
                            didSearch: (sText) {
                              textSearch.text = sText;
                              if (mounted) {
                                setState(() {});
                              }
                            },
                          ),
                        ),
                      );
                      endEditing();
                    },
                    controller: textSearch,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      prefixIcon: Icon(Icons.search, color: TColor.primary),
                      suffixIcon: IconButton(
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchFiltterScreen(
                                didFilter: (fObj) {
                                  if (mounted) {
                                    setState(() {});
                                  }
                                },
                              ),
                            ),
                          );
                          endEditing();
                        },
                        icon: Icon(
                          Icons.tune,
                          color: TColor.text,
                        ),
                      ),
                      hintText: 'Search Books or Author',
                      hintStyle: const TextStyle(fontSize: 17),
                    ),
                  ),
                ),
              ),
              if (textSearch.text.isNotEmpty)
                const SizedBox(
                  width: 8,
                ),
              if (textSearch.text.isNotEmpty)
                TextButton(
                  onPressed: () {
                    textSearch.text = "";
                    setState(() {});
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      color: TColor.text,
                      fontSize: 17,
                    ),
                  ),
                )
            ],
          ),
        ),
        body: Column(
          children: [
            if (textSearch.text.isEmpty)
              Expanded(
                child: GridView.builder(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    itemCount: searchArr.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.75,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15),
                    itemBuilder: (context, index) => SearchGridCell(
                          index: index,
                          name: searchArr[index]['name'],
                          img: searchArr[index]['img'],
                        )),
              ),
            if (textSearch.text.isNotEmpty)
              Expanded(
                  child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                shrinkWrap: true,
                itemCount: sResultArr.length,
                itemBuilder: (ctx, index) => SearchResault(
                  img: sResultArr[index]['img'],
                  author: sResultArr[index]['author'],
                  name: sResultArr[index]['name'],
                  rating: sResultArr[index]['rate'],
                  description: sResultArr[index]['description'],
                ),
              ))
          ],
        ));
  }
}
