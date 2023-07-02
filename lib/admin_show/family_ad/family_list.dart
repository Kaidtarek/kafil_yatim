import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'family.dart';

class FamilyList extends StatefulWidget {
  @override
  _FamilyListState createState() => _FamilyListState();
}

class _FamilyListState extends State<FamilyList> {
  List<Family> families = [];

  @override
  void initState() {
    super.initState();
    loadFamilyData();
  }

  Future<void> loadFamilyData() async {
    String jsonString = await rootBundle.loadString('assets/families.json');
    List<dynamic> jsonList = json.decode(jsonString);
    setState(() {
      families = jsonList.map((json) => Family.fromJson(json)).toList();
    });
  }

  Future<void> saveFamilyData() async {
    List<dynamic> jsonList = families.map((family) => family.toJson()).toList();
    String jsonString = json.encode(jsonList);
    // Write the data to a local file on the device's storage instead of using rootBundle.writeAsString
    // ...
  }

  void addFamily(Family family) {
    setState(() {
      families.add(family);
    });
    saveFamilyData();
  }

  void editFamily(Family family, int index) {
    setState(() {
      families[index] = family;
    });
    saveFamilyData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Family List'),
      ),backgroundColor: Colors.teal,
      body: ListView.builder(
        itemCount: families.length,
        itemBuilder: (context, index) {
          return ListTile(
  title: Text(families[index].name),
  subtitle: Text('Age: ${families[index].age}'),
  trailing: Icon(Icons.edit), // Add this line to display the edit icon

  onTap: () {
    // Navigate to family edit screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FamilyEditScreen(
          family: families[index],
          index: index,
          editFamily: editFamily,
        ),
      ),
    );
  },
);

        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to family add screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FamilyAddScreen(addFamily: addFamily),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class FamilyAddScreen extends StatelessWidget {
  final Function(Family) addFamily;

  // Declare the variables 'name', 'age', and 'address'
  String name = '';
  int age = 0;
  String address = '';

  FamilyAddScreen({required this.addFamily});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Family'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
              ),
              onChanged: (value) {
                name = value;
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Age',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                age = int.tryParse(value) ?? 0;
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Address',
              ),
              onChanged: (value) {
                address = value;
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Family family = Family(name: name, age: age, address: address);
                addFamily(family);
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class FamilyEditScreen extends StatefulWidget {
  final Family family;
  final int index;
  final Function(Family, int) editFamily;

  FamilyEditScreen({required this.family, required this.index, required this.editFamily});

  @override
  _FamilyEditScreenState createState() => _FamilyEditScreenState();
}

class _FamilyEditScreenState extends State<FamilyEditScreen> {
  // Declare the variables 'name', 'age', and 'address'
  String name = '';
  int age = 0;
  String address = '';

  @override
  void initState() {
    super.initState();
    name = widget.family.name;
    age = widget.family.age;
    address = widget.family.address;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Family'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
              ),
              onChanged: (value) {
                name = value;
              },
              controller: TextEditingController(text: name),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Age',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                age = int.tryParse(value) ?? 0;
              },
              controller: TextEditingController(text: age.toString()),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Address',
              ),
              onChanged: (value) {
                address = value;
              },
              controller: TextEditingController(text: address),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Family family = Family(name: name, age: age, address: address);
                widget.editFamily(family, widget.index);
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
