import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dummyapp/dummyapp/home/survey_card.dart';
import 'package:dummyapp/dummyapp/home/video_card.dart';
import 'package:dummyapp/dummyapp/quiz/question.dart';
import 'package:flutter/material.dart';

enum QuestionOptions { OPTION1, OPTION2, OPTION3 }

class Data extends ChangeNotifier {
  
  List<String> listtopics = [];
  /// Add New Operator
  Future<void>? addNewTopic(String topicname) {
    listtopics = [];
    CollectionReference operator =
        FirebaseFirestore.instance.collection('Topics');
    return operator
        .add({'topic': topicname})
        .then(
          (value) => print("User Added"),
        )
        .catchError(
          (error) => print("Error: $error"),
        );
  }

  void addTopic(String topicname) {
    addNewTopic(topicname);
    notifyListeners();
  }

  /// Get all Topic from firebase
  void addTopicsInList() async {
    listtopics = [];
    notifyListeners();
    await for (var snapshot
        in FirebaseFirestore.instance.collection('Topics').snapshots()) {
      for (var data in snapshot.docs) {
        listtopics.add((data.data()['topic']));
        // admins.add(admin);
    notifyListeners();
      }
    notifyListeners();
    }
  }

  ///////////////////////////////////////////////////
  List<Widget> myQuestions = [
    const Question(
        ques: 'How often do you consume fast food on a weekly basis?'),
    const Question(
        ques: 'Do you use discount coupons to buy fast food?'),
    const Question(
        ques: 'The fundamental economic problem faced by all societies is:'),
    Padding(
      padding: const EdgeInsets.only(top: 50.0, bottom: 30.0),
      child: ElevatedButton(
        onPressed: () {},
        // onPressed: () =>
        //     Navigator.pushNamed(context, HomeScreen.routeNmae),
        child: const Padding(
          padding: EdgeInsets.only(
            top: 25,
            bottom: 25,
            left: 90,
            right: 90,
          ),
          child: Text(
            'Submit',
            style: TextStyle(
                color: Color(0xFF480c96),
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // <-- Radius
          ),
          primary: Colors.yellow,
        ),
      ),
    ),
  ];

  /// Survey Statistics
  
  List<Widget> surveyStatistics = [
    const SizedBox(height: 37.0),
    const Padding(
      padding: EdgeInsets.only(top: 37.0),
      child: VideoCard(),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 25.0, bottom: 10),
      child: Container(
        alignment: Alignment.centerLeft,
        child: const Text(
          "Survey Statistics",
          style: TextStyle(
            color: Color(0xFF480c96),
            fontSize: 25.0,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    ),
    const SizedBox(height: 20.0),
    const Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: SurveyCard(
          title: 'Food & Drink',
          points: 60.0,
          cardicon: 'assets/surveyicon/food.png'),
    ),
    const SizedBox(height: 10.0),
    const SurveyCard(
        title: 'Business',
        points: 45.0,
        cardicon: 'assets/surveyicon/business.png'),
    const SizedBox(height: 10.0),
    const SurveyCard(
        title: 'Health',
        points: 58.0,
        cardicon: 'assets/surveyicon/health.png'),
    const SizedBox(height: 10.0),
    const SurveyCard(
        title: 'Food & Drink',
        points: 40.0,
        cardicon: 'assets/surveyicon/food.png'),
    const SizedBox(height: 10.0),
    const SurveyCard(
        title: 'Health',
        points: 80.0,
        cardicon: 'assets/surveyicon/health.png'),
  ];
}
