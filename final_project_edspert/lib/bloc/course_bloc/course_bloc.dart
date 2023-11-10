import 'package:bloc/bloc.dart';
import 'package:final_project_edspert/model/course_response_model.dart';
import 'package:meta/meta.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc() : super(CourseInitial()) {
    on<CourseEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
