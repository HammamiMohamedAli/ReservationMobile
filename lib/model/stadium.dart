class StadiumResponse {
  bool success;
  List<Stadium> data;
  String? message;

  StadiumResponse(
      {required this.success, required this.data, required this.message});

  factory StadiumResponse.fromJson(Map<String, dynamic> json) {
    return StadiumResponse(
      success: json['success'] ?? false,
      data: (json['data'] as List<dynamic>?)
              ?.map((item) => Stadium.fromJson(item))
              .toList() ??
          [],
      message: json['message'] ?? '',
    );
  }
}

class Stadium {
  int id;
  String type;
  String name;
  String address;
  String city;
  String state;
  double price;
  int field;
  String email;
  String mobilePhone;
  String localPhone;
  bool isIndoor;
  double longitude;
  double latitude;
  List<Workday> workdays;
  List<Picture> pictures;
  String createdAt;
  String updatedAt;

  Stadium({
    required this.id,
    required this.type,
    required this.name,
    required this.address,
    required this.city,
    required this.state,
    required this.price,
    required this.field,
    required this.email,
    required this.mobilePhone,
    required this.localPhone,
    required this.isIndoor,
    required this.longitude,
    required this.latitude,
    required this.workdays,
    required this.pictures,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Stadium.fromJson(Map<String, dynamic> json) {
    return Stadium(
      id: json['id'],
      type: json['type'],
      name: json['name'],
      address: json['address'],
      city: json['city'],
      state: json['state'],
      price: json['price'].toDouble(),
      field: json['field'],
      email: json['email'],
      mobilePhone: json['mobile_phone'],
      localPhone: json['local_phone'],
      isIndoor: json['is_indoor'],
      longitude: json['longitude'].toDouble(),
      latitude: json['latitude'].toDouble(),
      workdays: (json['workdays'] as List)
          .map((item) => Workday.fromJson(item))
          .toList(),
      pictures: (json['pictures'] as List)
          .map((item) => Picture.fromJson(item))
          .toList(),
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class Workday {
  int id;
  String day;
  String startAt;
  String endAt;

  Workday(
      {required this.id,
      required this.day,
      required this.startAt,
      required this.endAt});

  factory Workday.fromJson(Map<String, dynamic> json) {
    return Workday(
      id: json['id'],
      day: json['day'],
      startAt: json['start_at'],
      endAt: json['end_at'],
    );
  }
}

class Picture {
  int id;
  String picture;
  String createdAt;
  String updatedAt;

  Picture(
      {required this.id,
      required this.picture,
      required this.createdAt,
      required this.updatedAt});

  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(
      id: json['id'],
      picture: json['picture'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
