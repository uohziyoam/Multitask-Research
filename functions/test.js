const firebaseConfig = {
    apiKey: "AIzaSyCZ9FC_0oe17BZpmbOCy49sbi_Dnck3pek",
    authDomain: "common-research.firebaseapp.com",
    databaseURL: "https://common-research.firebaseio.com",
    projectId: "common-research",
    storageBucket: "common-research.appspot.com",
    messagingSenderId: "190944351123",
    appId: "1:190944351123:web:b8cbbfb67d4c56f454ce66",
    measurementId: "G-B13FRLJ2KZ"
};

var admin = require("firebase-admin");

var serviceAccount = require("path/to/serviceAccountKey.json");

admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
    storageBucket: "common-research.appspot.com"
});

var bucket = admin.storage().bucket();
