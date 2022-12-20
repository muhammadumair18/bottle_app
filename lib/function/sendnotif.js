// Node.js e.g via a Firebase Cloud Function
var admin = require("firebase-admin");

var serviceAccount = require("G:/Android Projects/flutter folders/bottle_app/serviceAccountKey.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});
var registrationtoken='c5WUHKWeSwinb-4syn00ov:APA91bEXpfa2fAboFY4QLhRPY8nq2gLCNNaOlL-cg1XTfim9nkUqGpD8W0q_mve7BK9Ukggb3Ik98Wh7aIPQOoJL0U_WWMibV35XLv2qX_Njvzt6nYKMj_Zy3zUvbPt2NOUNavdTRmUo';

var message = {
  "notification":{
      "title": "Argentina vs. France",
      "body": "great match!"
      },
  "data": {
    "type": "warning",
    "content": "A new weather warning has been created!",
    "route": 'red'
  },
  token:registrationtoken
};

admin
  .messaging()
  .send(message)
  .then((response) => {
    console.log("Successfully sent message:", response);
  })
  .catch((error) => {
    console.log("Error sending message:", error);
  });