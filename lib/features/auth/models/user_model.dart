class LoginData {
  final bool status;
  final String message;
  final UserData? userData;

  LoginData({
    required this.status,
    required this.message,
    required this.userData,
  });

  factory LoginData.fromJson(Map<String, dynamic> data) {
    return LoginData(
      status: data['status'],
      message: data['message'],
      userData: data['data'] != null ? UserData.fromJson(data["data"]) : null,
    );
  }
}

class UserData {
  final String name;
  final dynamic id;
  final String email;
  final String phone;
  final String imageUrl;
  final String token;
  final int points;
  final int credit;

  UserData({
    required this.name,
    required this.id,
    required this.email,
    required this.phone,
    required this.imageUrl,
    required this.credit,
    required this.points,
    required this.token,
  });

  factory UserData.fromJson(Map<String, dynamic> data) {
    return UserData(
      name: data['name'],
      id: data['id'],
      email: data['email'],
      phone: data['phone'],
      imageUrl: data['imageUrl'] ?? "",
      credit: data['credit'],
      token: data['token'],
      points: data['points'],
    );
  }

  // toJson(UserData userModel) {
  //   return {
  //     "name": userModel.name,
  //     "email": userModel.email,
  //     "phone": userModel.phone,
  //     "imageUrl": userModel.imageUrl,
  //     "token": userModel.token,
  //     "points": userModel.points,
  //     "credit": userModel.credit,
  //   };
  // }
}
