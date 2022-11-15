import 'package:bottle_app/constants/helpers.dart';
import 'package:bottle_app/model/posts.dart';
import 'package:bottle_app/view/layout/item_admin_posts_layout.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class ScreenAdminPosts extends StatefulWidget {
  String postsOfUser;

  @override
  _ScreenAdminPostsState createState() => _ScreenAdminPostsState();

  ScreenAdminPosts({
    required this.postsOfUser,
  });
}

class _ScreenAdminPostsState extends State<ScreenAdminPosts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Text(
          'Posts',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: getVideosForPosts(widget.postsOfUser),
        builder: (context, snapshot) {
        if(snapshot.hasData){
          var outerPosts=snapshot.data!.docs.map((e) => posts.fromMap(e.data() as Map<String,dynamic>)).toList();
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              var innerdata=outerPosts[index];
              DateTime timeOfUploading=DateTime.fromMillisecondsSinceEpoch(innerdata.uploadTime);
              final DateFormat format1 = DateFormat('MMM');
              return ItemAdminPostsLayout(
                  uploadTime: '${timeOfUploading.day} ${format1.format(timeOfUploading)}, ${timeOfUploading.year} ${DateFormat.jm().format(timeOfUploading)}',
                  videoUrl: innerdata.videoUrl,
                  personID: innerdata.userID,
                likesLength: innerdata.likes.length,
                  );
            },
            itemCount: outerPosts.length,
          );
        }
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(
            child: CircularProgressIndicator(color: Colors.green,),
          );
        }
        return Center(
          child: Text('No Data Available',style: TextStyle(color: Colors.red,fontSize: 12),),
        );
      },),
    );
  }
}
