import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  AuthForm(this.submitFn, this.isLoading);

  final bool isLoading;
  final void Function(
    String email,
    String password,
    String username,
    bool isLogin,
    BuildContext ctx
  ) submitFn;

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formkey = GlobalKey<FormState>();
  bool _isLogin = true;
  String _userEmail = "";
  String _userName = "";
  String _userPassword = "";

  void _trySubmit() {
    final isValid = _formkey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formkey.currentState!.save();
      widget.submitFn(
        _userEmail.trim(),
        _userPassword.trim(),
        _userName.trim(),
        _isLogin,
        context
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!_isLogin)
                    TextFormField(
                      key: ValueKey("username"),
                      onSaved: (newValue) {
                        _userName = newValue!;
                      },
                      validator: (value) {
                        if (value!.isEmpty || value.length < 4) {
                          return "Please enter at least 4 Characters";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFE3B84))),
                          labelText: "Enter User Name",
                          labelStyle: TextStyle(color: Color(0xFFFE3B84))),
                    ),
                  TextFormField(
                    key: ValueKey("email"),
                    onSaved: (newValue) {
                      _userEmail = newValue!;
                    },
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFE3B84))),
                        labelText: "Enter an email",
                        labelStyle: TextStyle(color: Color(0xFFFE3B84))),
                  ),
                  TextFormField(
                    key: ValueKey("password"),
                    onSaved: (newValue) {
                      _userPassword = newValue!;
                    },
                    validator: (value) {
                      if (value!.isEmpty || value.length < 7) {
                        return 'Password must be at least 7 characters long';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFE3B84))),
                        labelText: "Enter a password",
                        labelStyle: TextStyle(color: Color(0xFFFE3B84))),
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  if(widget.isLoading)
                  CircularProgressIndicator(),
                  if(!widget.isLoading)
                  ElevatedButton(
                    onPressed: _trySubmit,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 10.0),
                      backgroundColor: Color(0xFFFE3B84),
                      shape: StadiumBorder(),
                    ),
                    child: Text(
                      _isLogin ? "Log In" : "Signup",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  if(!widget.isLoading)
                  TextButton(
                      onPressed: () {
                        setState(() {
                          _isLogin = !_isLogin;
                        });
                      },
                      child: Text(
                        _isLogin
                            ? "Create new account"
                            : 'I already have an Account ',
                        style: TextStyle(color: Color(0xFFFE3B84)),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
