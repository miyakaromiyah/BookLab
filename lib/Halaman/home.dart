import 'package:flutter/material.dart';
import 'package:booklab/Halaman/widget/navbar.dart';
import 'package:booklab/Halaman/widget/sidebar.dart';
import '/Model/BookModel.dart';
import '/service/book_service.dart';
import 'BookDetail/BookDetail.dart';

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Book>> futureBooks;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    futureBooks = ApiHelper().listData();
  }

  Future<void> _refreshData() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      futureBooks = ApiHelper().listData();
    });
  }

  //Fungsi untuk Mencari Buku Berdasarkan Judul buku
  Future<void> _searchBooks(String query) async {
    if (query.isEmpty) {
      setState(() {
        futureBooks = ApiHelper().listData();
      });
    } else {
      setState(() {
        futureBooks = ApiHelper().searchBooks(query);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFC586E3), Color(0xFF8E44AD)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                height: 320,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Navbar(),
                    SizedBox(height: 50),
                    Row(
                      children: [
                        Text("HALLO!",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 17,
                                color: Colors.white)),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                              "Time to read book and enhance your knowledge",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 11,
                                  color: Colors.white)),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Search(
                        searchController: _searchController,
                        onSearch: _searchBooks),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Your Interests",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              FutureBuilder<List<Book>>(
                future: futureBooks,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                        child: _buildNoResults('Buku yang Anda cari tidak ada'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('Buku tidak tersedia!'));
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final book = snapshot.data![index];
                        final coverUrl = book.coverUrl?.isNotEmpty == true
                            ? book.coverUrl!
                            : "https://i.ibb.co.com/J5cv2vV/no-image.jpg";
                        return Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BookDetail(book: book),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary
                                              .withOpacity(0.2),
                                          spreadRadius: 2,
                                          blurRadius: 8,
                                          offset: Offset(2, 2),
                                        )
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        coverUrl,
                                        width: 100,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${book.title}",
                                          maxLines: 2,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          "Author : ${book.author}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Icon(Icons.star,
                                                color: Colors.yellow),
                                            Text(
                                              "${book.rating}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                            ),
                                            Text(
                                              " (${book.numberofRating} ratings)",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Search extends StatelessWidget {
  final TextEditingController searchController;
  final Function(String) onSearch;

  Search({required this.searchController, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: 'Search...',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.search),
            onPressed: () => onSearch(searchController.text),
          ),
        ),
      ),
    );
  }
}

Widget _buildNoResults(String message) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          "https://static-00.iconduck.com/assets.00/9-404-error-illustration-2048x908-vp03fkyu.png",
          width: 350,
          height: 150,
        ),
        SizedBox(height: 20),
        Text(
          message,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ],
    ),
  );
}
