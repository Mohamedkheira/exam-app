// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../feature/auth/api/api_manger/auth_client.dart' as _i535;
import '../../feature/auth/api/datasource/forget_password_datasource_impl.dart'
    as _i979;
import '../../feature/auth/data/datasources/forget_password_datasource_contract.dart'
    as _i122;
import '../../feature/auth/data/repos/forget_password_repo_impl.dart' as _i270;
import '../../feature/auth/domain/repos/forget_password_repo_contract.dart'
    as _i924;
import '../../feature/auth/domain/usecase/send_forget_password_email_usecase.dart'
    as _i1046;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i122.ForgetPasswordDataSourceContract>(
      () => _i979.ForgetPasswordDataSourceImpl(gh<_i535.AuthApiClient>()),
    );
    gh.factory<_i924.ForgetPasswordRepoContract>(
      () => _i270.ForgetPasswordRepoImpl(
        gh<_i122.ForgetPasswordDataSourceContract>(),
      ),
    );
    gh.factory<_i1046.SendForgetPasswordEmailUseCase>(
      () => _i1046.SendForgetPasswordEmailUseCase(
        gh<_i924.ForgetPasswordRepoContract>(),
      ),
    );
    return this;
  }
}
