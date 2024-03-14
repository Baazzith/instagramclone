import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:instagramclone/screens/home.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState(){
    super.initState();
    loadCredentials();
  }
  Future<void> saveCredentials() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('username', usernameController.text);
    pref.setString('password', passwordController.text);
    pref.setBool('isLoggedIN', true);
  }
  bool isValidCredentials(){
    return isValidUsername(usernameController.text) && passwordController.text == 'Instagram123';
  }
  bool isValidUsername(String username){
    if(username.length < 5){
      return false;
    }
    return true;
  }
  Future<void> loadCredentials() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      usernameController.text = pref.getString('username') ?? '';
      passwordController.text = pref.getString('password') ?? '';
    });
  }
  Future<void> navigateToHome() async {
    if(isValidCredentials()){
      await saveCredentials();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('asset/image1.jpg'),
                    height: 200,
                  ),
                  Form(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: usernameController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              labelText: 'Username',
                              hintText: 'Enter your username'),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'Password',
                            hintText: 'Enter your password',
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            navigateToHome();
                          },
                          child: T
                            ext('Login'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}