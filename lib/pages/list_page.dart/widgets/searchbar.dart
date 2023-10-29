import 'package:flutter/material.dart';
import 'package:queer_world/models/business.dart';

class SearchBarApp extends StatefulWidget {
  const SearchBarApp({super.key});

  @override
  State<SearchBarApp> createState() => _SearchBarAppState();
}

class _SearchBarAppState extends State<SearchBarApp> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SearchAnchor(
          builder: (BuildContext context, SearchController controller) {
        return SearchBar(
          controller: controller,
          padding: const MaterialStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 16.0)),
          onTap: () {
            controller.openView();
          },
          onChanged: (_) {
            controller.openView();
          },
          leading: const Icon(Icons.search),
          trailing: <Widget>[
            IconButton(
              isSelected: isDark,
              onPressed: () {
                setState(() {
                  isDark = !isDark;
                });
              },
              icon: Container(
                  height: 34,
                  width: 34,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          spreadRadius: -4,
                          blurRadius: 10,
                          offset: Offset(2, 2))
                    ],
                    color: const Color.fromARGB(255, 109, 171, 111),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(Icons.arrow_forward_ios)),
            )
          ],
        );
      }, suggestionsBuilder:
              (BuildContext context, SearchController controller) {
        return List<ListTile>.generate(businessList.length, (int index) {
          final String item = businessList[index].name;
          return ListTile(
            title: Text(item),
            onTap: () {
              setState(() {
                controller.closeView(item);
              });
            },
          );
        });
      }),
    );
  }
}
