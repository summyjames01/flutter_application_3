import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/model/userdata.dart';
import 'package:flutter_application_3/model/userpost.dart';
import 'package:flutter_application_3/model/usercomment.dart';
import 'package:flutter_application_3/model/account.dart';

class ProfileView extends StatefulWidget {
  final Userpost userpost;

  const ProfileView({
    super.key,
    required this.userpost,
  });

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final UserData userData = UserData();
  bool isClicked = false;
  TextEditingController commentController = TextEditingController();
  late Account account;
  FocusNode commentFocusNode = FocusNode();

  @override
  void initState() {
    account = userData.myUserAccount;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  var nameTxtStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  var boldTxtStyle = const TextStyle(
    fontWeight: FontWeight.bold,
  );

  var boldTxtStyle1 = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  Widget commentBtn(Usercomment userComment) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(userComment.commenterTime),
            const SizedBox(width: 15),
            const Text('Like'),
            const SizedBox(width: 15),
            const Text('Reply'),
          ],
        ),
      );

  Widget commentDesc(Usercomment userComment) => Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(userComment.commenterName, style: boldTxtStyle),
            const SizedBox(height: 5),
            Row(
              children: [
                Text(userComment.commenterContent),
              ],
            )
          ],
        ),
      );

  Widget commentSpace(Usercomment userComment) => Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(35, 158, 158, 158),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: commentDesc(userComment),
      );

  Widget commenterPic(Usercomment userComment) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(userComment.commenterImg),
        ),
      );

  Widget userCommenterLine(Userpost userpost, Usercomment usercomment) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          commenterPic(usercomment),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commentSpace(usercomment),
              commentBtn(usercomment),
            ],
          )
        ],
      );

  Widget userPostDetails(Usercomment usercomment) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          userCommenterLine(widget.userpost, usercomment),
        ],
      );

  Widget commenters(Userpost userpost) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Divider(color: Color.fromARGB(86, 158, 158, 158)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text(userpost.numshare, style: boldTxtStyle),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text('All comment', style: boldTxtStyle1),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
          const SizedBox(height: 15),
        ],
      );

  Widget buttons(Userpost userpost) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Divider(color: Color.fromARGB(86, 158, 158, 158)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  style: TextButton.styleFrom(
                    foregroundColor:
                        (userpost.isLiked) ? Colors.blue : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      userpost.isLiked = (userpost.isLiked) ? false : true;
                    });
                  },
                  icon: const Icon(Icons.thumb_up),
                  label: const Text('Like'),
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      isClicked = (isClicked) ? false : true;
                    });
                  },
                  icon: const Icon(CupertinoIcons.chat_bubble),
                  label: const Text('Comment'),
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.grey,
                  ),
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.arrowshape_turn_up_right),
                  label: const Text('Share'),
                ),
              ],
            ),
          ),
          const Divider(color: Color.fromARGB(86, 158, 158, 158)),
        ],
      );

  Widget userLine(Userpost userpost) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(userpost.userimg),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userpost.username,
                style: nameTxtStyle,
              ),
              Row(
                children: [
                  Text(userpost.time),
                  const Text(' . '),
                  const Icon(Icons.group, size: 16, color: Colors.grey),
                ],
              )
            ],
          )
        ],
      );

  Widget userName(Userpost userpost) => Text(
        userpost.username,
        style: const TextStyle(color: Colors.black),
      );

  Widget postImage(Userpost userpost) => Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(userpost.postcontent),
              ],
            ),
            const SizedBox(height: 15),
            Container(
              height: 350,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(userpost.postimg),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      );

  Widget commentBox() {
    if (isClicked) {
      FocusScope.of(context).requestFocus(commentFocusNode);
    }

    return isClicked
        ? Container(
            margin: const EdgeInsets.all(10),
            child: TextField(
              controller: commentController,
              focusNode: commentFocusNode,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                hintText: 'Write a comment...',
                suffixIcon: IconButton(
                  onPressed: () {
                    addComment(account);
                  },
                  icon: const Icon(
                    CupertinoIcons.paperplane,
                    size: 25,
                  ),
                ),
              ),
            ),
          )
        : Container();
  }

  addComment(Account account) {
    Usercomment newComment = Usercomment(
      commenterImg: account.img,
      commenterName: account.name,
      commenterTime: '1m',
      commenterContent: commentController.text,
    );

    setState(() {
      userData.commentList.add(newComment);
      commentController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: userName(widget.userpost),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
        ),
      ),
      body: ListView(
        children: [
          userLine(widget.userpost),
          postImage(widget.userpost),
          buttons(widget.userpost),
          commenters(widget.userpost),
          ListView(
            shrinkWrap: true,
            children: userData.commentList.map((userComment) {
              return userPostDetails(userComment);
            }).toList(),
          ),
          commentBox(),
        ],
      ),
    );
  }
}
