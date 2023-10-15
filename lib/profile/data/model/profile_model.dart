class ProfileModel{
  final String name;
  final String photo;
  final String id;

  // ProfileModel{{ required this.name, required this.photo});

  factory ProfileModel.formfirebase(json){
    // ignore: unnecessary_null_in_if_null_operators
    return ProfileModel(name: json['name'], photo: json['photo'],id: json['id']);
  }

  ProfileModel({required this.name, required this.photo, required this.id });
}