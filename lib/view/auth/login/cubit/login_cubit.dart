import 'package:customer/core/services/server_gate.dart';
import 'package:customer/core/utils/enums.dart';
import 'package:customer/core/widgets/flash_helper.dart';
import 'package:customer/view/auth/login/cubit/login_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  final phone = TextEditingController(text: kDebugMode ? '542318760' : '');
  final password = TextEditingController(text: kDebugMode ? '10203040' : '');

  Future<void> login() async {
    emit(state.copyWith(requestState: RequestState.loading));
    final result = await ServerGate.i.sendToServer(url: 'login', body: {
      // "UserName": MethodsHelpers.formatPhoneNumber(phone.text),
      // "Password": password.text,
    });
    if (result.success) {
      // result.data['data']['phone'] = MethodsHelpers.formatPhoneNumber(phone.text);
      // UserModel.i
      //   ..fromJson(result.data['data'])
      //   ..save();
      emit(state.copyWith(requestState: RequestState.done, msg: result.msg));
    } else {
      FlashHelper.showToast(result.msg);
      emit(state.copyWith(requestState: RequestState.error, msg: result.msg));
    }
  }
}