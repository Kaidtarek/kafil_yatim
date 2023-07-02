
class Family {
  String name;
  int age;
  String address;
  Family({required this.name,required this.age,required this.address});
  factory Family.fromJson(Map<String ,dynamic>json){
    return Family(name: json['name'], age: json['age'], address: json['address']);
  }
  Map<String, dynamic> toJson() =>{
    'name':name,
    'age':age,
    'address':address,
  };
}