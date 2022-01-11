import 'package:dummyapp/dummyapp/data/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNewTopic extends StatelessWidget {
  AddNewTopic({Key? key}) : super(key: key);

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Data>(context, listen: false);
    return AlertDialog(
      title: const Text('Add New Topic For Test'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              controller: _controller,
              decoration: const InputDecoration(
                filled: true,
                hintText: "Enter new topic",
              ),
            ),
            const SizedBox(height: 25.0),
            ElevatedButton(
              onPressed: () {
                provider.addTopic(_controller.text);
                // provider.addTopicsInList();
                Navigator.pop(context);
              },
              child: const Text("Add"),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
