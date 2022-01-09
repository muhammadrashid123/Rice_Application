class UserModel {
  String uid;
  String email;
  String password;
  String firstName;
  String lastName;

  UserModel({this.uid, this.email,this.password, this.firstName, this.lastName});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      password: map['password'],
      firstName: map['firstName'],
      lastName: map['lastName'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {

      'uid': uid,
      'email': email,
      'password':password,
      'firstName': firstName,
      'lastName': lastName,
    };
  }
}