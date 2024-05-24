import 'package:json_annotation/json_annotation.dart';
import 'package:school_app/l10n/l10n.dart';

enum TeacherRole {
  @JsonValue(0)
  professor,
  @JsonValue(1)
  lecturer;

  int get value => switch (this) {
        TeacherRole.professor => 0,
        TeacherRole.lecturer => 1,
      };

  @override
  String toString() {
    switch (this) {
      case TeacherRole.professor:
        // return L10n.current.professor;
        return "Professor";
      case TeacherRole.lecturer:
        // return L10n.current.lecturer;
        return "Lecturer";
    }
  }
}
