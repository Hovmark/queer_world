import 'package:flutter/material.dart';
import 'package:queer_world/dialogs/add_business_request_dialog.dart';
import 'package:queer_world/design_components/pride_backgroud.dart';

class ScaffoldWithAppBar extends StatelessWidget {
  const ScaffoldWithAppBar(
      {super.key,
      required this.child,
      this.floatingActionButton,
      this.showBottomNavBar = true});

  final Widget child;
  final FloatingActionButton? floatingActionButton;
  final bool showBottomNavBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 81, 128, 62),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [const PrideBackground(), child],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => showDialog(
          context: context,
          builder: (_) => const AddBusinessRequestDialog(),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //     selectedItemColor: Colors.white,
      //     // backgroundColor: lightGreen,
      //     backgroundColor: rainbowPurple,
      //     currentIndex: _selectedIndex,
      //     onTap: _onItemTapped,
      //     items: navItems),
    );
  }
}
