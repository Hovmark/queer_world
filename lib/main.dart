import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:queer_world/design_components/colors.dart';
import 'package:queer_world/dialogs/add_business_request_dialog.dart';
import 'package:queer_world/init.dart';
import 'package:queer_world/pages/list_page.dart/business_list_page.dart';
import 'package:queer_world/pages/home_page.dart';
import 'package:queer_world/pages/my_page.dart';
import 'package:queer_world/design_components/pride_backgroud.dart';
import 'package:queer_world/business_state.dart';

GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await tryFirebaseInit();
  getIt.registerSingleton(BusinessState(), signalsReady: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rainbow world',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const RainbowWorld(),
    );
  }
}

class RainbowWorld extends StatefulWidget {
  const RainbowWorld({super.key});

  @override
  State<RainbowWorld> createState() => _RainbowWorldState();
}

class _RainbowWorldState extends State<RainbowWorld> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 81, 128, 62),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          const PrideBackground(),
          _pages.elementAt(_selectedIndex),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => showDialog(
          context: context,
          builder: (_) => const AddBusinessRequestDialog(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.white,
          // backgroundColor: lightGreen,
          backgroundColor: rainbowPurple,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: navItems),
    );
  }
}

const List<Widget> _pages = <Widget>[BusinessListPage(), HomePage(), MyPage()];

const List<BottomNavigationBarItem> navItems = [
  BottomNavigationBarItem(
    icon: Icon(Icons.list),
    label: 'All',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.favorite),
    label: 'Fave',
  ),
];
