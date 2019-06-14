//class Person {
//  String name;
//  int age;
//
//  static Person fromMap(Map<String, dynamic> map) {
//    Person temp = new Person();
//    temp.name = map['name'];
//    temp.age = map['age'];
//    return temp;
//  }
//
//  static List<Person> fromMapList(dynamic mapList) {
//    List<Person> list = new List(mapList.length);
//    for (int i = 0; i < mapList.length; i++) {
//      list[i] = fromMap(mapList[i]);
//    }
//    return list;
//  }
//
//}



class Person {
  String name;
  int age;
  bool sex;

  Person({this.name, this.age,this.sex});

  Person.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    sex = json['sex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['age'] = this.age;
    data['sex'] = this.sex;
    return data;
  }
}