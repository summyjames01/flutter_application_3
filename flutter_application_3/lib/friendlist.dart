import 'package:flutter/material.dart';
import 'package:flutter_application_3/model/userdata.dart';
import 'package:flutter_application_3/model/friend.dart';

class Friendlist extends StatelessWidget {
  Friendlist({super.key, required this.userdata});

  final UserData userdata;

  var followTxtStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  Widget friend(Friend friend) => Card(
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                friend.img,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(friend.name),
            ),
          ],
        ),
      );

  Widget friendsListGrid() => GridView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisExtent: 180,
        ),
        itemCount: userdata.friendList.length,
        itemBuilder: (BuildContext ctx, index) {
          return friend(userdata.friendList[index]);
        },
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              Text(
                'Friends',
                style: followTxtStyle,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              Text('${userdata.myUserAccount.numFriends} Friends'),
            ],
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 380,
          child: friendsListGrid(),
        ),
        SizedBox(
          height: 10,
          child: Container(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
