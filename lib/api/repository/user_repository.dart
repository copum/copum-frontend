import 'package:copum/api/provider/user_api.dart';

class UserRepository {
  final UserApiClient apiClient;

  UserRepository({required this.apiClient});

  dynamic fetchBoard() {
    return apiClient.fetchUserData();
  }
}
