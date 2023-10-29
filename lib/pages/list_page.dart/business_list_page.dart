import 'package:flutter/material.dart';
import 'package:queer_world/design_components/queer_icons.dart';
import 'package:queer_world/design_components/queer_text.dart';
import 'package:queer_world/models/business.dart';
import 'package:queer_world/pages/business_page.dart';
import 'package:queer_world/pages/list_page.dart/widgets/searchbar.dart';

class BusinessListPage extends StatelessWidget {
  const BusinessListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: const Color.fromARGB(255, 109, 171, 111),
          child: const Column(children: [
            SizedBox(height: 40),
            QueerTextBody(text: "Search for businesses"),
            SearchBarApp(),
          ]),
        ),
        const SizedBox(height: 20),
        // const AnimatedBackground(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
          child: Row(children: [
            QueerTextBody(text: "${businessList.length} businesses"),
            const Spacer(),
            const Icon(Icons.filter_list_rounded),
            const QueerTextBody(text: "filters")
          ]),
        ),
        ...businessList.map(
          (b) => GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) => BusinessPage(business: b),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.green)),
                          child: const Icon(
                            Icons.person,
                            size: 40,
                          )),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          QueerTextBody(text: b.name),
                          QueerTextBodySmall(text: b.description),
                          QueerTextBodySmall(text: b.locationOrUndefined)
                        ],
                      ),
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          QueerIconButton(
                            icon: Icons.share,
                            onPressed: () {},
                          ),
                          QueerIconButton(
                            icon: Icons.favorite_border,
                            onPressed: () {},
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
