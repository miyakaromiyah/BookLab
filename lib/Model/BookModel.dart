class Book {
  String? id;
  String? title;
  String? description;
  String? author;
  String? coverUrl;
  int? rating;
  String? category;
  int? numberofRating;
  int? pages;
  String? aboutAuthor;
  String? bookurl;

  Book({
    this.id,
    this.title,
    this.description,
    this.rating,
    this.pages,
    this.author,
    this.aboutAuthor,
    this.bookurl,
    this.category,
    this.coverUrl,
    this.numberofRating,
  });

  Book.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["rating"] is int) {
      rating = json["rating"];
    }
    if (json["pages"] is int) {
      pages = json["pages"];
    }
    if (json["author"] is String) {
      author = json["author"];
    }
    if (json["aboutAuthor"] is String) {
      aboutAuthor = json["aboutAuthor"];
    }
    if (json["bookurl"] is String) {
      bookurl = json["bookurl"];
    }
    if (json["category"] is String) {
      category = json["category"];
    }
    if (json["coverUrl"] is String) {
      coverUrl = json["coverUrl"];
    }

    if (json["numberofRating"] is int) {
      numberofRating = json["numberofRating"];
    } else if (json["numberofRating"] is String) {
      numberofRating = int.tryParse(json["numberofRating"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["description"] = description;
    _data["rating"] = rating;
    _data["pages"] = pages;
    _data["author"] = author;
    _data["aboutAuthor"] = aboutAuthor;
    _data["bookurl"] = bookurl;
    _data["category"] = category;
    _data["coverUrl"] = coverUrl;
    _data["numberofRating"] = numberofRating;
    return _data;
  }
}
