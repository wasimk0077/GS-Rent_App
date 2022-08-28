import 'package:flutter/material.dart';

import 'user.dart';

class AddUserDialog extends StatefulWidget {

  final Function(User) addUser;

  AddUserDialog(this.addUser);

  @override
  _AddUserDialogState createState() => _AddUserDialogState();
}

class _AddUserDialogState extends State<AddUserDialog> {


  @override
  Widget build(BuildContext context) {

    Widget buildTextField(String hint, TextEditingController controller) {
      return Container(
        margin: EdgeInsets.all(4),
        child: TextField(
          decoration: InputDecoration(
            labelText: hint,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black38,
              ),
            ),
          ),
          controller: controller,
        ),
      );
    }

    var propertyNameController = TextEditingController();
    var ConstructorsNameController = TextEditingController();
    var sqftController = TextEditingController();
    var LocationController = TextEditingController();

    return Container(
      padding: EdgeInsets.all(8),
      height: 350,
      width: 400,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Add Property',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Colors.blueGrey,
              ),
            ),
            buildTextField('prop name', propertyNameController),
            buildTextField('Constructor', ConstructorsNameController),
            buildTextField('sq.ft', sqftController),
            buildTextField('Location', LocationController),
            ElevatedButton(
              onPressed: () {
                final user = User(propertyNameController.text, ConstructorsNameController.text,
                    sqftController.text,LocationController.text);
                widget.addUser(user);
                Navigator.of(context).pop();

              },
              child: Text('Add Property'),
            ),
          ],
        ),
      ),
    );
  }
}