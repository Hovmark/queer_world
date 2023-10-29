import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:queer_world/design_components/colors.dart';
import 'package:queer_world/models/business.dart';
import 'package:queer_world/pages/business_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width,
          // color: lightGreen,
          child: const Column(children: [
            SizedBox(height: 120),
            Icon(FontAwesomeIcons.rainbow, size: 80),
            Text("RainboWorld", style: TextStyle(fontSize: 54)),
          ]),
        ),
        const SizedBox(height: 20),
        // const AnimatedBackground(),
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
            child: Text("Todays selection")),
        GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (BuildContext context) =>
                  BusinessPage(business: todaysSelection),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: green)),
                        child: const Icon(
                          Icons.person,
                          size: 200,
                        )),
                    Text(todaysSelection.name,
                        style: const TextStyle(fontSize: 14)),
                    Text(todaysSelection.description,
                        style: const TextStyle(fontSize: 12)),
                    Text(todaysSelection.locationOrUndefined,
                        style: const TextStyle(fontSize: 12))
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
