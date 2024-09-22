class Player {
  int id;
  String role;
  String firstName;
  String lastName;
  String email;
  String phone;
  dynamic birth;
  String ?address;
  dynamic state;
  int? coins;
  String matricule;
  String rating;
  int ratingValue;
  String gender;
  String avatar;

  Player({
    required this.id,
    required this.role,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    this.birth,
     this.address,
    this.state,
     this.coins,
    required this.matricule,
    required this.rating,
    required this.ratingValue,
    required this.gender,
    required this.avatar,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['id'],
      role: json['role'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      phone: json['phone'],
      birth: json['birth'],
      address: json['address'],
      state: json['state'],
      coins: json['coins'],
      matricule: json['matricule'],
      rating: json['rating'],
      ratingValue: json['rating_value'],
      gender: json['gender'],
      avatar: json['avatar'],
    );
  }
}
