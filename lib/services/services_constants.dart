import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

final firebaseAuth = FirebaseAuth.instance;
final user = firebaseAuth.currentUser;
final firebaseDatabase = FirebaseDatabase.instance.ref('users');

final databaseRef = FirebaseDatabase.instance.ref(user.toString());

final uid = user!.uid;
