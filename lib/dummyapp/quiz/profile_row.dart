import 'package:flutter/material.dart';

class ProfileRow extends StatelessWidget {
  const ProfileRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.only(bottom: 103),
            child: Row(
              children: <Widget>[
                const SizedBox(width: 15.0),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        // backgroundColor: Color(0xFF594c69),
                        backgroundColor: Colors.grey[200],
                        child: const CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/my/girl.jpg'),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 6.0, left: 45.0),
                        child: CircleAvatar(
                          radius: 5,
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10.0),
                const Text('Khushi Kumari', style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold,), textAlign: TextAlign.right,),
                const SizedBox(width: 20.0),
                const Text('Jan 11, 2022', style: TextStyle(color: Colors.white, fontSize: 16.0,), textAlign: TextAlign.right,),
                const SizedBox(width: 10.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
