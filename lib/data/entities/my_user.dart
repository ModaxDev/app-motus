class MyUser {
  String id;
  String name;
  String firstName;

  MyUser(this.id,this.name,this.firstName);

  MyUser.fromJson(Map<String, Object?> json)
      : this(
      json['id'] as String,
      json['name'] as String,
      json['firstName'] as String,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'firstName': firstName,
  };
}