enum RequestState {
  loading,
  done,
  error,
  initial;

  bool get isLoading => this == RequestState.loading;

  bool get isDone => this == RequestState.done;

  bool get isError => this == RequestState.error;

  bool get isInitial => this == RequestState.initial;
}

enum ErrorType { network, server, backEndValidation, emptyData, unknown, none, unAuth }

enum VerifyType {
  login,
  register;

  bool get isLogin => this == VerifyType.login;

  bool get isRegister => this == VerifyType.register;
}

enum ThemeType { dark, light }
