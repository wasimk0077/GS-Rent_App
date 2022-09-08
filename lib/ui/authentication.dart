import 'package:authh_app/net/flutterfire.dart';
import 'package:authh_app/ui/home_view.dart';
// import 'package:authh_app/ui/tenant.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x121212),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // decoration: BoxDecoration(color: Color.fromARGB(255, 5, 72, 108)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            SizedBox(
              
              width: 70,
              height: 100,
              child: 
              Text(
                        ('Signup'),
                        style: TextStyle(
                          fontWeight:FontWeight.bold,
                          
                          fontSize: 20,
                          color: Colors.white,
                          
                        ),
                        
                      ),
              
            ),
            Container(
              
              width: MediaQuery.of(context).size.width / 1.3,
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                controller: _emailField,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  hintText: "something@gmail.com",
                  hintStyle: TextStyle(color: Colors.white),
                  labelText: "Username",
                  labelStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            Container(
              width: MediaQuery.of(context).size.width / 1.3,
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                controller: _passwordField,
                obscureText: true,
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: "Password",
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    labelText: "Password",
                    labelStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              width: MediaQuery.of(context).size.width / 1.4,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular((15.0)),
                  color: Colors.green),
              child: MaterialButton(
                onPressed: () async {
                  bool shouldnavigate =
                      await register(_emailField.text, _passwordField.text);
                  if (shouldnavigate) {
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeView(),
                        ),
                      );
                    }
                  }
                },
                child: Text(
                  "Register",
                  style: new TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                ),
                textColor: Colors.white,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular((15.0)),
                  color: Colors.green),
              child: MaterialButton(
                onPressed: () async {
                  bool shouldnavigate =
                      await signIn(_emailField.text, _passwordField.text);
                  if (shouldnavigate) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeView(),
                      ),
                    );
                  }
                },
                child: Text(
                  "Login",
                  style: new TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
