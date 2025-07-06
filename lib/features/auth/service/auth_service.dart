import '../model/user_model.dart';

class AuthService {
  Future<UserModel> signIn(String username, String password) async {
    await Future.delayed(const Duration(seconds: 2));

    if (username == 'test' && password == '1234') {
      return UserModel(
        id: '1',
        username: 'test',
        token: 'dummy_token_abc123',
      );
    } else {
      throw Exception('Invalid username or password');
    }
  }
}
