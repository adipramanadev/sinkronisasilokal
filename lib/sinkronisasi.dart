import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sinkronisasilokal/dbHelper/db_helper.dart';

Future<void> syncToFirebase() async {
  final dbHelper = DBHelper.instance;
  final users = await dbHelper.getUsers();

  for (var user in users) {
    await FirebaseFirestore.instance.collection('users').add({
      'name': user.name,
      'email': user.email,
    });
  }
}
