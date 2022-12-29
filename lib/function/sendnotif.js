// Node.js e.g via a Firebase Cloud Function
var admin = require("firebase-admin");

var serviceAccount = require("G:/Android Projects/flutter folders/bottle_app/serviceAccountKey.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});
var registrationtoken='fyFtTPidQ9um6BJpiiVWfK:APA91bFu2spxSF8JSSEzGF4tIyVx2NltRikQIqErKGGF19BXzPxj4hz-JlenXW4XK9sktmaHbsrLeQMErJUggR1_CZMF0gXtVftBIDcm6xgoZ3AtGy5KFtkjs-nYki7gRbPmOX9nhb0V';

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