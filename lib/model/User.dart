// ignore_for_file: file_names

class User {
  int id;
  String? role;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  dynamic birth;
  String? address;
  String? matricule;
  int? coins;
  String? rating;
  int? ratingValue;
  String? gender;
  String? apiToken;
  dynamic avatar;

  User({
    required this.id,
    this.role,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.birth,
    this.address,
    this.matricule,
    this.coins,
    this.rating,
    this.ratingValue,
    this.gender,
    this.apiToken,
    this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        role: json["role"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        phone: json["phone"],
        birth: json["birth"],
        address: json["address"],
        matricule: json["matricule"],
        coins: json["coins"],
        rating: json["rating"],
        ratingValue: json['rating_value'],
        gender: json["gender"],
        apiToken: json["api_token"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "role": role,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone": phone,
        "birth": birth,
        "address": address,
        "matricule": matricule,
        "coins": coins,
        "rating": rating,
        "ratingValue": ratingValue,
        "gender": gender,
        "api_token": apiToken,
        "avatar": avatar,
      };
}
