import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:final_project_edspert/constants/constants.dart';
import 'package:final_project_edspert/model/course_response_model.dart';

class CourseRemoteDatasource {
  Future<CourseResponse> getCourses() async {
    try {
      final url = '${LearningConstants.baseUrl}${LearningConstants.coursepath}';

      final result = await Dio().get(
        url,
        options: Options(
          headers: {'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'},
        ),
      );

      final courseResponse = CourseResponse.fromJson(result.data);

      return courseResponse;
    } catch (e, stacktrace) {
      log(e.toString(), stackTrace: stacktrace);
      rethrow;
    }
  }
}
