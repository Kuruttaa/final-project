import 'package:final_project_edspert/model/course_response_model.dart';
import 'package:flutter/material.dart';

class CourseListWidget extends StatelessWidget {
  final List<CourseData> courseList;

  const CourseListWidget({super.key, required this.courseList});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 3,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const SizedBox(height: 15),
      itemBuilder: (context, index) {
        final course = courseList[index];

        return Container(
            height: 90,
            padding: const EdgeInsets.symmetric(
              vertical: 22,
              horizontal: 18,
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(
                255,
                179,
                180,
                178,
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(
                      255,
                      179,
                      180,
                      178,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.network(
                    course.urlCover ?? '',
                    width: 28,
                    height: 28,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 28,
                      height: 28,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course.majorName ?? 'No Course Name',
                      ),
                      Text(
                        '${course.jumlahDone} / ${course.jumlahMateri} Paket Latihan Soal',
                      ),
                      const SizedBox(height: 2),
                      const LinearProgressIndicator(
                        value: 0.5,
                      ),
                    ],
                  ),
                ),
              ],
            ));
      },
    );
  }
}
