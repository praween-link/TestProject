import 'package:dummyapp/dummyapp/data/data_controller.dart';
import 'package:dummyapp/dummyapp/home/my_clipper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'profile_row.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);
  static const routeName = '/quickScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quick Survey',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.w800,
          ),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Icon(Icons.chevron_left, size: 30),
          ),
        ),
        backgroundColor: const Color(0xFF480c96),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 125.0),
            child: ListView(children: Provider.of<Data>(context).myQuestions,),
          ),
          ClipPath(
            child: const ProfileRow(),
            clipper: MyClippers(),
          ),
        ],
      ),
    );
  }
}
