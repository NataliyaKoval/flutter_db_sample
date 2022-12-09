import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_db/bloc/bloc.dart';
import 'package:test_db/bloc/events.dart';
import 'package:test_db/bloc/states.dart';
import 'package:test_db/ui/user_form.dart';
import 'package:test_db/ui/users_list.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    _printUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const UserForm(),
        BlocBuilder<UsersBloc, UsersState>(
            builder: (BuildContext context, state) {
          if (state is UsersLoadedState) {
            return Expanded(
              child: UsersList(
                users: state.users,
              ),
            );
          } else {
            return const Text('No users');
          }
        }),
      ],
    );
  }

  void _printUsers() {
    final bloc = BlocProvider.of<UsersBloc>(context);
    bloc.add(LoadUsersEvent());
  }
}
