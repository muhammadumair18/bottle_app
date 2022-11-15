import 'package:bottle_app/interface/loading_listener.dart';
import 'package:bottle_app/model/posts.dart';
import 'package:bottle_app/model/user.dart' as model;
import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference userref=FirebaseFirestore.instance.collection("users");
CollectionReference postsref=FirebaseFirestore.instance.collection("posts");
CollectionReference adminpostsref=FirebaseFirestore.instance.collection("adminposts");
CollectionReference adminusersref=FirebaseFirestore.instance.collection("adminusers");
CollectionReference subadminref=FirebaseFirestore.instance.collection("subadmins");
CollectionReference notificationref=FirebaseFirestore.instance.collection("notifications");


Future<model.User> getUserData(String userid) async{
  var dataget=await userref.doc(userid).get();
  model.User user=model.User.fromMap(dataget.data() as Map<String,dynamic>);
  return user;
}

Future<int> getVideoData(String userid) async{
  var postslength=await postsref.where("userID",isEqualTo:userid).get();
  int videosLength=postslength.docs.length;
  return videosLength;
}

Future<QuerySnapshot> getVideosForPosts(String userid) async{
  return await postsref.where("userID",isEqualTo:userid).get();

}


void changeLoadingStatus(bool status, LoadingListener listener){
  listener.onLoadingStatusChanged(status);
}




// if (notification != null && android != null ) {
//   flutterLocalNotificationsPlugin.show(
//     notification.hashCode,
//     notification.title,
//     notification.body,
//     NotificationDetails(
//       android: AndroidNotificationDetails(
//         channel.id,
//         channel.name,
//         channelDescription: channel.description,
//         priority: Priority.high,
//         icon: '@mipmap/ic_launcher'
//         // TODO add a proper drawable resource to android, for now using
//         //      one that already exists in example app.
//       ),
//     ),
//   );
// }