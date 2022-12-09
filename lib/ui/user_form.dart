import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_db/bloc/bloc.dart';
import 'package:test_db/bloc/events.dart';
import 'package:test_db/model/user.dart';

class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Enter name"),
            ),
            TextFormField(
              controller: ageController,
              decoration: const InputDecoration(labelText: "Enter age"),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: _addUser,
                child: const Text('Save user'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addUser() {
    final bloc = BlocProvider.of<UsersBloc>(context);
    bloc.add(
      AddUserEvent(
        User(
          name: nameController.text,
          age: int.parse(ageController.text),
        ),
      ),
    );
    nameController.clear();
    ageController.clear();
    bloc.add(LoadUsersEvent());
  }
}
