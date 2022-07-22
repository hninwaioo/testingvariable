import 'package:flutter/material.dart';
import 'package:testingvariable/integerList.dart';
import 'package:testingvariable/mapcollection.dart';
import 'package:testingvariable/mapstringnull.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  )
  );
  DuplicateIntegerList();
  MapStringInt();
  MapStringNull();
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool value = true;
  late String _phone_no;
  late String _email;

  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  void _submitCommand() {
    //get state of our Form
    final form = formKey.currentState;

    //`validate()` validates every FormField that is a descendant of this Form,
    // and returns true if there are no errors.
    if (form!.validate()) {
      //`save()` Saves every FormField that is a descendant of this Form.
      form.save();

      // Email & password matched our validation rules
      // and are saved to _email and _password fields.
      _loginCommand();
    }
  }

  void _loginCommand() {
    // Show login details in snackbar
    final snackbar = SnackBar(
      content: Text('Email: $_email, Phone: $_phone_no,'),
    );
    scaffoldKey.currentState?.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Login Form",
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Create Account",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    width: 20,
                  ),

                  SizedBox(height: 15),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),

                        filled: true,
                        fillColor: Color.fromRGBO(255, 255, 255, 1.0),
                        hintText: "Your Email Address",
                        hintStyle: TextStyle(
                            color: Color.fromRGBO(66, 81, 101, 1.0))),

                    validator: (val) {
                      if (!isEmailValid(val))
                        return 'Enter valid email';
                    },
                    onSaved: (val) => _email = val!,
                  ),
                  SizedBox(height: 15),

                  TextFormField(
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),

                        filled: true,
                        fillColor: Color.fromRGBO(255, 255, 255, 1.0),
                        hintText: "Phone Number",
                        hintStyle: TextStyle(
                            color: Color.fromRGBO(66, 81, 101, 1.0))),

                    validator: (val) {
                      if (!isMobileNumberValid(val))
                        return 'Enter valid phone number';
                    },
                    onSaved: (val) => _phone_no = val!,
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 20,
              width: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(12, 121, 175, 1.0),
                onPrimary: Colors.white,
                padding: const EdgeInsets.symmetric(
                    horizontal: 65, vertical: 15),
              ),
              onPressed: _submitCommand,
              child: Text('Create your account'),
            ),
          ],
        ),
      ),
    );
  }

  bool isEmailValid(String? email) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(email!)){
      print("FalseEmail");
      return false;
    }else if(regex.hasMatch(email)){
      print("TrueEmail");
      return true;
    }
    print("False==>Email");
    return false;
  }

  bool isMobileNumberValid(String? phoneNumber) {

    String regexPattern = r'^(?:[+0][1-9])?[0-9]{10,12}$';
    var regExp = new RegExp(regexPattern);

    if (phoneNumber!.length == 0) {
      print("FalsePhone");
      return false;
    } else if (regExp.hasMatch(phoneNumber)) {
      print("TruePhone");
      if(phoneNumber!.startsWith("09")){
        phoneNumber.replaceAll("+959", "09");
      }
      return true;
    }
    print("False==>Phone");
    return false;
  }
}



