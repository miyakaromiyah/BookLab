import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookActionBtn extends StatelessWidget {
  final String bookUrl;
  final VoidCallback onEdit;
  final VoidCallback onView;

  const BookActionBtn({
    super.key,
    required this.bookUrl,
    required this.onEdit,
    required this.onView,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [Color(0xFFC586E3), Color(0xFF8E44AD)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: onView,
            child: Row(
              children: [
                SvgPicture.asset("assets/Icons/book.svg"),
                SizedBox(width: 10),
                Text(
                  "READ BOOK",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white,
                        letterSpacing: 1.2,
                      ),
                ),
              ],
            ),
          ),
          Container(
            width: 3,
            height: 30,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          InkWell(
            onTap: onEdit,
            child: Row(
              children: [
                Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text(
                  "EDIT BOOK",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white,
                        letterSpacing: 1.5,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
