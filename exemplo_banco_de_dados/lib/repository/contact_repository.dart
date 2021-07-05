import 'package:exemplo_banco_de_dados/model/model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ContactRepository {

  final String contactTable = "contact_table";
  final String idColumn = "id_column";
  final String nameColumn = "name_column";
  final String emailColumn = "email_column";
  final String phoneColumn = "phone_column";

  //criar o banco.
  //conexão com o banco.
  Future<Database> initializeDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "contacts.db"); //nome do banco de dados.

    return openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
          await db.execute(
              "CREATE TABLE $contactTable($idColumn INTEGER PRIMARY KEY, $nameColumn TEXT, $emailColumn TEXT, $phoneColumn TEXT)"
          );
        });
  }

  //métodos - CRUD
  // save - OK
  // fetchAll - OK
  // update - OK
  // delete - OK

  Future<int> save(Contact contact) async { //aqui nao vem id.
    final Database database = await initializeDB();
    return await database.insert(this.contactTable, contact.toMap()); //se salvou no banco ou nao.
  }

  // Future<int> save(List<Contact> contacts) async { //aqui nao vem id.
  //   final Database database = await initializeDB();
  //   int result = 0;
  //   for(var contact in contacts) {
  //     result = await database.insert(
  //         this.contactTable, contact.toMap()); //se salvou no banco ou nao.
  //   }
  //   return result;
  // }

  // Future<List<Contact>?> fetchAll() async { //zé. dev. jr.
  //
  //   final Database database = await initializeDB();
  //
  //   List listMap = await database.query(
  //     this.contactTable,
  //     columns: [idColumn, nameColumn, emailColumn, phoneColumn]
  //   );
  //
  //   List<Contact> listContact = [];
  //   for(Map<String, dynamic> map in listMap) {
  //     listContact.add(Contact.fromMap(map));
  //   }
  //
  //   if(listContact.isNotEmpty)
  //     return listContact;
  //   else
  //     return null;
  //
  // }

  Future<List<Contact>> fetchAll() async {
      final Database database = await initializeDB();
      final List<Map<String, Object?>> query = await database.query(
        this.contactTable,
        columns: [idColumn, nameColumn, emailColumn, phoneColumn]
      );
      return query.map((element) => Contact.fromMap(element)).toList();
  }

                  //obrigatoriamente tem que ter o id aqui....
  Future<int> update(Contact contact) async {
    final Database database = await initializeDB();
    return await database.update(
      this.contactTable,
      contact.toMap(),
      where: '${this.idColumn} = ?', //previne contra SQLINJECTION (tecnica de invasao.)
      whereArgs: [contact.id]
    );
  }
  //SQL
  //update from product set description = 'sabao em pó' where id = 1
              //obrigatoriamente tem que ter o id aqui....
  Future<int> delete(Contact contact) async {
    final Database database = await initializeDB();
    return await database.delete(
        this.contactTable,
        where: '${this.idColumn} = ?', //previne contra SQLINJECTION (tecnica de invasao.)
        whereArgs: [contact.id]
    );
  }

  // ver qtd no banco
  // findById

}