import 'package:hooks_riverpod/hooks_riverpod.dart';

// ViewModel provider for ConnectPage
final connectViewModelProvider = Provider<ConnectViewModel>((ref) {
  return ConnectViewModel();
});

class ConnectViewModel {
  Future<void> signInWithFacebook() async {
    // Placeholder for Facebook login logic
  }

  Future<void> signInWithGoogle() async {
    // Placeholder for Google login logic
  }

  Future<void> signInWithApple() async {
    // Placeholder for Apple login logic
  }
}
