import 'dart:convert';

import 'package:http/http.dart' as http;




  int _messageCount=0;
  String _token='c5WUHKWeSwinb-4syn00ov:APA91bEXpfa2fAboFY4QLhRPY8nq2gLCNNaOlL-cg1XTfim9nkUqGpD8W0q_mve7BK9Ukggb3Ik98Wh7aIPQOoJL0U_WWMibV35XLv2qX_Njvzt6nYKMj_Zy3zUvbPt2NOUNavdTRmUo';
  String serverkeeey='AAAAUfx6dOY:APA91bFxxHCGO0VgcPk4G3WNz1K0QZkMhlufgOQTEzElGDp58CK8lcbDh9v7VodMc2XSbsYT0u10BIQfRx-jSmfhbX-wbe7P0gEZWpcUDaGx4Cq1bFQfymWFu6wY3ixmwZx_qSNYk_2K';

  String constructFCMPayload(String? token) {
    _messageCount++;
    return jsonEncode({
      'token': token,
      'data': {
        'via': 'FlutterFire Cloud Messaging!!!',
        'count': _messageCount.toString(),
      },
      'notification': {
        'title': 'Hello FlutterFire!',
        'body': 'This notification (#$_messageCount) was created via FCM!',
      },
    });
  }


  Future<String> sendPushMessage() async {
    if (_token == null) {
      print('Unable to send FCM message, no token exists.');
      return 'Unable to send FCM message, no token exists.';
    }

    try {
      http.Response resssp=await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':'key=AAAAUfx6dOY:APA91bFxxHCGO0VgcPk4G3WNz1K0QZkMhlufgOQTEzElGDp58CK8lcbDh9v7VodMc2XSbsYT0u10BIQfRx-jSmfhbX-wbe7P0gEZWpcUDaGx4Cq1bFQfymWFu6wY3ixmwZx_qSNYk_2K'
        },
        body: constructFCMPayload(_token),
        encoding: Encoding.getByName('utf-8')
      );
      print('FCM request for device sent!');
      return "${resssp.body}  ${resssp.statusCode}";
    } catch (e) {
      print(e);
      return 'In Catch Block----------------------------------';
    }

  }




// https://api.rnfirebase.io/messaging/send
// https://fcm.googleapis.com/fcm/send