// import 'package:kmodel1/kmodel.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class DBHelper {
//   static Database? _db;

//   Future<Database> get database async {
//     if (_db != null) return _db!;
//     _db = await initDB();
//     return _db!;
//   }

//   Future<Database> initDB() async {
//     String path = join(await getDatabasesPath(), 'notes.db');
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: (db, version) async {
//         await db.execute('''
//           CREATE TABLE notes(
//             id INTEGER PRIMARY KEY AUTOINCREMENT,
//             title TEXT,
//             content TEXT
//           )
//         ''');
//       },
//     );
//   }

//   Future<void> insertNote(Note note) async {
//     final db = await database;
//     await db.insert('notes', note.toMap(),
//         conflictAlgorithm: ConflictAlgorithm.replace);
//   }

//   Future<List<Note>> getAllNotes() async {
//     final db = await database;
//     final List<Map<String, dynamic>> maps = await db.query('notes');

//     return List.generate(maps.length, (i) {
//       return Note(
//         id: maps[i]['id'],
//         title: maps[i]['title'],
//         content: maps[i]['content'],
//       );
//     });
//   }
// }

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'kmodel.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    try {
      if (_database != null) {
        print('✅ Using existing database');
        return _database!;
      }
      print('🆕 Initializing new database...');
      _database = await _initDB('notes_app.db');
      return _database!;
    } catch (e) {
      print('❌ DATABASE ERROR: $e');
      rethrow;
    }
  }

  Future<Database> _initDB(String filePath) async {
    try {
      final dbPath = await getDatabasesPath();
      final path = join(dbPath, filePath);

      print('📂 Database path: $path');

      final db = await openDatabase(
        path,
        version: 1,
        onCreate: _createDB,
      );

      print('✅ Database opened successfully');
      return db;
    } catch (e) {
      print('❌ INIT DB ERROR: $e');
      rethrow;
    }
  }

  Future _createDB(Database db, int version) async {
    try {
      print('🔨 Creating notes table...');
      await db.execute('''
        CREATE TABLE notes (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT NOT NULL,
          content TEXT NOT NULL
        )
      ''');
      print('✅ Notes table created');
    } catch (e) {
      print('❌ CREATE TABLE ERROR: $e');
      rethrow;
    }
  }

  Future<int> insertNote(Note note) async {
    try {
      print('\n📝 INSERTING NOTE:');
      print('   Title: ${note.title}');
      print('   Content: ${note.content}');

      final db = await database;
      final id = await db.insert('notes', note.toMap());

      print('✅ NOTE INSERTED - ID: $id\n');
      return id;
    } catch (e) {
      print('❌ INSERT ERROR: $e');
      rethrow;
    }
  }

  Future<List<Note>> getAllNotes() async {
    try {
      print('\n📖 FETCHING ALL NOTES...');

      final db = await database;
      final result = await db.query('notes', orderBy: 'id DESC');

      print('✅ FOUND ${result.length} NOTES');

      if (result.isNotEmpty) {
        for (var note in result) {
          print('   - ID: ${note['id']}, Title: ${note['title']}');
        }
      }
      print('');

      return result.map((json) => Note.fromMap(json)).toList();
    } catch (e) {
      print('❌ FETCH ERROR: $e');
      return [];
    }
  }

  Future<int> updateNote(Note note) async {
    try {
      print('\n✏️ UPDATING NOTE:');
      print('   ID: ${note.id}');
      print('   Title: ${note.title}');

      final db = await database;
      final count = await db.update(
        'notes',
        note.toMap(),
        where: 'id = ?',
        whereArgs: [note.id],
      );

      print('✅ NOTE UPDATED - Rows: $count\n');
      return count;
    } catch (e) {
      print('❌ UPDATE ERROR: $e');
      rethrow;
    }
  }

  Future<int> deleteNote(int id) async {
    try {
      print('\n🗑️ DELETING NOTE: ID $id');

      final db = await database;
      final count = await db.delete(
        'notes',
        where: 'id = ?',
        whereArgs: [id],
      );

      print('✅ NOTE DELETED - Rows: $count\n');
      return count;
    } catch (e) {
      print('❌ DELETE ERROR: $e');
      rethrow;
    }
  }
}
