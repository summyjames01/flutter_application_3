import 'friend.dart';
import 'usercomment.dart';
import 'userpost.dart';
import 'account.dart';

class UserData {
  List<Userpost> userList = [
    Userpost(
      userimg: 'assets/speed.jpg',
      username: 'Ishowspeed',
      time: '1 minute ago',
      postcontent: 'Ronaldoooo',
      postimg: 'postimg',
      numcomments: '5k comments',
      numshare: '6 shares',
      isLiked: false,
    ),
    Userpost(
      userimg: 'assets/speed.jpg',
      username: 'Ishowspeed',
      time: '1 minute ago',
      postcontent: 'Ronaldoooo',
      postimg: 'postimg',
      numcomments: '5k comments',
      numshare: '6 shares',
      isLiked: false,
    ),
    Userpost(
      userimg: 'assets/speed.jpg',
      username: 'Ishowspeed',
      time: '1 minute ago',
      postcontent: 'Ronaldoooo',
      postimg: 'postimg',
      numcomments: '5k comments',
      numshare: '6 shares',
      isLiked: false,
    ),
  ];

  List<Friend> friendList = [
    Friend(img: 'assets/kent.jpg', name: 'Kent Cleo Dion'),
    Friend(img: 'assets/maisie.jpg', name: 'Maisie Gabaton'),
    Friend(img: 'assets/kyla.jpg', name: 'Kyla Cano'),
    Friend(img: 'assets/carlo.jpg', name: 'Carlo Velvestre'),
    Friend(img: 'assets/paul.jpg', name: 'Paul Castilla'),
    Friend(img: 'assets/justine.jpg', name: 'Justine De Juan'),
  ];
  List<Usercomment> commentList = [
    Usercomment(
        commenterImg: 'assets/speed.jpg',
        commenterName: 'Ishowspeed',
        commenterTime: '5w',
        commenterContent: 'Ronaldoooooooo'),
    Usercomment(
        commenterImg: 'assets/kai.jpg',
        commenterName: 'Ray',
        commenterTime: '2w',
        commenterContent: 'LingLing'),
    Usercomment(
        commenterImg: 'assets/ray.jpg',
        commenterName: 'Kai Cenat',
        commenterTime: '1w',
        commenterContent: 'Rayyyyyyyyyyy'),
  ];

  Account myUserAccount = Account(
      name: 'Summy James Espina',
      email: 'summyjames@gmail.com',
      img: 'assets/summy.jpg',
      numFollowers: '1.5k',
      numPosts: '100',
      numFollowing: '420',
      numFriends: '1500');
}
