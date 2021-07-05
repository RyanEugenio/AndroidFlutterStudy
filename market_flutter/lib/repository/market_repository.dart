import 'package:market_flutter/model/model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MarketRepository {
  
  final String marketTable = "market_table";
  final String idColumn = "id_column";
  final String nameProductColumn = "nameProduct_column";
  final String valueProductColumn = "valueProduct_column";
  final String quantityProductColumn = "quantityProduct_column";
  final String categoryProductColumn = "categoryProduct_column";

  Future<Database> initializeDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "markets.db");

    return openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
          await db.execute(
              "CREATE TABLE $marketTable($idColumn INTEGER PRIMARY KEY, $nameProductColumn TEXT, $valueProductColumn TEXT, $quantityProductColumn TEXT, $categoryProductColumn TEXT)"
          );
        }
    );
  }

  Future<int> save(Market market) async {
    final Database database = await initializeDB();
    return await database.insert(this.marketTable, market.toMap());
  }

  Future<List<Market>> fetchAll() async {
    final Database database = await initializeDB();
    final List<Map<String, Object?>> query = await database.query(
        this.marketTable,
        columns: [idColumn, nameProductColumn, valueProductColumn, quantityProductColumn, categoryProductColumn]
    );
    return query.map((element) => Market.fromMap(element)).toList();
  }

  Future<List<Market>> whereFruit() async {
    final Database database = await initializeDB();
    final List<Map<String, Object?>> query = await database.query(
        this.marketTable,
        columns: [idColumn, nameProductColumn, valueProductColumn, quantityProductColumn, categoryProductColumn],
        where: 'categoryProduct_column = "Frutas"',
    );
    return query.map((element) => Market.fromMap(element)).toList();
  }

  Future<List<Market>> whereHygiene() async {
    final Database database = await initializeDB();
    final List<Map<String, Object?>> query = await database.query(
      this.marketTable,
      columns: [idColumn, nameProductColumn, valueProductColumn, quantityProductColumn, categoryProductColumn],
      where: 'categoryProduct_column = "Higiene"',
    );
    return query.map((element) => Market.fromMap(element)).toList();
  }

  Future<List<Market>> whereDrink() async {
    final Database database = await initializeDB();
    final List<Map<String, Object?>> query = await database.query(
      this.marketTable,
      columns: [idColumn, nameProductColumn, valueProductColumn, quantityProductColumn, categoryProductColumn],
      where: 'categoryProduct_column = "Bebidas"',
    );
    return query.map((element) => Market.fromMap(element)).toList();
  }

  Future<List<Market>> whereDairyAndEggs() async {
    final Database database = await initializeDB();
    final List<Map<String, Object?>> query = await database.query(
      this.marketTable,
      columns: [idColumn, nameProductColumn, valueProductColumn, quantityProductColumn, categoryProductColumn],
      where: 'categoryProduct_column = "Latícinios e Ovos"',
    );
    return query.map((element) => Market.fromMap(element)).toList();
  }

  Future<List<Market>> whereGrocery() async {
    final Database database = await initializeDB();
    final List<Map<String, Object?>> query = await database.query(
      this.marketTable,
      columns: [idColumn, nameProductColumn, valueProductColumn, quantityProductColumn, categoryProductColumn],
      where: 'categoryProduct_column = "Mercearia"',
    );
    return query.map((element) => Market.fromMap(element)).toList();
  }

  Future<List<Market>> whereVegetablesAndLegumes() async {
    final Database database = await initializeDB();
    final List<Map<String, Object?>> query = await database.query(
      this.marketTable,
      columns: [idColumn, nameProductColumn, valueProductColumn, quantityProductColumn, categoryProductColumn],
      where: 'categoryProduct_column = "Verduras e Legumes"',
    );
    return query.map((element) => Market.fromMap(element)).toList();
  }

  Future<List<Market>> whereButcherAndFishmonger() async {
    final Database database = await initializeDB();
    final List<Map<String, Object?>> query = await database.query(
      this.marketTable,
      columns: [idColumn, nameProductColumn, valueProductColumn, quantityProductColumn, categoryProductColumn],
      where: 'categoryProduct_column = "Açougue e Peixaria"',
    );
    return query.map((element) => Market.fromMap(element)).toList();
  }

  Future<int> update(Market market) async {
    final Database database = await initializeDB();
    return await database.update(
        this.marketTable,
        market.toMap(),
        where: '${this.idColumn} = ?',
        whereArgs: [market.id]
    );
  }

  Future<int> delete(Market market) async {
    final Database database = await initializeDB();
    return await database.delete(
        this.marketTable,
        where: '${this.idColumn} =  ?',
        whereArgs: [market.id]
    );
  }
}