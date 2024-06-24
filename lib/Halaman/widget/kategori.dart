import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Category extends StatelessWidget {
  final String iconPath;
  final String btnName;
  Category({super.key, required this.iconPath, required this.btnName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.background),
          child: Row(
            children: [
              SvgPicture.asset(iconPath),
              SizedBox(width: 10),
              Text(btnName),
            ],
          ),
        ),
      ),
    );
  }
}
