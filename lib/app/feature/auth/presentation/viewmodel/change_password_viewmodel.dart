import 'package:exam_app/app/config/base_response/api_result.dart';
import 'package:exam_app/app/config/base_state/base_state.dart';
import 'package:exam_app/app/feature/auth/data/models/reset_code_response_model.dart';
import 'package:exam_app/app/feature/auth/domain/usecase/change_password_usecase.dart';
import 'package:exam_app/app/feature/auth/presentation/states/change_password_state.dart';
import 'package:exam_app/app/feature/auth/presentation/viewmodel/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/change_password_request_model.dart';

@injectable
class ChangePasswordViewmodel extends Cubit<ChangePasswordState> {
  final ChangePasswordUsecase _changePasswordUsecase;

  ChangePasswordViewmodel(this._changePasswordUsecase)
    : super(ChangePasswordState.initial());
  void doIntent(AuthEvent event) {
    switch (event) {
      case ChangePassword():
        _changePasswordEmail(event.data);
    }
  }

  void _changePasswordEmail(ChangePasswordRequestModel data) async {
    emit(state.copyWith(changePassword: Resource.loading()));

    final response = await _changePasswordUsecase(data: data);
    switch (response) {
      case SuccessApiResult<ForgetPasswordResponseModel>():
        emit(state.copyWith(changePassword: Resource.success(response.data)));
      case ErrorApiResult<ForgetPasswordResponseModel>():
        emit(
          state.copyWith(
            changePassword: Resource.error(response.error.toString()),
          ),
        );
    }
  }
}
