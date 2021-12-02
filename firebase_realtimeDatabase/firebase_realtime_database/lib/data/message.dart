class Message{
  final String text;
  final DateTime date;
  Message(this.text,this.date);

  Message.fromJson(Map<dynamic,dynamic> json):date = DateTime.parse(json['data'] as String),
text = json['text'] as String;

Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
  'data':date.toString(),
  'text':text
};

}