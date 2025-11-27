// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../feature/auth/api/api_manger/auth_client.dart' as _i788;
import '../../feature/auth/api/datasource/auth_datasource_impl.dart' as _i51;
import '../../feature/auth/data/datasources/auth_datasource_contract.dart'
    as _i303;
import '../../feature/auth/data/repos/auth_repo_impl.dart' as _i703;
import '../../feature/auth/domain/repos/auth_repo_contract.dart' as _i1028;
import '../../feature/auth/domain/usecase/change_password_usecase.dart'
    as _i291;
import '../../feature/auth/domain/usecase/send_forget_password_email_usecase.dart'
    as _i15;
import '../../feature/auth/domain/usecase/verify_reset_code_usecase.dart'
    as _i822;
import '../../feature/auth/presentation/viewmodel/change_password_viewmodel.dart'
    as _i311;
import '../../feature/auth/presentation/viewmodel/forget_password_view_model.dart'
    as _i16;
import '../../feature/auth/presentation/viewmodel/otp_viewmodel.dart' as _i43;
import 'network_module.dart' as _i567;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio());
    gh.lazySingleton<_i788.AuthApiClient>(
      () => networkModule.authApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i303.AuthDataSourceContract>(
      () => _i51.AuthDataSourceImpl(gh<_i788.AuthApiClient>()),
    );
    gh.factory<_i1028.AuthRepoContract>(
      () => _i703.AuthRepoImpl(gh<_i303.AuthDataSourceContract>()),
    );
    gh.factory<_i291.ChangePasswordUsecase>(
      () => _i291.ChangePasswordUsecase(gh<_i1028.AuthRepoContract>()),
    );
    gh.factory<_i15.SendForgetPasswordEmailUseCase>(
      () => _i15.SendForgetPasswordEmailUseCase(gh<_i1028.AuthRepoContract>()),
    );
    gh.factory<_i822.VerifyResetCodeUsecase>(
      () => _i822.VerifyResetCodeUsecase(gh<_i1028.AuthRepoContract>()),
    );
    gh.factory<_i16.ForgetPasswordViewmodel>(
      () => _i16.ForgetPasswordViewmodel(
        gh<_i15.SendForgetPasswordEmailUseCase>(),
      ),
    );
    gh.factory<_i43.OtpViewmodel>(
      () => _i43.OtpViewmodel(gh<_i822.VerifyResetCodeUsecase>()),
    );
    gh.factory<_i311.ChangePasswordViewmodel>(
      () => _i311.ChangePasswordViewmodel(gh<_i291.ChangePasswordUsecase>()),
    );
    return this;
  }
}

class _$NetworkModule extends _i567.NetworkModule {}
