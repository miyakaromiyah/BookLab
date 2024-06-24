import 'package:booklab/Halaman/BookDetail/BookDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '/Model/BookModel.dart';
import '/service/book_service.dart';

class EditBook extends StatefulWidget {
  final Book book;

  EditBook({super.key, required this.book});

  @override
  _EditBookState createState() => _EditBookState();
}

class _EditBookState extends State<EditBook> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _titleController;
  late TextEditingController _authorController;
  late TextEditingController _descriptionController;
  late TextEditingController _ratingController;
  late TextEditingController _categoryController;
  late TextEditingController _pagesController;
  late TextEditingController _aboutAuthorController;
  late TextEditingController _bookurlController;
  late TextEditingController _coverUrlController;

  @override
  void initState() {
    super.initState();

    _titleController = TextEditingController(text: widget.book.title);
    _authorController = TextEditingController(text: widget.book.author);
    _descriptionController =
        TextEditingController(text: widget.book.description);
    _ratingController =
        TextEditingController(text: widget.book.rating.toString());
    _categoryController = TextEditingController(text: widget.book.category);
    _pagesController =
        TextEditingController(text: widget.book.pages.toString());
    _aboutAuthorController =
        TextEditingController(text: widget.book.aboutAuthor);
    _bookurlController = TextEditingController(text: widget.book.bookurl);
    _coverUrlController = TextEditingController(text: widget.book.coverUrl);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    _descriptionController.dispose();
    _ratingController.dispose();
    _categoryController.dispose();
    _pagesController.dispose();
    _aboutAuthorController.dispose();
    _bookurlController.dispose();
    _coverUrlController.dispose();
    super.dispose();
  }

  Future<void> _saveBook() async {
    if (_formKey.currentState!.validate()) {
      Book updatedBook = Book(
        id: widget.book.id,
        title: _titleController.text,
        author: _authorController.text,
        description: _descriptionController.text,
        rating: int.tryParse(_ratingController.text),
        category: _categoryController.text,
        pages: int.tryParse(_pagesController.text),
        aboutAuthor: _aboutAuthorController.text,
        bookurl: _bookurlController.text,
        coverUrl: _coverUrlController.text,
      );

      await ApiHelper().ubah(updatedBook, widget.book.id!);
      Navigator.pop(context);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => BookDetail(book: updatedBook)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Book Detail'),
        centerTitle: true,
        backgroundColor: Color(0xFFC586E3),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          height: 650,
          child: Animate(
            effects: [FadeEffect(delay: 250.ms)],
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      TextFormField(
                        controller: _titleController,
                        decoration: InputDecoration(labelText: 'Title'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the title';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _authorController,
                        decoration: InputDecoration(labelText: 'Author'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the author';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _descriptionController,
                        decoration: InputDecoration(labelText: 'Description'),
                        maxLines: 3,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the description';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _ratingController,
                        decoration: InputDecoration(labelText: 'Rating'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the rating';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _categoryController,
                        decoration: InputDecoration(labelText: 'Category'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Category';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _pagesController,
                        decoration: InputDecoration(labelText: 'Pages'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the number of pages';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _aboutAuthorController,
                        decoration: InputDecoration(labelText: 'About Author'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter information about the author';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _bookurlController,
                        decoration: InputDecoration(labelText: 'Book URL'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the book URL';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _coverUrlController,
                        decoration: InputDecoration(labelText: 'Cover URL'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the cover URL';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _saveBook,
                        style: ElevatedButton.styleFrom(
                          elevation: 3,
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
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: Text(
                              'SAVE',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 17,
                                color: Colors.white,
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
      ),
    );
  }
}
