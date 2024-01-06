/// id : 0
/// quote : "Be yourself; everyone else is already taken."
/// author : "Oscar Wilde"

class QuoteModel {
  QuoteModel({
      num? id, 
      String? quote, 
      String? author,}){
    _id = id;
    _quote = quote;
    _author = author;
}

  QuoteModel.fromJson(dynamic json) {
    _id = json['id'];
    _quote = json['quote'];
    _author = json['author'];
  }
  num? _id;
  String? _quote;
  String? _author;
QuoteModel copyWith({  num? id,
  String? quote,
  String? author,
}) => QuoteModel(  id: id ?? _id,
  quote: quote ?? _quote,
  author: author ?? _author,
);
  num? get id => _id;
  String? get quote => _quote;
  String? get author => _author;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['quote'] = _quote;
    map['author'] = _author;
    return map;
  }

}