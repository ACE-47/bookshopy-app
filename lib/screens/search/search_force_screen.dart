import 'package:flutter/material.dart';

import '../../common/constants.dart';

class SearchForceScreen extends StatefulWidget {
  static const routeName = '/search-force';
  final Function(String)? didSearch;
  const SearchForceScreen({super.key, this.didSearch});
  @override
  State<SearchForceScreen> createState() => _SearchForceScreenState();
}

class _SearchForceScreenState extends State<SearchForceScreen> {
  late TextEditingController textSearch;

  List previousArr = [
    "Search 1",
    "Search 2",
    "Search 3",
    "Search 4",
    "Search 5"
  ];

  List resultArr = [
    "Gross Anatomy",
    "When To Rob A Bank",
    "The Bite In The Apple",
    "The Ignorant Maestro"
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
                    controller: textSearch,
                    onChanged: (value) {
                      setState(() {
                        //...
                      });
                    },
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        prefixIcon: Icon(Icons.search, color: TColor.primary),
                        hintText: 'Search Here',
                        hintStyle: const TextStyle(fontSize: 17)),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  'Cancel',
                  style: TextStyle(color: TColor.text, fontSize: 20),
                ),
              )
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (textSearch.text.isEmpty)
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Text(
                  "Previous Searches",
                  style: TextStyle(
                      color: TColor.subTitle,
                      fontSize: 13,
                      fontWeight: FontWeight.w700),
                ),
              ),
            Expanded(
              child: ListView.builder(
                itemCount: textSearch.text.isEmpty
                    ? previousArr.length
                    : resultArr.length,
                itemBuilder: (context, index) {
                  String searchResultText = (textSearch.text.isEmpty
                      ? previousArr
                      : resultArr)[index];
                  return GestureDetector(
                    onTap: () {
                      if (widget.didSearch != null) {
                        widget.didSearch!(searchResultText);
                      }
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 25),
                      child: Row(children: [
                        Icon(Icons.search, color: TColor.subTitle),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: Text(
                          searchResultText,
                          style: TextStyle(color: TColor.text, fontSize: 15),
                        )),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "times",
                          style: TextStyle(
                              color: TColor.primaryLight, fontSize: 15),
                        )
                      ]),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
