class ActivityResponse {
  final bool success;
  final UserData data;
  final String message;

  ActivityResponse({
    required this.success,
    required this.data,
    required this.message,
  });

  factory ActivityResponse.fromJson(Map<String, dynamic> json) {
    return ActivityResponse(
      success: json['success'] ?? false,
      data: UserData.fromJson(json['data'] ?? {}),
      message: json['message'] ?? "",
    );
  }
}

class UserData {
  final int id;
  final String role;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String address;
  final dynamic birth; 
  final dynamic state; 
  final int coins;
  final String gender;
  final String avatar;
  final ActivityData activity;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserData({
    required this.id,
    required this.role,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
     this.birth,
    required this.address,
     this.state,
    required this.coins,
    required this.gender,
    required this.avatar,
    required this.activity,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'] ?? 0,
      role: json['role'] ?? "",
      firstName: json['first_name'] ?? "",
      lastName: json['last_name'] ?? "",
      email: json['email'] ?? "",
      phone: json['phone'] ?? "",
      birth: json['birth'],
      address: json['address'] ?? "",
      state: json['state'],
      coins: json['coins'] ?? 0,
      gender: json['gender'] ?? "",
      avatar: json['avatar'] ?? "",
      activity: ActivityData.fromJson(json['activity'] ?? {}),
      createdAt: DateTime.parse(json['created_at'] ?? ""),
      updatedAt: DateTime.parse(json['updated_at'] ?? ""),
    );
  }
}

class ActivityData {
  final int id;
  final String matricule;
  final String rating;
  final String ?ratingValue;
  final String activity;
  final DateTime createdAt;
  final DateTime updatedAt;

  ActivityData({
    required this.id,
    required this.matricule,
    required this.rating,
    required this.ratingValue,
    required this.activity,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ActivityData.fromJson(Map<String, dynamic> json) {
    return ActivityData(
      id: json['id'] ?? 0,
      matricule: json['matricule'] ?? "",
      rating: json['rating'] ?? "Unrated",
      ratingValue: json['rating_value']  ?? "",
      activity: json['activity'] ?? "",
      createdAt: DateTime.parse(json['created_at'] ?? ""),
      updatedAt: DateTime.parse(json['updated_at'] ?? ""),
    );
  }
}
