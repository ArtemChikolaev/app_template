part of 'home_page_bloc.dart';

/// Sentinel to allow [copyWith] to set nullable fields to null.
const Object _undefined = Object();

class HomePageState extends Equatable {
  const HomePageState({
    required this.isLoading,
    this.title,
    this.description,
    this.errorMessage,
  });

  const HomePageState.initial()
    : isLoading = false,
      title = null,
      description = null,
      errorMessage = null;

  final bool isLoading;
  final String? title;
  final String? description;
  final String? errorMessage;

  HomePageState copyWith({
    bool? isLoading,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? errorMessage = _undefined,
  }) {
    return HomePageState(
      isLoading: isLoading ?? this.isLoading,
      title: title == _undefined ? this.title : title as String?,
      description: description == _undefined
          ? this.description
          : description as String?,
      errorMessage: errorMessage == _undefined
          ? this.errorMessage
          : errorMessage as String?,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    isLoading,
    title,
    description,
    errorMessage,
  ];
}
