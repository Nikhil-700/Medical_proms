import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:scmia_eprom/Data/api_service.dart';

part 'submit_user_questionnaire_state.dart';

class SubmitUserQuestionnaireCubit extends Cubit<SubmitUserQuestionnaireState> {
  SubmitUserQuestionnaireCubit()
      : super(const SubmitUserQuestionnaireInitialState());
  bool _canTriggerActions = true;

  /*
      function that submits filled questionnaire
  */

  Future<void> submitQuestionnaire(List<dynamic> selectedOptions) async {
    ApiService api = ApiService();
    if (!_canTriggerActions) return;
    _canTriggerActions = false;

    emit(const SubmitUserQuestionnaireProcessingState());

    try {
      // make the api call
      Response<dynamic> res = await api.sendPrompt(selectedOptions);
      bool state = true;
      // await Future.delayed(Duration(seconds: 2, milliseconds: 100))
      //     .then((value) => {state = true}); //Random().nextBool()});
      // api.fetchUserConversations(userID);

      if (state == false ||
          res.data["Status"] == 400 ||
          res.statusCode == 400) {
        throw Exception("Test exception");
      }
      // chatStorage.populateChats();
      print("Submitted Questionnaire");

      // emit success state once promise is resolved
      emit(const SubmitUserQuestionnaireSuccessState(
          "Questionnaire has been submitted successfully"));

      // emit initial state to reset state
      emit(const SubmitUserQuestionnaireInitialState());
    } catch (e) {
      //
      // emit error state if promise was rejected
      emit(const SubmitUserQuestionnaireErrorState(
          "An error has occured, please try again later"));
      emit(const SubmitUserQuestionnaireInitialState());
    }

    _canTriggerActions = true;
  }
}
