import 'package:bottle_app/view/screen/screen_admin_blocked_users.dart';
import 'package:bottle_app/view/screen/screen_admin_dashbord.dart';
import 'package:bottle_app/view/screen/screen_admin_settings.dart';
import 'package:bottle_app/view/screen/screen_login_screen.dart';
import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

//checking the git

AndroidNotificationChannel channel= AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description : 'This channel is used for important notifications.', // description
  importance: Importance.max,
);

// flutter local notification
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

//--------------------------------------------------------------------------





bool isFlutterLocalNotificationsInitialized = false;

// Future<void> setUpFlutterNotification()async{
//
//   if (isFlutterLocalNotificationsInitialized) {
//     return;
//   }
//
//   // await flutterLocalNotificationsPlugin
//   //     .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
//   //     ?.createNotificationChannel(channel);
//   // await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//   //   alert: true,
//   //   badge: true,
//   //   sound: true,
//   // );
//
//   isFlutterLocalNotificationsInitialized=true;
// }

// void showFlutterNotification(RemoteMessage message) {
//   RemoteNotification? notification = message.notification;
//   AndroidNotification? android = message.notification?.android;
//   print(message.notification);
//   print(message.data);
//   if (notification != null && android != null ) {
//     flutterLocalNotificationsPlugin.show(
//       notification.hashCode,
//       notification.title,
//       notification.body,
//       NotificationDetails(
//         android: AndroidNotificationDetails(
//           channel.id,
//           channel.name,
//           channelDescription: channel.description,
//           priority: Priority.high,
//           // TODO add a proper drawable resource to android, for now using
//           //      one that already exists in example app.
//           icon: 'launch_background',
//         ),
//       ),
//     );
//   }
// }


List<CameraDescription> cameras=[];

Future<void> _basckgroundMessageHandler(RemoteMessage message) async{
  print('Backgroundhandler');
  print('${message.data['type']}');
  print('${message.data['content']}');
  if(message.notification != null){
    print(message.notification!.title);
    print(message.notification!.body);
  }
  Firebase.initializeApp();
  //FlutterLocalNotification.show(..... So on will not be written here
  //it will send two messages
}

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_basckgroundMessageHandler);
  // if (!kIsWeb) {
  //   await setUpFlutterNotification();
  // }


  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  print( await FirebaseMessaging.instance.getToken());
  runApp(const MyApp());
  cameras = await availableCameras();
  FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
    // TODO: If necessary send token to application server.

    // Note: This callback is fired at each app startup and whenever a new
    // token is generated.
  }).onError((err) {
    // Error getting token.
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.


  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
    // FirebaseMessaging.onMessage.listen(_handleMessage);
    FirebaseMessaging.onMessage.listen((message){
      // RemoteNotification? notification = message.notification;
      // AndroidNotification? android = message.notification?.android;
      print(message.data);
      if(message.notification != null){
        print(message.notification!.title);
        print(message.notification!.body);

        print('${message.data['type']}');
        print('${message.data['content']}');

      }
      // The missing is in the helpers
      flutterLocalNotificationsPlugin.show(
        message.data.hashCode,
        message.notification!.title,
        message.notification!.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              priority: Priority.high,
              icon: '@mipmap/ic_launcher'
            // TODO add a proper drawable resource to android, for now using
            //      one that already exists in example app.
          ),
        ),
      );
    });
  }

  void _handleMessage(RemoteMessage message) {
    print('handle messgae');
    if (message.data != null) {
      print(message.notification!.title);
      print(message.notification!.body);
      //
      print('${message.data['type']}');
      print('${message.data['content']}');
      final routeFromMessage = message.data["route"];
      Navigator.of(context).pushNamed(routeFromMessage);
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // FirebaseMessaging.onMessage.listen((messgae){
    //   setUpFlutterNotification();
    //   showFlutterNotification(messgae);
    // });
    // FirebaseMessaging.onMessageOpenedApp.listen((message){
    //   showFlutterNotification(message);
    // });
    // FirebaseMessaging.instance.getInitialMessage().then((value){
    //   if( value != null){
    //     showFlutterNotification(value);
    //   }
    // });

    setupInteractedMessage();
  }
  @override
  Widget build(BuildContext context) {
      return Sizer(
          builder: (context, orientation, deviceType) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              home: FirebaseAuth.instance.currentUser != null?ScreenAdminDashbord():ScreenAdminLoginScreen(),
              routes: {
                "red":(_) => ScreenAdminSettings(),
                "blue":(_) => ScreenAdminBlockedUsers()
              },
              theme: ThemeData(
                appBarTheme: AppBarTheme(backgroundColor: Colors.white,
                  elevation: 0.65
                )
              ),
            );
          }
      );
  }
}



