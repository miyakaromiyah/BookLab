import 'package:booklab/Halaman/home.dart';
import 'package:flutter/material.dart';
import 'package:booklab/Model/BookModel.dart';
import '../BookPage.dart';
import '../EditBook.dart';
import 'BookActionBtn.dart';
import 'BookHeader.dart';
import '/service/book_service.dart';

class BookDetail extends StatelessWidget {
  final Book book;
  final ApiHelper apiHelper = ApiHelper();

  BookDetail({Key? key, required this.book}) : super(key: key);

  Future<void> _refreshData(BuildContext context) async {
    await Future.delayed(Duration(seconds: 1));
  }

  void _readBook(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookPage(pdfUrl: book.bookurl ?? '#'),
      ),
    );
  }

  void _deleteBook(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Delete Book"),
          content: Text("Are you sure you want to delete this Book ?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("No"),
            ),
            TextButton(
              onPressed: () async {
                try {
                  await apiHelper.hapus(book.id!);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Buku Berhasil di Hapus'),
                      elevation: 5,
                      backgroundColor: Colors.green,
                    ),
                  );
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Gagal Menghapus Buku'),
                      elevation: 5,
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: Text("Yes"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final coverUrl = book.coverUrl?.isNotEmpty == true
        ? book.coverUrl!
        : "https://i.ibb.co.com/J5cv2vV/no-image.jpg";

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => _refreshData(context),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF8E44AD), Color(0xFFC586E3)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: BookHeader(
                        coverUrl: coverUrl,
                        title: book.title ?? 'No Title',
                        author: book.author ?? 'Unknown Author',
                        description:
                            book.description ?? 'No Description Available',
                        rating: book.rating?.toString() ?? '0',
                        pages: book.pages?.toString() ?? '0',
                        language: 'Indonesia',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Card(
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "About Book",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                book.description!,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              "About the Author",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                book.aboutAuthor ?? 'No Information Available',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        BookActionBtn(
                          bookUrl: book.bookurl ?? 'error',
                          onEdit: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditBook(book: book),
                              ),
                            );
                          },
                          onView: () {
                            _readBook(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: () => _deleteBook(context),
        child: Icon(Icons.delete),
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
      ),
    );
  }
}
