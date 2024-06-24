import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:profile_view/profile_view.dart';
import '/Components/BackButton.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Animate(
          effects: [FadeEffect(delay: 250.ms)],
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFC586E3), Color(0xFF8E44AD)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyBackButton(),
                            ],
                          ),
                          SizedBox(height: 30),
                          Text('My Profile',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 20,
                                  color: Colors.white)),
                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  width: 2,
                                  color:
                                      Theme.of(context).colorScheme.background,
                                )),
                            child: Container(
                              width: 120,
                              height: 120,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: ProfileView(
                                  image: NetworkImage(
                                      "https://th.bing.com/th/id/OIP.sznKTawHmg0kF5VJPFpE5AAAAA?rs=1&pid=ImgDetMain"),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          CustomTextField(
                            hintText: 'Nama',
                            initialValue: 'Admin',
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Text("General Details",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Animate(
                        effects: [FadeEffect(delay: 250.ms)],
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              itemProfile('Full Name', 'Fatia Dewi',
                                  CupertinoIcons.person),
                              SizedBox(height: 10),
                              itemProfile(
                                  'Phone', '08123456789', CupertinoIcons.phone),
                              SizedBox(height: 10),
                              itemProfile(
                                  'Address',
                                  'Jl. Dewi Sartika No.289 4, Cawang, Kec. Kramat jati, Kota Jakarta Timur',
                                  CupertinoIcons.map),
                              SizedBox(height: 10),
                              itemProfile('Email', 'admin@gmail.com',
                                  CupertinoIcons.mail),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String initialValue;

  const CustomTextField({required this.hintText, required this.initialValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFC586E3),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextFormField(
        enabled: false,
        textAlign: TextAlign.center,
        style:
            TextStyle(color: Colors.black, fontFamily: "Poppins", fontSize: 15),
        initialValue: initialValue,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(17),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 17),
        ),
      ),
    );
  }
}

itemProfile(String title, String subtitle, IconData iconData) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFC586E3),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ]),
    child: ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: Icon(iconData),
      tileColor: Colors.white,
    ),
  );
}
