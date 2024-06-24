import 'package:booklab/Halaman/home.dart';
import 'package:flutter/material.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFC586E3), Color(0xFF8E44AD)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, 
              children: [
                Animate(
                  effects: [FadeEffect(delay: 250.ms)],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 25),
                      Image.asset(
                        "assets/Images/book.png",
                        width: 320,
                      ),
                      SizedBox(height: 50),
                      Text(
                        "BOOKLAB",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Made with ❤️ by Kelompok 1",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                )
              ]),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Animate(
                    effects: [ScaleEffect(delay: Durations.medium1)],
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "LOGIN PAGE",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 20.0,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 30),
                            TextField(
                              controller: usernameController,
                              decoration: InputDecoration(
                                labelText: 'Username',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: 25),
                            TextField(
                              controller: passwordController,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                border: OutlineInputBorder(),
                              ),
                              obscureText: true,
                            ),
                            SizedBox(height: 35),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: StadiumBorder(),
                                  elevation: 10,
                                  shadowColor: Colors.black,
                                  backgroundColor: Color(0xFFC586E3),
                                  minimumSize: Size.fromHeight(60),
                                ),
                                child: Text(
                                  'LOGIN',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                      color: Colors.white),
                                ),
                                onPressed: () {
                                  String Username = usernameController.text;
                                  String Password = passwordController.text;

                                  if (Username == "admin" &&
                                      Password == "admin") {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Home(),
                                      ),
                                    );
                                    _alertSukses();
                                  } else {
                                    _alertGagal();
                                  }
                                })
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _alertGagal() {
    ArtSweetAlert.show(
        context: context,
        artDialogArgs: ArtDialogArgs(
            type: ArtSweetAlertType.danger,
            title: "Oops...",
            text: "Login Gagal"));
  }

  void _alertSukses() {
    ArtSweetAlert.show(
        context: context,
        artDialogArgs: ArtDialogArgs(
            type: ArtSweetAlertType.success,
            title: "Success..",
            text: "Login Berhasil"));
  }
}
