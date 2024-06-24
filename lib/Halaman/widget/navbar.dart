import 'package:booklab/Halaman/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: SvgPicture.asset("assets/Icons/dashboard.svg")),
        Text("BOOKLAB",
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          },
          child: CircleAvatar(
              radius: 25,
              backgroundColor: Theme.of(context).colorScheme.background,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                      "https://th.bing.com/th/id/OIP.sznKTawHmg0kF5VJPFpE5AAAAA?rs=1&pid=ImgDetMain"))),
        )
      ],
    );
  }
}
