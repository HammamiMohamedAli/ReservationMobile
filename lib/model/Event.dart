class EventResponse {
  bool success;
  List<EventData> data;
  String message;

  EventResponse({required this.success, required this.data, required this.message});

  factory EventResponse.fromJson(Map<String, dynamic> json) {
    return EventResponse(
      success: json['success'],
      data: (json['data'] as List).map((e) => EventData.fromJson(e)).toList(),
      message: json['message'],
    );
  }
}

class EventData {
  int id;
  String title;
  String content;
  String ?picture;

  EventData({required this.id, required this.title, required this.content, required this.picture});

  factory EventData.fromJson(Map<String, dynamic> json) {
    return EventData(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      picture: json['picture'],
    );
  }
}
