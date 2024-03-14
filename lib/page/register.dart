import 'package:flutter/material.dart';
import 'package:lab3/model/user.dart';
import 'package:lab3/page/detail.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _checkvalue_1 = false;
  bool _checkvalue_2 = false;
  bool _checkvalue_3 = false;

  int _gender = 0;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'user info',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Full Name",
                  icon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  icon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  icon: Icon(Icons.password),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _confirmpassController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Confirm Password",
                  icon: Icon(Icons.password),
                ),
              ),
              const SizedBox(height: 16),
              const Text("What is your Gender?"),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ListTile(
                      title: const Text("Male"),
                      leading: Radio(
                          value: 1,
                          groupValue: _gender,
                          onChanged: (value) {
                            setState(() {
                              _gender = value!;
                            });
                          }),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: const Text("Female"),
                      leading: Radio(
                          value: 2,
                          groupValue: _gender,
                          onChanged: (value) {
                            setState(() {
                              _gender = value!;
                            });
                          }),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: const Text("Others"),
                      leading: Radio(
                          value: 3,
                          groupValue: _gender,
                          onChanged: (value) {
                            setState(() {
                              _gender = value!;
                            });
                          }),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text("What is ur favorite?"),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      title: const Text("Music"),
                      value: _checkvalue_1,
                      onChanged: (value) {
                        _checkvalue_1 = value!;
                      },
                    ),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                      title: const Text("Movie"),
                      value: _checkvalue_2,
                      onChanged: (value) {
                        _checkvalue_2 = value!;
                      },
                    ),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                      title: const Text("Book"),
                      value: _checkvalue_3,
                      onChanged: (value) {
                        _checkvalue_3 = value!;
                      },
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        var fullName = _nameController.text;
                        var email = _emailController.text;
                        var gendername = 'None';
                        if (_gender == 1) {
                          gendername = "Male";
                        } else if (_gender == 2) {
                          gendername = "Female";
                        } else {
                          gendername = "Other";
                        }

                        var favoriteName = '';
                        if (_checkvalue_1) {
                          favoriteName += "Music, ";
                        }
                        if (_checkvalue_2) {
                          favoriteName += "Movie, ";
                        }
                        if (_checkvalue_3) {
                          favoriteName += "Book, ";
                        }
                        if (favoriteName != "")
                          favoriteName = favoriteName.substring(
                              0, favoriteName.length - 2);
                        var objUser = User(
                            fullName: fullName,
                            email: email,
                            gender: gendername,
                            favorite: favoriteName);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Detail(user: objUser),
                          ),
                        );
                      },
                      child: const Text('Register'),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: OutlinedButton(
                          onPressed: () {}, child: const Text('Login')))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
