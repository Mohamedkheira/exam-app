import 'package:bloc/bloc.dart';
import 'package:exam_app/app/config/base_response/base_response.dart';
import 'package:exam_app/app/config/base_state/base_state.dart';
import 'package:exam_app/app/config/base_state/login_base_state.dart';
import 'package:exam_app/app/config/shared_preferences_module/shared_preferences_module.dart';
import 'package:exam_app/app/core/constants/cache_constants.dart';
import 'package:exam_app/app/feature/auth/data/models/request/auth_login_request_dto.dart';
import 'package:exam_app/app/feature/auth/domain/model/login_entity.dart';
import 'package:exam_app/app/feature/auth/domain/usecase/auth_login_usecase.dart';
import 'package:exam_app/app/feature/auth/presentation/viewmodel/cubit_login/login_events.dart';
import 'package:exam_app/app/feature/auth/presentation/viewmodel/cubit_login/login_state.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final DoLoginUsecase loginUsecase;
  final CacheHelper _cacheHelper;
  LoginCubit(this.loginUsecase, this._cacheHelper)
    : super(
        LoginState(
          loginStates: Resource<LoginEntity>(status: Status.initial),
          rememberMe: false,
        ),
      );

  final formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void toggleRememberMe(bool value) {
    emit(state.copyWith(rememberMe: value));
  }

  void onEvent(LoginEvent event) {
    if (event is Login) {
      _login(event.rememberMe);
    }
  }

  Future<void> _login(bool rememberMe) async {
    emit(
      state.copyWith(
        loginStates: Resource<LoginEntity>(status: Status.loading),
      ),
    );
    final response = await loginUsecase.dologinUseacase(
      AuthLoginRequestDto(
        email: emailController.text.trim(),
        password: passwordController.text,
      ),
    );

    response.when(
      success: (data) async {
        emit(
          state.copyWith(
            loginStates: Resource<LoginEntity>(
              status: Status.success,
              data: data,
            ),
          ),
        );
        if (rememberMe) {
          final result = await _cacheHelper.saveData(
            key: CacheConstants.token,
            value: data.accessToken ?? "",
          );
        } else {
          await _cacheHelper.remove(CacheConstants.token);
        }
      },
      failure: (errorMessage) {
        emit(
          state.copyWith(
            loginStates: Resource<LoginEntity>(
              status: Status.error,
              error: errorMessage.apiErrorModel.message,
            ),
          ),
        );
      },
    );
  }
}
