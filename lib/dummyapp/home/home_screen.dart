import 'package:dummyapp/dummyapp/data/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'drawer/my_drawer.dart';
import 'list_of_row_buttons.dart';
import 'my_clipper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeNmae = '/homescreen';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Data>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todays Survey',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.w800,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () => Scaffold.of(context).openDrawer(),
                child: Image.asset(
                  'assets/my/menu_icon.png',
                ),
              );
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 40,
                  // backgroundColor: Color(0xFF594c69),
                  backgroundColor: Colors.grey[200],
                  child: const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/my/girl.jpg'),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 6.0, left: 55.0),
                  child: CircleAvatar(
                    radius: 5,
                    backgroundColor: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
        backgroundColor: const Color(0xFF480c96),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 90, left: 25.0, right: 25.0),
            child: ListView(
              children: provider.surveyStatistics,
            ),
          ),
          ClipPath(
            child: const ListOfRowButtons(),
            clipper: MyClippers(),
          ),
        ],
      ),
      drawer: const MyDrawer(),
    );
  }
}
