import 'package:finly_flutter001/src/bloc/login/login_bloc.dart';
import 'package:finly_flutter001/src/pages/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  // int count = 0;

  @override
  void initState() {
    super.initState();
    _usernameController.text = "admin";
    _passwordController.text = "1234";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("LoginPage"),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          // color: Colors.purple.withOpacity(0.2),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Card(
                    child: Container(
                      padding: const EdgeInsets.all(32),
                      height: 500,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ..._buildTextField(),
                          // SizedBox(
                          //   height: 30,
                          // ),
                          SizedBox(height: 40),
                          BlocBuilder<LoginBloc, LoginState>(
                            builder: (context, state) {
                              return Text(
                                "Login Result: ${state.isAuthened ? "Success" : "Error"}",
                                style: TextStyle(
                                  color: state.isAuthened ? Colors.green : Colors.red,
                                ),
                              );
                            },
                          ),
                          ..._buildButtons(),
                          Row(
                            children: [
                              // Text("Debug: ${context.read<LoginBloc>().state.count}"),
                              // separation of concern
                              BlocBuilder<LoginBloc, LoginState>(
                                builder: (context, state) {
                                  return Text("DebugX: ${state.count}");
                                },
                              ),
                              IconButton(
                                onPressed: () =>
                                    context.read<LoginBloc>().add(LoginEventAdd()),
                                icon: Icon(Icons.add),
                              ),
                              IconButton(
                                onPressed: () =>
                                    context.read<LoginBloc>().add(LoginEventRemove()),
                                icon: Icon(Icons.remove),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleClickLogin() {
    // print("Finly: Login (${_usernameController.text})");
    // Navigator.pushNamed(
    //   context,
    //   AppRoute.home,
    // );

    final user = User(
      username: _usernameController.text,
      password: _passwordController.text,
    );
    context.read<LoginBloc>().add(LoginEventLogin(user));
  }

  void _handleClickReset() {
    _usernameController.text = "";
    _passwordController.text = "";
  }

  _buildTextField() {
    return [
      TextField(
        controller: _usernameController,
        decoration: InputDecoration(labelText: "UserName"),
      ),
      TextField(
        controller: _passwordController,
        decoration: InputDecoration(labelText: "Password"),
      ),
    ];
  }

  _buildButtons() {
    return [
      ElevatedButton(
        // onPressed: () {
        //   print("Finly: Login");
        // },
        onPressed: _handleClickLogin,
        child: Text("SignIn"),
      ),
      ElevatedButton(
        onPressed: _handleClickRegister,
        child: Text("Register"),
      ),
      OutlinedButton(
        onPressed: _handleClickReset,
        child: Text("Reset"),
      ),
    ];
  }

  void _handleClickRegister() {
    Navigator.pushNamed(
      context,
      AppRoute.register,
    );
  }

  // _handleClickAdd() {
  //   count++;
  //   setState(() {});
  // }
  //
  // void _handleClickRemove() {
  //   count--;
  //   setState(() {});
  // }
}
