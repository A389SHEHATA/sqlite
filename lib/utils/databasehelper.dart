
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:sqlite/model/user.dart';
class DatabaseHelper{
  static Database _db;
  final String userTable='usertable';
  final String coulmId='id';
  final String coulmUserName='username';
  final String coulmPassword='password';
  final String coulmCity='city';
  final String coulmAge='age';




  Future <Database> get db async {
    if(_db !=null){
      return _db;

    }
    _db=await intDB();
    return _db;
  }
  intDB()async{
    Directory documenDirectory= await getApplicationDocumentsDirectory();
    String path= join(documenDirectory.path,'mydb.db');
//    mydb.db   filename
  var myDb = await openDatabase(path,
    version: 1,
     onCreate:_onCreate);
  return myDb;

  }
void _onCreate(Database db,int version)async{
    var sql='CREATE TABLE $userTable ( $coulmId INTEGER PRIMARY KEY, $coulmUserName TEXT,$coulmPassword TEXT,$coulmCity TEXT,$coulmAge INTEGER )';

   await db.execute(sql);
  }
//  to do create db

  Future<int>createUser(User user)async{

    var dbClient=await db;
    int result=await dbClient.insert("$userTable", user.toMap());
    return result;
  }
//  to get data
  Future<List>getAllUser() async{

    var dbClient=await db;
    var sql="Select * From $userTable";
    List result=await dbClient.rawQuery(sql);
    return result.toList();
  }
//  to know count of user
  Future<int>Count() async{

    var dbClient=await db;
    var sql="Select COUNT(*) From $userTable";
    return  Sqflite.firstIntValue(await dbClient.rawQuery(sql));

  }

//  to get user from data base
  Future<User>getUser(int id) async{

    var dbClient=await db;
    var sql="Select * From $userTable where $coulmId=$id";
    var result=await dbClient.rawQuery(sql);

    if(result.length==0)   return null;
    return new User.fromMap(result.first);
  }
//  delete
  Future<int>deleteUser(int id) async{

    var dbClient=await db;
    return await dbClient.delete(userTable,where: "$coulmId=?",whereArgs: [id] );

  }
//  update user
  Future<int>updateUser(User user) async{

    var dbClient=await db;
    return await dbClient.update(userTable,user.toMap() ,where: "$coulmId=?",whereArgs: [user.id] );

  }
//  close database
//  Future<int>close() async{
//
//    var dbClient=await db;
//    return await dbClient.close();
//
//  }

}