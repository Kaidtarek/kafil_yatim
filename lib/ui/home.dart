import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Family {
  String name;
  int age;
  String address;

  Family({required this.name, required this.age, required this.address});
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Family> families = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: families.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                title: Text(families[index].name),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Age: ${families[index].age}'),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.location_on),
                        SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            families[index].address,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.copy),
                          onPressed: () {
                            Clipboard.setData(ClipboardData(
                              text: families[index].address,
                            ));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Center(child: Text('Address copied'))),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                trailing: Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        // Show the edit family dialog
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return EditFamilyDialog(
                              family: families[index],
                              onFamilyUpdated: (updatedFamily) {
                                // Update the family details in the list
                                setState(() {
                                  families[index] = updatedFamily;
                                });
                                Navigator.pop(context); // Close the dialog
                              },
                            );
                          },
                        );
                      },
                    ),
                    
                  ],
                ),
              ),
              Container(height: 4, color: Colors.amber,width: double.infinity,),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show the add family dialog
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AddFamilyDialog(
                onFamilyAdded: (family) {
                  // Add the new family to the list
                  setState(() {
                    families.add(family);
                  });
                  Navigator.pop(context); // Close the dialog
                },
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddFamilyDialog extends StatelessWidget {
  final Function(Family) onFamilyAdded;

  AddFamilyDialog({required this.onFamilyAdded});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Family'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: 'Name'),
          ),
          TextField(
            controller: ageController,
            decoration: InputDecoration(labelText: 'Age'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: addressController,
            decoration: InputDecoration(labelText: 'Address'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            // Create a new Family object
            Family family = Family(
              name: nameController.text,
              age: int.tryParse(ageController.text) ?? 0,
              address: addressController.text,
            );

            // Call the onFamilyAdded callback with the new family
            onFamilyAdded(family);
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}

class EditFamilyDialog extends StatefulWidget {
  final Family family;
  final Function(Family) onFamilyUpdated;

  EditFamilyDialog({required this.family, required this.onFamilyUpdated});

  @override
  _EditFamilyDialogState createState() => _EditFamilyDialogState();
}

class _EditFamilyDialogState extends State<EditFamilyDialog> {
  late TextEditingController nameController;
  late TextEditingController ageController;
  late TextEditingController addressController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.family.name);
    ageController = TextEditingController(text: widget.family.age.toString());
    addressController = TextEditingController(text: widget.family.address);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit Family'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: 'Name'),
          ),
          TextField(
            controller: ageController,
            decoration: InputDecoration(labelText: 'Age'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: addressController,
            decoration: InputDecoration(labelText: 'Address'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            // Create a new Family object with updated details
            Family updatedFamily = Family(
              name: nameController.text,
              age: int.tryParse(ageController.text) ?? 0,
              address: addressController.text,
            );

            // Call the onFamilyUpdated callback with the updated family
            widget.onFamilyUpdated(updatedFamily);
          },
          child: Text('Update'),
        ),
      ],
    );
  }
}