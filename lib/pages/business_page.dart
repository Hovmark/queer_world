import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:queer_world/design_components/colors.dart';
import 'package:queer_world/models/business.dart';

class BusinessPage extends StatefulWidget {
  const BusinessPage({super.key, required this.business});
  final Business business;

  @override
  State<BusinessPage> createState() => _BusinessPageState();
}

class _BusinessPageState extends State<BusinessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 81, 128, 62),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          const Icon(Icons.person, size: 340),
          Text(widget.business.name),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(FontAwesomeIcons.instagram)),
              IconButton(
                  onPressed: () {}, icon: const Icon(FontAwesomeIcons.tiktok)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.web))
            ],
          ),
          Expanded(
            child: Container(
                width: MediaQuery.of(context).size.width,
                color: lightGreen,
                child: const Icon(Icons.map, size: 180)),
          )
        ],
      ),
    );
  }
}
