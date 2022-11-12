import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:students_list/screens/splash_screen.dart/splash_screen.dart';
import 'bloc/add%20student/add_student_bloc.dart';
import 'bloc/search/search_bloc.dart';
import 'bloc/update%20student/update_student_bloc.dart';
import 'models/student_model.dart';

import 'screens/home%20screen/screen_home.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }
  await Hive.openBox<StudentModel>('student_db');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => AddStudentBloc()),
        BlocProvider(create: (ctx) => UpdateStudentBloc()),
        BlocProvider(create: (ctx) => SearchBloc()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
