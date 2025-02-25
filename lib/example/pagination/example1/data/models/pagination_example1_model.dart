class PaginationExample1Model {
  final String title;
  final String body;
  final int id;

  PaginationExample1Model.fromJson(Map json) :
        title = json['title'],
        body = json['body'],
        id = json['id'];

}