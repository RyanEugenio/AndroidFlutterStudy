import 'package:study2/model/model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ContactRepository {

  final String contactTable = "contact_table";
  final String idColumn = "id_column";
  final String nameColumn = "name_column";
  final String emailColumn = "email_column";
  final String phoneColumn = "phone_column";

  Future<Database> initializeDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "contacts.db");

    return openDatabase(path, version: 1,
      onCreate: (Database db, int newerVersion) async {
        await db.execute(
          "CREATE TABLE $contactTable($idColumn INTEGER PRIMARY KEY, $nameColumn TEXT, $emailColumn TEXT, $phoneColumn TEXT)"
        );
      }
    );
  }

  Future<int> save(Contact contact) async {
    final Database database = await initializeDB();
    return await database.insert(this.contactTable, contact.toMap());
  }

  Future<List<Contact>> fetchAll() async {
    final Database database = await initializeDB();
    final List<Map<String, Object?>> query = await database.query(
      this.contactTable,
      columns: [idColumn, nameColumn, emailColumn, phoneColumn]
    );
    return query.map((element) => Contact.fromMap(element)).toList();
  }

  Future<int> update(Contact contact) async {
    final Database database = await initializeDB();
    return await database.update(
        this.contactTable,
        contact.toMap(),
        where: '${this.idColumn} = ?', //previne contra SQLINJECTION (tecnica de invasao.)
        whereArgs: [contact.id]
    );
  }

  Future<int> delete(Contact contact) async {
    final Database database = await initializeDB();
    return await database.delete(
        this.contactTable,
        where: '${this.idColumn} =  ?',
        whereArgs: [contact.id]
    );
  }
}