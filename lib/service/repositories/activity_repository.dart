import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yallaplay_mobile/model/Activity.dart';
import 'package:yallaplay_mobile/service/api_base_helper.dart';
import '../endpoints.dart' as end_points;

final activityReposProvider = Provider((ref) => ActivityRepos());

class ActivityRepos {
  Future<ActivityResponse?> getActivity() async {
    ApiBaseHelper helper = ApiBaseHelper();

    final response = await helper.get(end_points.GetACTIVITY,
        showLoader: true, needsAuth: true);

    if (response.statusCode == 200) {
      ActivityResponse activity =
          ActivityResponse.fromJson(json.decode(response.body));

      return activity;
    } else {
      return null;
    }
  }

  Future<bool> ChooseActivity(body) async {
    ApiBaseHelper helper = ApiBaseHelper();
    final response = await helper.post(end_points.POST_ACTIVITY, body,
        needsAuth: true, showLoader: true);
    Map<String, dynamic> result = json.decode(response.body.toString());
    bool success = result["success"];
    if (success == true) {
      return true;
    } else {
      return false;
    }
  }
}
