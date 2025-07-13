
class Person {
  late String _name;

// void setName(String name){
//   if(name.length < 3)
//   this.name = name;
// }
  set name(String name){
   _name = name;
 }
  String get name{
    return name + "/";
  }
// String getName() => name + "/";

}