part of 'feedback_cubit.dart';

class FeedbackState extends Equatable {
  final RequestStatus? onSendFeedback;

  final String? msgSendFeedback;

  final String? selectQuestion;

  const FeedbackState({
    this.onSendFeedback,
    this.msgSendFeedback,
    this.selectQuestion,
  });

  FeedbackState copyWith({
    RequestStatus? onSendFeedback,
    String? msgSendFeedback,
    String? selectQuestion,
  }) {
    return FeedbackState(
      onSendFeedback: onSendFeedback ?? this.onSendFeedback,
      msgSendFeedback: msgSendFeedback ?? this.msgSendFeedback,
      selectQuestion: selectQuestion ?? this.selectQuestion,
    );
  }

  @override
  List<Object?> get props => [
        onSendFeedback,
        msgSendFeedback,
        selectQuestion,
      ];
}
