

class User{
  final String userId;
  final String fullName;
  final String username;
  final String password;
  final String email;
  final String position;
  final String createdAt;
  final String phoneNo;
  final String address;



  User({this.fullName, this.username, this.email, this.position,this.createdAt, this.address, this.phoneNo, this.userId, this.password });

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      fullName: json['fullName'],
      username: json['username'],
      email: json['email'],
      position: json['position'],
      createdAt: json['createdAt'],
      phoneNo: json['phoneNo'],
      address: json['address'],
      userId: json['userId'],
      password: json['password']
    );
  }

}