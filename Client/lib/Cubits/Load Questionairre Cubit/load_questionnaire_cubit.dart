import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:scmia_eprom/Cubits/User%20Questionnaire%20Cubit/submit_user_questionnaire_cubit.dart';
import 'package:scmia_eprom/Data/api_service.dart';
import 'package:scmia_eprom/constants.dart';

part 'load_questionnaire_state.dart';

class LoadQuestionnaireCubit extends Cubit<LoadQuestionnaireState> {
  LoadQuestionnaireCubit() : super(const LoadQuestionnaireInitialState());
  ApiService api = ApiService();
  bool _canTriggerActions = true;

  /*
      function that loads questionnaire for that patient
  */

  Future<void> loadQuestionnaire() async {
    if (!_canTriggerActions) return;
    _canTriggerActions = false;

    emit(const LoadQuestionnaireProcessingState());

    try {
      // make the api call
      bool state = true;
      Response<dynamic> res = await api.fetchQuestionairre();
      questionairre = res.data["message"];
      // await Future.delayed(Duration(seconds: 2, milliseconds: 100))
      //     .then((value) => {state = true}); //Random().nextBool()});
      // api.fetchUserConversations(userID);

      if (state == false ||
          res.data["Status"] == 400 ||
          res.statusCode == 400) {
        throw Exception("Test exception");
      }
      // chatStorage.populateChats();
      print("Loaded Questionnaire");
      selectedOptions = List.filled(questionairre.length, -1);

      // emit success state once promise is resolved
      emit(const LoadQuestionnaireSuccessState());

      // emit initial state to reset state
      emit(const LoadQuestionnaireInitialState());
    } catch (e) {
      //
      // emit error state if promise was rejected
      emit(const LoadQuestionnaireErrorState(
          "There was an error while loading your form. Please try again later"));
    }

    _canTriggerActions = true;
  }
}
