import 'package:flutter/material.dart';
import 'package:sinkronisasilokal/Model/UserModel.dart';
import 'package:sinkronisasilokal/DBHelper/db_helper.dart';
import 'package:sinkronisasilokal/sinkronisasi.dart';


class UserScreen extends StatefulWidget {
  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  List<User> _users = [];

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    final users = await DBHelper.instance.getUsers();
    setState(() {
      _users = users;
    });
  }

  Future<void> _addUser() async {
    final name = nameController.text.trim();
    final email = emailController.text.trim();

    if (name.isNotEmpty && email.isNotEmpty) {
      await DBHelper.instance.insertUser(User(name: name, email: email));
      nameController.clear();
      emailController.clear();
      _fetchUsers(); // Refresh UI
    }
  }

  Future<void> _deleteUser(int id) async {
    await DBHelper.instance.deleteUser(id);
    _fetchUsers(); // Refresh UI
  }

  Future<void> _syncToFirebase() async {
    await syncToFirebase();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Data synchronized to Firebase!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite & Firebase'),
        actions: [
          IconButton(
            icon: Icon(Icons.cloud_upload),
            onPressed: _syncToFirebase,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                ElevatedButton(
                  onPressed: _addUser,
                  child: Text('Add User'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _users.length,
              itemBuilder: (context, index) {
                final user = _users[index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deleteUser(user.id!),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
