import 'package:flutter/material.dart';

class BottomNavBar2 extends StatefulWidget {
  const BottomNavBar2({super.key});

  @override
  State<BottomNavBar2> createState() => _BottomNavBar2State();
}

class _BottomNavBar2State extends State<BottomNavBar2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
            ),
            // height: 93,
            padding: const EdgeInsets.only(top: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: navBarItems,
            ),
          ),
        ],
      ),
    );
  }
}

final List<IconButton> navBarItems = [
  IconButton(
    icon: const Icon(Icons.home),
    onPressed: () {},
  ),
  IconButton(
    icon: const Icon(Icons.create),
    onPressed: () {},
  ),
  IconButton(
    icon: const Icon(Icons.favorite),
    onPressed: () {},
  ),
];
