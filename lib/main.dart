
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqlite/model/user.dart';
import 'package:sqlite/utils/databasehelper.dart';

List myUser;
void main() async{
  var db=new DatabaseHelper();

//int userCreated=  await db.createUser(
//   new User("sayed", 22, "mansoura", "1234hg"));
//print("created user:$userCreated");
  myUser=await db.getAllUser();
  int sumUser=await db.Count();
  print("total:$sumUser");



//  User mahmoud=await db.getUser(3);
//  print("${mahmoud.id}");
  print("----------------------------");

  print("----------------------------");


//  deleteall user database
List deleteUser=await db.getAllUser();
  print("Alldelete${deleteUser.remove(deleteUser.length)}");
User sayed2=User.fromMap({
  "username": 'abass',
  "city" :'cairo',

}
);
  await db.updateUser(sayed2);



  for(int i=0;i< myUser.length;i++){
    User user=User.map(myUser[i]);
    print("ID:${user.id}-username:${user.username} -city:${user.city}" );

  }









  runApp(MaterialApp(
  title: "Sql App",
  home: new Home(),

));}


class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
       appBar: new AppBar(
         title: new Text("welcome to sql "),
         backgroundColor: Colors.pink.shade900,
       ),
      body: new ListView.builder(
        itemCount: myUser.length,
        itemBuilder: (_,int position){
          return new Card(
            child: new ListTile(
              leading: new Icon(Icons.person,color: Colors.amber.shade900,size: 22.0,),
              title: new Text('${User.fromMap(myUser[position]).username}'),
              subtitle: new Text('${User.fromMap(myUser[position]).city}'),
              onTap: ()=>debugPrint('${User.fromMap(myUser[position]).age}'),
            ),
            color: Colors.deepPurple,
            elevation: 2.0,
          );
        },
      ),
      
    );
  }

}
