import * as firebase from 'firebase/app';
import 'firebase/auth';
import 'firebase/firestore';



var firebaseConfig = {
    apiKey: "AIzaSyAVwshBpLM_1FDTCIkJnM_6MN5pMOUa6jQ",
    authDomain: "brewery-compass.firebaseapp.com",
    projectId: "brewery-compass",
    storageBucket: "brewery-compass.appspot.com",
    messagingSenderId: "551073903936",
    appId: "1:551073903936:web:1a249afdc91af5b1dc76a5",
    measurementId: "G-87JQCM1ME5"
};
// Initialize Firebase
firebase.initializeApp(firebaseConfig),
    firebase.analytics();



// utils
const db = firebase.firestore()
const auth = firebase.auth()

// collection references
const usersCollection = db.collection('users')
const postsCollection = db.collection('posts')
const commentsCollection = db.collection('comments')
const likesCollection = db.collection('likes')

// export utils/refs
export {
    db,
    auth,
    usersCollection,
    postsCollection,
    commentsCollection,
    likesCollection
}