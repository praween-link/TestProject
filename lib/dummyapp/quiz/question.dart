import 'package:dummyapp/dummyapp/data/data_controller.dart';
import 'package:flutter/material.dart';

class Question extends StatefulWidget {
  const Question({
    Key? key,
    required this.ques,
  }) : super(key: key);

  final String ques;

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  QuestionOptions? _option;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 330,
            child: Text(widget.ques,
                style: const TextStyle(
                  color: Color(0xFF480c96),
                  fontSize: 18.0,
                  fontWeight: FontWeight.w800,
                ),
                textDirection: TextDirection.ltr),
          ),
          const SizedBox(height: 5),
          Container(
            child: Column(
              children: [
                MyOption(
                  title: 'Option-1',
                  val: QuestionOptions.OPTION1,
                  groutVal: _option,
                  radioCallBack: (QuestionOptions? value) {
                    setState(() {
                      _option = value;
                    });
                  },
                ),
                MyOption(
                  title: 'Option-2',
                  val: QuestionOptions.OPTION2,
                  groutVal: _option,
                  radioCallBack: (QuestionOptions? value) {
                    setState(() {
                      _option = value;
                    });
                  },
                ),
              ],
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFfcfcfc),
                  offset: Offset(10, 10),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
                BoxShadow(
                  color: Color(0xFFebebeb),
                  offset: Offset(4, 4),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyOption extends StatelessWidget {
  const MyOption({
    Key? key,
    required this.title,
    required this.groutVal,
    required this.val,
    required this.radioCallBack,
  }) : super(key: key);
  final String title;
  final QuestionOptions? groutVal;
  final QuestionOptions val;
  final Function(QuestionOptions?)? radioCallBack;

  @override
  Widget build(BuildContext context) {
    return RadioListTile<QuestionOptions>(
      title: Text(title),
      value: val,
      groupValue: groutVal,
      onChanged: radioCallBack,
    );
  }
}
