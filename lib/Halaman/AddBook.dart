import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'Home.dart';
import '/Model/BookModel.dart';
import '/service/book_service.dart';

class AddBook extends StatefulWidget {
  AddBook({super.key});

  @override
  _AddBookState createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  final _titleCtrl = TextEditingController();
  final _descriptionCtrl = TextEditingController();
  final _authorCtrl = TextEditingController();
  final _aboutAuthorCtrl = TextEditingController();
  final _coverUrlCtrl = TextEditingController();
  final _ratingCtrl = TextEditingController();
  final _categoryCtrl = TextEditingController();
  final _pagesCtrl = TextEditingController();
  final _bookurlCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC586E3),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          'ADD BOOK',
          style: TextStyle(fontFamily: 'Poppins', color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Animate(
            effects: [FadeEffect(delay: 250.ms)],
            child: Card(
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Title Book',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    _TextField(_titleCtrl, 'Masukkan Title'),
                    SizedBox(height: 20),
                    Text(
                      'Description Book',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    _TextField(_descriptionCtrl, 'Masukkan Deskripsi'),
                    SizedBox(height: 20),
                    Text(
                      'Author Book',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    _TextField(_authorCtrl, 'Masukkan Nama Author'),
                    SizedBox(height: 20),
                    Text(
                      'About Author',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    _TextField(_aboutAuthorCtrl, 'Masukkan Tentang Author'),
                    SizedBox(height: 20),
                    Text(
                      'Cover Book',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    _TextField(_coverUrlCtrl, 'Masukkan Link Cover'),
                    SizedBox(height: 20),
                    Text(
                      'Rating Book',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    _TextField(_ratingCtrl, 'Masukkan Angka dari 1-5',
                        isNumeric: true),
                    SizedBox(height: 20),
                    Text(
                      'Category Book',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    _TextField(_categoryCtrl, 'Masukkan Category'),
                    SizedBox(height: 20),
                    Text(
                      'Pages Book',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    _TextField(_pagesCtrl, 'Masukkan Jumlah Pages',
                        isNumeric: true),
                    SizedBox(height: 20),
                    Text(
                      'Link URL Book',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    _TextField(_bookurlCtrl, 'Masukkan Link PDF'),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        Book book = Book(
                            title: _titleCtrl.text,
                            description: _descriptionCtrl.text,
                            author: _authorCtrl.text,
                            aboutAuthor: _aboutAuthorCtrl.text,
                            coverUrl: _coverUrlCtrl.text,
                            rating: int.parse(_ratingCtrl.text),
                            category: _categoryCtrl.text,
                            pages: int.parse(_pagesCtrl.text),
                            bookurl: _bookurlCtrl.text);

                        await ApiHelper().simpan(book).then((value) {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFFC586E3), Color(0xFF8E44AD)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          width: 100,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            'SUBMIT',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _TextField(TextEditingController controller, String hintText,
      {bool isNumeric = false}) {
    return TextField(
      controller: controller,
      keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
      inputFormatters:
          isNumeric ? [FilteringTextInputFormatter.digitsOnly] : [],
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}
