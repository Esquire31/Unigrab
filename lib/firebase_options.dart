import 'package:firebase_core/firebase_core.dart';

const FirebaseOptions firebaseOptions = FirebaseOptions(
  apiKey: 'AIzaSyBwm7XA1cvLatp1U4ihZCtAa3mjsc873uI',
  appId: '1:319454715447:android:d38e53764ff302473469b2',
  messagingSenderId: '319454715447',
  projectId: 'ub-850a5',
  authDomain: 'YOUR_AUTH_DOMAIN',
  storageBucket: 'ub-850a5.firebasestorage.app',
  measurementId: 'YOUR_MEASUREMENT_ID',
);

Future<void> initializeFirebase() async {
  await Firebase.initializeApp(
    options: firebaseOptions,
  );
}