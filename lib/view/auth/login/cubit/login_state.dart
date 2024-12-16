import 'package:customer/core/utils/enums.dart';

class LoginState {
  final RequestState requestState;
  final RequestState request2State;
  final String msg;
  final ErrorType errorType;

  LoginState({this.requestState = RequestState.initial, this.msg = '', this.errorType = ErrorType.none, this.request2State = RequestState.initial});

  LoginState copyWith({
    RequestState? requestState,
    RequestState? request2State,
    String? msg,
    ErrorType? errorType,
  }) =>
      LoginState(
        requestState: requestState ?? this.requestState,
        request2State: request2State ?? this.request2State,
        msg: msg ?? this.msg,
        errorType: errorType ?? this.errorType,
      );
}
