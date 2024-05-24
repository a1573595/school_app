abstract class UserApi {
  Future<void> postOauth({required String email, required String password});
}

class UserApiImp implements UserApi {
  @override
  Future<void> postOauth({required String email, required String password}) {
    // TODO: implement postOauth
    throw UnimplementedError();
  }
}
