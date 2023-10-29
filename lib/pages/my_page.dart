import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:queer_world/design_components/colors.dart';
import 'package:queer_world/models/business.dart';
import 'package:queer_world/pages/business_page.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: transparent, // const Color.fromARGB(255, 81, 128, 62),
      appBar: AppBar(
        backgroundColor: transparent,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Icon(Icons.favorite, size: 140),
          const Text("My page"),
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
            child: CustomScrollView(
              primary: false,
              slivers: <Widget>[
                SliverPadding(
                  padding: const EdgeInsets.all(20),
                  sliver: SliverGrid.count(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      children: [
                        ...myLiked.map(
                          (b) => GestureDetector(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    BusinessPage(business: b),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 4,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Container(
                                          height: 100,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Colors.green)),
                                          child: const Icon(
                                            Icons.person,
                                            size: 40,
                                          )),
                                      const SizedBox(width: 8),
                                      Text(b.name,
                                          style: const TextStyle(fontSize: 14)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
