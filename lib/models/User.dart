class User {
  int? id;
  String? email;
  String? firstName;
  String? familyName;
  String? password;
  String? token;

  User({
    this.id,
    this.email,
    this.password,
    this.firstName,
    this.familyName,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['user']['id'],
      email: json['user']['email'],
      password: json['user']['password'],
      firstName: json['user']['firstName'],
      familyName: json['user']['familyName'],
      token: json['authorisation']['token'],
    );

  }


  factory User.infoFromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      firstName: json['firstName'],
      familyName: json['familyName'],
    );

  }
}