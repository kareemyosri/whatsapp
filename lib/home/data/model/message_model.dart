class MessageModl{
  final String message;
 final String date;
 final String uid;
  MessageModl( {required this.message,
  required this.date,
  required this.uid
  });
  factory MessageModl.fromfirebase(json)=>MessageModl(
    uid:json['uid'], 
    message: json['message'],
    date: json['date']
     );
}