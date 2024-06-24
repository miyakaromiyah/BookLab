import 'package:booklab/Halaman/AddBook.dart';
import 'package:booklab/Halaman/ProfilePage.dart';
import 'package:booklab/login.dart';
import 'package:flutter/material.dart';
import 'package:profile_view/profile_view.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFC586E3), Color(0xFF8E44AD)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.only(top: 25),
          children: [
            ProfileView(
              height: 150,
              width: 50,
              circle: true,
              borderRadius: 20,
              image: NetworkImage(
                  "https://th.bing.com/th/id/OIP.sznKTawHmg0kF5VJPFpE5AAAAA?rs=1&pid=ImgDetMain"),
            ),
            SizedBox(height: 30),
            Column(
              children: [
                Text(
                  "Admin",
                  style: TextStyle(
                      fontFamily: 'Poppins', 
                      fontSize: 15, 
                      color: Colors.white),
                ),
                Text(
                  "admin@gmail.com",
                  style: TextStyle(
                      fontFamily: 'Poppins', 
                      fontSize: 15, 
                      color: Colors.white),
                ),

                Divider(
                  color: Colors.white,
                  thickness: 1,
                  height: 20,
                  indent: 20,
                  endIndent: 20,
                ),
              ],
            ),

            // My Profile
            ListTile(
              leading: Icon(
                Icons.supervised_user_circle_rounded,
                color: Colors.white,
              ),
              title: Text(
                'My Profile',
                style: TextStyle(
                    fontFamily: 'Poppins', 
                    fontSize: 16, 
                    color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProfilePage(),
                  ),
                );
              },
            ),

            // ADD BOOK
            ListTile(
              leading: Icon(
                Icons.add_circle_outline,
                color: Colors.white,
              ),
              title: Text(
                'Add Book',
                style: TextStyle(
                    fontFamily: 'Poppins', 
                    fontSize: 16, 
                    color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddBook(),
                  ),
                );
              },
            ),

            // LOGOUT
            Container(
               margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.logout_rounded,
                  color: Colors.white,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16, 
                      color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
