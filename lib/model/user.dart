class User{
  String username;
  String password;
  String city;
  int id;
  int age;

  User(this.username,this.age,this.city,this.password);
  User.map(dynamic obj){
    this.username=obj['username'];
    this.password=obj['password'];
    this.city    =obj['city'];
    this.age     =obj['age'];
    this.id     =obj['id'];

  }
  String get _username=> username;
  String get _password=> password;
  String get _city=> city;
  int    get _age=> age;
  int    get  _id=> id;
  //to put in DB
  Map<String,dynamic>toMap(){
  var map=new Map<String,dynamic>();
  map['username']= _username;
  map['password']= _password;
  map['city']= _city;
  map['age']= _age;
  if(_id !=null){
    map['id']= _id;
  }
  return map;
}

//to get data
User.fromMap(Map<String,dynamic>map){
  this.username=map['username'];
  this.password=map['password'];
  this.city=map['city'];
  this.age=map['age'];
  this.id=map['id'];
}


}