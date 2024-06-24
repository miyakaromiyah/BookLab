import 'package:dio/dio.dart';
import '/helpers/api_client.dart';
import '/Model/BookModel.dart';

class ApiHelper {
  Future<List<Book>> listData() async {
    final Response response = await ApiClient().get('book');
    final List data = response.data as List;
    return data.map((json) => Book.fromJson(json)).toList();
  }

  Future<Book> getById(String id) async {
    final Response response = await ApiClient().get('book/$id');
    return Book.fromJson(response.data);
  }

  Future<Book> simpan(Book book) async {
    var data = book.toJson();
    final Response response = await ApiClient().post('book', data);
    return Book.fromJson(response.data);
  }

  Future<Book> ubah(Book book, String id) async {
    var data = book.toJson();
    final Response response = await ApiClient().put('book/$id', data);
    return Book.fromJson(response.data);
  }

  Future<void> hapus(String id) async {
    await ApiClient().delete('book/$id');
  }

  Future<List<Book>> searchBooks(String query) async {
    final Response response = await ApiClient().get('book?title=$query');
    final List data = response.data as List;
    return data.map((json) => Book.fromJson(json)).toList();
  }
}
