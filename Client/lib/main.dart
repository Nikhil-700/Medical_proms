import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scmia_eprom/Cubits/Load%20Questionairre%20Cubit/load_questionnaire_cubit.dart';
import 'package:scmia_eprom/Cubits/User%20Questionnaire%20Cubit/submit_user_questionnaire_cubit.dart';
import 'package:scmia_eprom/app_navigator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SCMIA',
        home: MultiBlocProvider(providers: [
          BlocProvider(
            create: (context) => LoadQuestionnaireCubit(),
          ),
          BlocProvider(
            create: (context) => SubmitUserQuestionnaireCubit(),
          ),
        ], child: AppNavigator()));
  }
}
