class Person{
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