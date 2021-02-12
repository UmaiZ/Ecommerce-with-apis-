import 'dart:io';

import 'package:scoped_model/scoped_model.dart';
import 'package:sqflite/sqflite.dart';

import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:localstorage/localstorage.dart';

class Cart {
  int uId;
  int id;
  int quantity;
  String title;
  String image;
  String price;
  String color;
  String sizeselect;

  Cart({
    this.id,
    this.uId,
    this.title,
    this.image,
    this.price,
    this.color,
    this.sizeselect,
    this.quantity,
  });

  factory Cart.fromJson(Map<String, dynamic> data) => new Cart(
        id: data["id"],
        uId: data["uId"],
        quantity: data["quantity"],
        title: data["title"],
        image: data["image"],
        price: data["price"],
        color: data["color"],
        sizeselect: data["sizeselect"],
      );

  Map<String, dynamic> toJson() => {
        "uId": uId,
        "id": id,
        "title": title,
        "image": image,
        "price": price,
        "color": color,
        "sizeselect": sizeselect,
        "quantity": quantity,
      };
}

class DatabaseHelper {
  static final _databaseName = "CartDatabase.db";
  static final _databaseVersion = 1;

  static final table = 'cart_table_new';

  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE $table ("
        "uId INTEGER PRIMARY KEY,"
        "id INTEGER,"
        "quantity INTEGER,"
        "title TEXT,"
        "image TEXT,"
        "color TEXT,"
        "price TEXT,"
        "sizeselect TEXT"
        ")");
  }

  Future<int> insert(cart) async {
    //print(cart.id);
    Database db = await instance.database;
    return await db.insert(table, cart.toJson());
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  Future<int> delete(int id, columnId) async {
    //print(columnId);
    //print(id);
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = uId');
  }
  Future<int> updateCustomer(int id, columnId, quantity) async {
    print(columnId);
    print(id);
    print(quantity);

    Database db = await instance.database;

    return await db.rawUpdate(
        'UPDATE $table SET quantity = $quantity WHERE $columnId = uId'
    );
  }
  deleteAll() async {
    Database db = await instance.database;
    return await db.rawDelete("delete from $table");
  }
}
