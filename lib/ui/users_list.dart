import 'package:flutter/material.dart';
import 'package:test_db/model/user.dart';

class UsersList extends StatelessWidget {
  final List<User> users;

  const UsersList({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1.5, color: Colors.grey),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text('Name: ${users[index].name}'),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 1,
                    child: Text('Age: ${users[index].age.toString()}'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
