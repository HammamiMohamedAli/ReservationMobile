import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yallaplay_mobile/model/Activity.dart';
import 'package:yallaplay_mobile/model/User.dart';
import 'package:yallaplay_mobile/service/repositories/activity_repository.dart';
import 'package:yallaplay_mobile/service/repositories/user_info_repository.dart';

final activityViewModelProvider = Provider((ref) => QuestionResultModelView());
final userInfoViewModelProvider = Provider((ref) => QuestionResultModelView());

class QuestionResultModelView {
  Future<ActivityResponse?> fetchActivityInfo(WidgetRef ref) async {
    return await ref.read(activityReposProvider).getActivity();
  }

  Future<User?> fetchUserInfo(WidgetRef ref) async {
    return await ref.read(userReposProvider).me();
  }
}
