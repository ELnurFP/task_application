import 'package:equatable/equatable.dart';

abstract class LanguagesState extends Equatable {
  const LanguagesState();

  @override
  List<Object> get props => [];
}

class LanguageInitial extends LanguagesState {}

class languageLoading extends LanguagesState {
  const languageLoading();
}

class LanguageChanged extends LanguagesState {
  const LanguageChanged();
}

class LanguageError extends LanguagesState {
  final String message;
  const LanguageError(this.message);

  @override
  List<Object> get props => [message];
}
