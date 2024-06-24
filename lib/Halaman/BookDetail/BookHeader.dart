import 'package:profile_view/profile_view.dart';
import '/Components/BackButton.dart';
import 'package:flutter/material.dart';

class BookHeader extends StatelessWidget {
  final String coverUrl;
  final String title;
  final String author;
  final String description;
  final String rating;
  final String pages;
  final String language;

  const BookHeader({
    super.key,
    required this.coverUrl,
    required this.title,
    required this.author,
    required this.description,
    required this.rating,
    required this.pages,
    required this.language,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyBackButton(),
          ],
        ),
        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfileView(
              height: 220,
              width: 150,
              borderRadius: 10,
              circle: false,
              image: NetworkImage(
                coverUrl,
              ),
            )
          ],
        ),
        SizedBox(height: 30),
        Text(
          title,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white,
              ),
        ),
        Text(
          "Author : $author",
          style: TextStyle(
              fontFamily: 'Poppins', fontSize: 15, color: Colors.white),
        ),
        SizedBox(height: 10),
        Text(
          description,
          maxLines: 2,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Poppins', fontSize: 10, color: Colors.white),
        ),
        SizedBox(height: 20),
        Divider(
          color: Colors.white,
          thickness: 2,
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  "Rating",
                  style: TextStyle(
                      fontFamily: 'Poppins', fontSize: 12, color: Colors.white),
                ),
                Text(
                  rating,
                  style: TextStyle(
                      fontFamily: 'Poppins', fontSize: 12, color: Colors.white),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "Language",
                  style: TextStyle(
                      fontFamily: 'Poppins', fontSize: 12, color: Colors.white),
                ),
                Text(
                  language,
                  style: TextStyle(
                      fontFamily: 'Poppins', fontSize: 12, color: Colors.white),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "Pages",
                  style: TextStyle(
                      fontFamily: 'Poppins', fontSize: 12, color: Colors.white),
                ),
                Text(
                  pages,
                  style: TextStyle(
                      fontFamily: 'Poppins', fontSize: 12, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
