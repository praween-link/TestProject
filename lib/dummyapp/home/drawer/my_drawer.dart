import 'package:dummyapp/dummyapp/home/add_questions/add_new_topic.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFF480c96),
            ),
            child: Container(
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Khushi Kumari',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text(
              'Add Topic',
              style: TextStyle(
                color: Color(0xFF480c96),
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            leading: const Icon(
              Icons.add_to_photos_sharp,
              color: Color(0xFF480c96),
            ),
            subtitle: const Divider(
              height: 2,
              thickness: 1,
            ),
            onTap: () {
              ////////////////Dialog box
              showDialog<void>(
                context: context,
                barrierDismissible: false, // user must tap button!
                builder: (BuildContext context) {
                  return AddNewTopic();
                },
              );
            },
          ),
          ListTile(
            title: const Text(
              'Add Sub Topics',
              style: TextStyle(
                color: Color(0xFF480c96),
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            leading: const Icon(
              Icons.add_to_photos_sharp,
              color: Color(0xFF480c96),
            ),
            subtitle: const Divider(
              height: 2,
              thickness: 1,
            ),
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => const AddSubTopics()));
            },
          ),
        ],
      ),
    );
  }
}
