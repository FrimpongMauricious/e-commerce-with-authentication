import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';


class NoteService{
  
  Database? _db;
// Future<DataBaseUser> getUser({required String email, required int userId}) async {
//   final db = await _getDatabaseOrThrow(); // Ensure this is asynchronous
//   final results = await db.query(
//     userTable,
//     limit: 1,
//     where: 'email = ?',
//     whereArgs: [email.toLowerCase()],
//   );

//   if (results.isEmpty) {
//     throw CouldNotFindUser();
//   } else {
//     // Return a DataBaseUser object created from the query result
//     final row = results.first;
//     return DataBaseUser.fromRow(row); // Assuming this parses a row into an object
//   }
// }
//  Future<DataBaseNote> createNote({ required DataBaseUser owner }) async {
// final db = _getDatabaseOrThrow();
// final dbUser = await getUser(email : owner.email);
//  }
  Future<DataBaseUser> createUser({required String email}) async{
    final db=_getDatabaseOrThrow();
    final results= await db.query(
      userTable, 
      limit: 1,
       where: 'email = ?',
       whereArgs: [email.toLowerCase()]);
       if (results.isNotEmpty){
        throw UserAlreadyExist();
       }
       final userId= await db.insert(userTable,{
        emailColumn:email.toLowerCase()
       });

       return DataBaseUser(email: email, id: userId);

  }
  Future<void> deleteUser({ required String email}) async{
    final db=_getDatabaseOrThrow();
    final deleteDccount=await db.delete(
        userTable,
        where: 'email = ?',
    
       whereArgs: [email.toLowerCase()]);
       
  if(deleteDccount != 1){
    throw CouldNotDeleteUser();
  }

  }
  Database _getDatabaseOrThrow(){

    final db=_db;
    if(db== null){
      throw DatabaseNotOpenedException();
    }
    else{
      return db;
    }
  }
  Future<void> open() async{
    if(_db != null){
      throw DatabaseAlreadyOpenedException();
    }
    try{
      
    final doxPath=await getApplicationCacheDirectory();
    final dbPath=join(doxPath.path,dbName);
    final db =await openDatabase(dbPath);
    _db=db;
    const createUserTable=''' CREATE TABLE IF NOT EXISTS "user" (
	"id"	INTEGER NOT NULL,
	"email"	TEXT NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
)

    ''';
    await db.execute(createUserTable);
    const createNoteTable=''' 
    CREATE TABLE  IF NOT EXISTS "note" (
	"id"	INTEGER NOT NULL,
	"user_id"	INTEGER NOT NULL,
	"text"	TEXT NOT NULL,
	"is_asynced_with_cloud"	INTEGER NOT NULL DEFAULT 0,
	PRIMARY KEY("id" AUTOINCREMENT)
)
    ''';
    await db.execute(createNoteTable);
    }on MissingPlatformDirectoryException{
      throw UnableToFindDirectoryException();

    }

  }
}
class DataBaseUser {
  final int id;
  final String email;
  const  DataBaseUser({required this.email,required this.id});
  DataBaseUser.fromRow(Map<String,Object>map):
  id=map[idColumn] as int,
  email=map[emailColumn] as String;
  @override
  String toString()=>'person,id: $id email: $email';
    
@override
  bool operator == ( covariant DataBaseUser other) => id==other.id;
  @override
  int get hashCode=> id.hashCode;
  
}
class DataBaseNote {
  final int id;
  final int userId;
  final String text;
  final bool isAsyncedWithCloud;
  const DataBaseNote({required this.id,required this.userId,required this.text, required this.isAsyncedWithCloud});
  DataBaseNote.fromRow(Map<String,Object>map):
  id=map[idColumn] as int,
  userId=map[useridColumn] as int,
  text=map[textColumn] as String,
  isAsyncedWithCloud=(map[isAsyncedWithCloudColumn] as int)==1?true : false;
@override
String toString()=> 'Note, id=$id userId=$userId';

@override
  bool operator == ( covariant DataBaseNote other) => id==other.id;
  @override
  int get hashCode=> id.hashCode;
}
const dbName='notes.db';
const noteTable='note';
final idColumn='id';
final emailColumn='email';
const userTable='user';

final useridColumn='id';
final isAsyncedWithCloudColumn='email';

final textColumn='id';
// Define the custom exception
class DatabaseAlreadyOpenedException implements Exception {
  final String message;
  DatabaseAlreadyOpenedException([this.message = "Database already opened."]);

  @override
  String toString() => "DatabaseAlreadyOpenedException: $message";
}
class UnableToFindDirectoryException implements Exception {
  final String message;
  UnableToFindDirectoryException([this.message = "Database already opened."]);

  @override
  String toString() => "DatabaseAlreadyOpenedException: $message";
}
class DatabaseNotOpenedException implements Exception{}
class CouldNotDeleteUser implements Exception{}
class UserAlreadyExist implements Exception{}
class CouldNotFindUser implements Exception{}
