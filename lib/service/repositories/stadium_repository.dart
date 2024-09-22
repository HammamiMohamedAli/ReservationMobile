import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yallaplay_mobile/model/stadium.dart';
import 'package:yallaplay_mobile/service/api_base_helper.dart';
import '../endpoints.dart' as end_points;

final stadiumsReposProvider = Provider((ref) => StadiumRepos());

class StadiumRepos {
  Future<StadiumResponse> getStadiumList() async {
    ApiBaseHelper helper = ApiBaseHelper();
    final response = await helper.get(end_points.GET_STADIUM,
        showLoader: true, needsAuth: true);

    if (response.statusCode == 200) {
      StadiumResponse stadiumResponse =  StadiumResponse.fromJson(json.decode(response.body));
      return stadiumResponse;
    } else {
      return StadiumResponse(success: false, data: [], message: "");
    }
  }
}
