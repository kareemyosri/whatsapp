class StoryModel{
  final String name;
  final String? imageurl;
  final String storyType;
  final String date;
  final String uid;

  StoryModel({required this.name, 
   this.imageurl, required this.storyType, required this.date, required this.uid});
  factory StoryModel.fromfirebase(json)=>StoryModel(name: json['name'], imageurl: json['storyURL'],
   storyType: json['storyType'], date: json['date'].toString(), uid: json['uid']);
  
}