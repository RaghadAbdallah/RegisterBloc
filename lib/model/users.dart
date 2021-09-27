class UserModel {
  String? userid;
  String? email;
  String? firstName;
  String? secondName;

  UserModel({this.userid, this.email, this.firstName, this.secondName});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      userid: map['userid'],
      email: map['email'],
      firstName: map['firstName'],
      secondName: map['secondName'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'userid': userid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
    };
  }
}