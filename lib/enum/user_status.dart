import 'package:json_annotation/json_annotation.dart';

enum UserStatus {
  @JsonValue(0)
  inActivate,
  @JsonValue(1)
  activate;

  int get value => switch (this) {
        UserStatus.inActivate => 0,
        UserStatus.activate => 1,
      };
}
