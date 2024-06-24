import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '/Halaman/home.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      },
      child: Row(
        children: [
          SvgPicture.asset("assets/Icons/back.svg"),
          SizedBox(width: 10),
          Text("Back",
              style: TextStyle(fontFamily: 'Poppins', color: Colors.white))
        ],
      ),
    );
  }
}
