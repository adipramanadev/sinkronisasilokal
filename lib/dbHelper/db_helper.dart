import 'package:sinkronisasilokal/Model/UserModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._internal();
  static Database? _database;

  DBHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'user_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE users (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, email TEXT)',
        );
      },
      version: 1,
    );
  }

  // Tambahkan user
  Future<int> insertUser(User user) async {
    final db = await database;
    return db.insert('users', user.toMap());
  }

  // Ambil semua user
  Future<List<User>> getUsers() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('users');
    return List.generate(
      maps.length,
      (i) => User(
        id: maps[i]['id'],
        name: maps[i]['name'],
        email: maps[i]['email'],
      ),
    );
  }

  // Hapus user
  Future<int> deleteUser(int id) async {
    final db = await database;
    return db.delete('users', where: 'id = ?', whereArgs: [id]);
  }
}
