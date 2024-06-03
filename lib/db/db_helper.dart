import 'package:school_app/db/course_dao.dart';
import 'package:school_app/db/user_dao.dart';
import 'package:sqflite/sqflite.dart';

const String dbPath = 'my_db.db';
const int dbVersion = 1;

const String tableTeacher = "Teacher";
const String columnTeacherId = "teacher_id";
const String columnTeacherStatus = "teacher_status";
const String columnTeacherEmail = "teacher_email";
const String columnTeacherPassword = "teacher_password";
const String columnTeacherName = "teacher_name";
const String columnTeacherRole = "teacher_role";

const String tableStudent = "Student";
const String columnStudentId = "student_id";
const String columnStudentStatus = "student_status";
const String columnStudentEmail = "student_email";
const String columnStudentPassword = "student_password";
const String columnStudentName = "student_name";

const String tableCourse = "Course";
const String columnCourseId = "course_id";
const String columnCourseName = "course_name";
const String columnCourseStartAt = "course_start_at";
const String columnCourseEndAt = "course_end_at";
const String columnCourseTeacherId = "course_teacher_id";
const String columnCourseStudentIdList = "course_student_id_list";

class DbHelper {
  const DbHelper._();

  static late Database _database;

  static late final UserDaoImp _userDao;

  static UserDaoImp get userDao => _userDao;

  static late final CourseDaoImp _courseDao;

  static CourseDaoImp get courseDao => _courseDao;

  static Future<void> init() async {
    _database = await openDatabase(
      dbPath,
      version: dbVersion,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $tableTeacher(
            $columnTeacherId        INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnTeacherStatus    INTEGER NOT NULL DEFAULT 1,
            $columnTeacherRole      INTEGER NOT NULL,
            $columnTeacherEmail     TEXT    NOT NULL UNIQUE,
            $columnTeacherPassword  TEXT    NOT NULL,
            $columnTeacherName      TEXT    NOT NULL,
            CHECK(
              $columnTeacherStatus BETWEEN 0 AND 1
              AND
              $columnTeacherRole BETWEEN 0 AND 1
            )
          )
      ''');

        await db.execute('''
          CREATE TABLE $tableStudent(
            $columnStudentId        INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnStudentStatus    INTEGER NOT NULL DEFAULT 1,
            $columnStudentEmail     TEXT    NOT NULL UNIQUE,
            $columnStudentPassword  TEXT    NOT NULL,
            $columnStudentName      TEXT    NOT NULL,
            CHECK(
              $columnStudentStatus BETWEEN 0 AND 1
            )
          )
      ''');

        await db.execute('''
          CREATE TABLE $tableCourse(
            $columnCourseId             INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnCourseName           TEXT    NOT NULL,
            $columnCourseStartAt        INTEGER NOT NULL,
            $columnCourseEndAt          INTEGER NOT NULL,
            $columnCourseTeacherId      INTEGER    NOT NULL,
            $columnCourseStudentIdList  TEXT,
            CHECK(
              $columnCourseStartAt < $columnCourseEndAt
            )
            FOREIGN KEY($columnCourseTeacherId) REFERENCES $tableTeacher($columnTeacherId)
          )
      ''');
      },
    );

    _userDao = UserDaoImp(database: _database);
    _courseDao = CourseDaoImp(database: _database);
  }

  static Future<void> initForTest() async {
    await deleteDatabase(dbPath);

    await init();
  }

  static Future<void> deInit() => _database.close();
}
