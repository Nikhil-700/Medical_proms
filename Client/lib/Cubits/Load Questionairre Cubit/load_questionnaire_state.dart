part of 'load_questionnaire_cubit.dart';

@immutable
sealed class LoadQuestionnaireState {
  const LoadQuestionnaireState();
}

final class LoadQuestionnaireInitialState extends LoadQuestionnaireState {
  const LoadQuestionnaireInitialState();
}

final class LoadQuestionnaireProcessingState extends LoadQuestionnaireState {
  const LoadQuestionnaireProcessingState();
}

final class LoadQuestionnaireSuccessState extends LoadQuestionnaireState {
  const LoadQuestionnaireSuccessState();
}

final class LoadQuestionnaireErrorState extends LoadQuestionnaireState {
  final String message;
  const LoadQuestionnaireErrorState(this.message);
}
