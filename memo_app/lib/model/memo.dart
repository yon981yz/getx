class Memo {
  String id;
  String title;
  String content;

  Memo({
    required this.id,
    required this.title,
    required this.content,
  });

  factory Memo.formMap(Map<String, dynamic> map, String id){
    return Memo(
      id: id, 
      title: map['title'] ?? '', 
      content: map['content'] ?? '',
    );
  }
}