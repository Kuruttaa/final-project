import 'package:final_project_edspert/bloc/banner_bloc/banner_bloc.dart';
import 'package:final_project_edspert/datasource/banner_remote_datasource.dart';
import 'package:final_project_edspert/datasource/course_remote_datasource.dart';
import 'package:final_project_edspert/model/course_response_model.dart';
import 'package:final_project_edspert/widget/banner_list_widget.dart';
import 'package:final_project_edspert/widget/course_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final courseRemoteDatasource = CourseRemoteDatasource();

  CourseResponse? courseResponse;

  @override
  void initState() {
    getCourse();
    super.initState();
  }

  void getCourse() async {
    courseResponse = await courseRemoteDatasource.getCourses();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BannerBloc(
        bannerRemoteDatasource: BannerRemoteDatasource(),
      )..add(GetBannerListView()),
      child: Scaffold(
        backgroundColor: Color(0xFFB7B8B6),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hi Kurutta',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Selamat Datang',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ]),
                      CircleAvatar(
                        radius: 17.5,
                        backgroundImage: NetworkImage(
                            'https://media.licdn.com/dms/image/C5103AQEuPyfzbtwWMA/profile-displayphoto-shrink_400_400/0/1554450424709?e=2147483647&v=beta&t=PnYPYNlQe6OM2zJqt6u0i7KgS9aBmaYxyQr9Rqjm5XY'),
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    height: 147,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFF34675C),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 26,
                              left: 10,
                            ),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: const Text(
                                'Mau kerjain\nlatihan soal\napa hari ini?',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  color: Color(0xFFB7B8B6),
                                ),
                              ),
                            ),
                          ),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: Image.asset('assets/banner.png'))
                        ]),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Pilihan Pelajaran',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('Lihat Semua'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  courseResponse == null
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : CourseListWidget(
                          courseList: courseResponse?.data ?? []),
                  const SizedBox(height: 15),
                  const Text(
                    'Terbaru',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  BlocBuilder<BannerBloc, BannerState>(
                    builder: (context, state) {
                      if (state is BannerFailed) {
                        return Center(child: Text(state.message ?? ''));
                      } else if (state is BannerSuccess) {
                        return BannerListWidget(
                          bannerList: state.bannerResponse.data ?? [],
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
