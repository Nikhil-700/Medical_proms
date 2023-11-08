part of 'submit_user_questionnaire_cubit.dart';

@immutable
sealed class SubmitUserQuestionnaireState {
  const SubmitUserQuestionnaireState();
}

final class SubmitUserQuestionnaireInitialState
    extends SubmitUserQuestionnaireState {
  const SubmitUserQuestionnaireInitialState();
}

final class SubmitUserQuestionnaireProcessingState
    extends SubmitUserQuestionnaireState {
  const SubmitUserQuestionnaireProcessingState();
}

final class SubmitUserQuestionnaireSuccessState
    extends SubmitUserQuestionnaireState {
  final String message;
  const SubmitUserQuestionnaireSuccessState(this.message);
}

final class SubmitUserQuestionnaireErrorState
    extends SubmitUserQuestionnaireState {
  final String message;
  const SubmitUserQuestionnaireErrorState(this.message);
}
