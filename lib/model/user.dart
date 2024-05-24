import 'package:school_app/enum/user_status.dart';

abstract class User {
  final int id;
  final UserStatus status;
  final String email;
  final String name;

  User({
    required this.id,
    required this.status,
    required this.email,
    required this.name,
  });
}
