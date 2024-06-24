import 'package:booklab/Components/BookList.dart';
import 'package:booklab/Halaman/AddBook.dart';
import 'package:booklab/Halaman/BookDetail/BookDetail.dart';
import 'package:booklab/Halaman/home.dart';
import 'package:booklab/Halaman/ProfilePage.dart';
import 'package:booklab/Halaman/widget/sidebar.dart';
import 'package:booklab/loading.dart';
import 'package:booklab/login.dart';
import 'package:booklab/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Loading(),
    );
  }
}
