import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scmia_eprom/Cubits/Load%20Questionairre%20Cubit/load_questionnaire_cubit.dart';
import 'package:scmia_eprom/Cubits/User%20Questionnaire%20Cubit/submit_user_questionnaire_cubit.dart';
import 'package:scmia_eprom/Utils/error_snackbar.dart';
import 'package:scmia_eprom/Utils/questionairreParser.dart';
import 'package:scmia_eprom/Widgets/question_card.dart';
import 'package:scmia_eprom/constants.dart';

class PatientQuestionnaireScreen extends StatefulWidget {
  PatientQuestionnaireScreen(
      {super.key, required this.questions, required this.loginPageContext});

  Map<String, List<String>> questions;
  BuildContext loginPageContext;

  @override
  State<PatientQuestionnaireScreen> createState() =>
      _PatientQuestionnaireScreenState();
}

class _PatientQuestionnaireScreenState
    extends State<PatientQuestionnaireScreen> {
  @override
  void initState() {
    super.initState();
    context.read<LoadQuestionnaireCubit>().loadQuestionnaire();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void submitForm(List<dynamic> selectedOptions) {
    if (selectedOptions.contains(-1)) {
      showSnackbarMessage(
          context, false, "Please Select options to all questions");
      return;
    }
    context
        .read<SubmitUserQuestionnaireCubit>()
        .submitQuestionnaire(selectedOptions);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background_gray,
        // app bar -------------------------
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: customAppBar(context),
        ),
        // body -------------------------
        body: BlocConsumer<LoadQuestionnaireCubit, LoadQuestionnaireState>(
          listener: (context, state) {
            if (state is LoadQuestionnaireErrorState) {
              Navigator.pop(context);
              showSnackbarMessage(
                  widget.loginPageContext, false, state.message);
            }
          },
          builder: (context, state) {
            if (state is LoadQuestionnaireProcessingState) {
              return Center(
                  child: CircularProgressIndicator(
                color: theme_dark,
              ));
            } else if (state is LoadQuestionnaireErrorState) {
              return SizedBox();
            } else {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Padding(
                    //   padding: EdgeInsets.only(left: 15),
                    //   child: Text(
                    //     "Sample ePROM",
                    //     style: title_style,
                    //   ),
                    // ),
                    questionList(widget.questions)
                  ]);
            }
          },
        ),
      ),
    );
  }

  Widget questionList(Map<String, List<String>> questions) {
    return Expanded(
      child: ListView.builder(
        // controller: chatScrollController,
        // physics: const BouncingScrollPhysics(),
        itemCount: questionairre.length,
        itemBuilder: (BuildContext context, int index) {
          var question = questionairre[index];
          // return questionItem(question.key, question.value, index);
          return Column(
            children: [
              index == 0 ? SizedBox(height: 21) : SizedBox(),
              QuestionCard(
                  questionIndex: index,
                  question: question["questions"].toString(),
                  options: parseQuestions([
                    question['option_a'],
                    question['option_b'],
                    question['option_c'],
                    question['option_d'],
                    question['option_e']
                  ]),
                  selectedOption: selectedOptions[index],
                  onOptionSelected: (value) {
                    setState(() {
                      selectedOptions[index] = value;
                    });
                  }),
              index == questionairre.length - 1
                  ? submitFormButton()
                  : SizedBox()
            ],
          );
        },
      ),
    );
  }

  Widget submitFormButton() {
    return Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 21),
        child: Container(
            height: 60,
            child: FloatingActionButton.extended(
              backgroundColor: theme_dark,
              onPressed: () {
                submitForm(selectedOptions);
              },
              label: BlocConsumer<SubmitUserQuestionnaireCubit,
                  SubmitUserQuestionnaireState>(
                listener: (context, state) {
                  if (state is SubmitUserQuestionnaireErrorState) {
                    showSnackbarMessage(context, false, state.message);
                  } else if (state is SubmitUserQuestionnaireSuccessState) {
                    showSnackbarMessage(
                        widget.loginPageContext, true, state.message);
                    Navigator.pop(context);
                  }
                },
                builder: (context, state) {
                  if (state is SubmitUserQuestionnaireProcessingState) {
                    return CircularProgressIndicator(
                      color: border_gray,
                    );
                  } else {
                    return Text("Submit Form");
                  }
                },
              ),
            )));
  }

  Widget customAppBar(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      // automaticallyImplyLeading: false,
      foregroundColor: theme_dark,
      actions: [
        // Padding(
        //     padding: const EdgeInsets.only(right: 40),
        //     child: SizedBox(
        //         child: IconButton(
        //             iconSize: 24,
        //             splashRadius: 24,
        //             icon: Icon(Icons.remove, color: theme_dark, weight: 2),
        // onPressed: () => Navigator.pop(context))))
      ],
      shape: Border(bottom: BorderSide(color: border_gray, width: 1)),
      toolbarHeight: 100,
      backgroundColor: background_white,
      shadowColor: Colors.black,
      centerTitle: true,
      title: Text(
        "Sample ePROM",
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(fontSize: 20, color: theme_dark),
      ),
    );
  }
}
