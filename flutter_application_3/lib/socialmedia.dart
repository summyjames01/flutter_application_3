import 'package:flutter/material.dart';
import 'package:flutter_application_3/friendlist.dart';
import 'package:flutter_application_3/infoheader.dart';
import 'package:flutter_application_3/mainheader.dart';
import 'package:flutter_application_3/model/userdata.dart';
import 'package:flutter_application_3/postlist.dart';

class Socialmedia extends StatefulWidget {
  const Socialmedia({super.key});

  @override
  State<Socialmedia> createState() => _SocialmediaState();
}

class _SocialmediaState extends State<Socialmedia> {
  UserData userdata = UserData();
  var followTxtStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Mainheader(userdata: UserData()),
          Infoheader(userdata: UserData()),
          Friendlist(userdata: UserData()),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                Text('Post', style: followTxtStyle),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Postlist(userdata: userdata),
        ],
      ),
    );
  }
}
