import 'package:dummyapp/dummyapp/data/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListOfRowButtons extends StatelessWidget {
  const ListOfRowButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Data>(context);
    return Container(
      height: MediaQuery.of(context).size.height / 5,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Color(0xFF480c96),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 120),
            // child: ListView(
            //   scrollDirection: Axis.horizontal,
            //   children: provider.subjectButtons,
            // ),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: provider.listtopics.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: OutlinedButton(
                      onPressed: () {},
                      // onPressed: () => Navigator.pop(context),
                      child: Text(
                        provider.listtopics[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        shape: const StadiumBorder(),
                        side: const BorderSide(width: 2.0, color: Colors.white),
                        // backgroundColor: Colors.yellow,
                      ),
                      
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
//

