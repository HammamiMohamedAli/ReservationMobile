import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yallaplay_mobile/model/Event.dart';
import 'package:yallaplay_mobile/service/api_base_helper.dart';
import '../endpoints.dart' as end_points;

final eventReposProvider = Provider((ref) => EventRepos());

class EventRepos {
  Future<EventResponse?> getEvents() async {
    ApiBaseHelper helper = ApiBaseHelper();

    final response = await helper.get(end_points.GET_EVENT,  
        showLoader: true, needsAuth: true);

    if (response.statusCode == 200) {
      EventResponse events =
          EventResponse.fromJson(json.decode(response.body));

      return events;
    } else {
      return null;
    }
  }


}
