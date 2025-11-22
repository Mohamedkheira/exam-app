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

import '../../feature/auth/api/api_clint/auth_client.dart' as _i501;
import '../../feature/auth/api/data_source/remote/login_remote_data_source_imp.dart'
    as _i32;
import '../../feature/auth/data/data_source/remote/login_remote_datas_source_contract.dart'
    as _i31;
import '../../feature/auth/data/repo/login_repo_impl.dart' as _i536;
import '../../feature/auth/domain/repo/login_repo_contract.dart' as _i1067;
import '../../feature/auth/domain/use_case/get_login_usecase.dart' as _i450;
import '../modul/di_modul.dart' as _i271;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.singleton<_i361.Dio>(() => registerModule.dio);
    gh.factory<_i1067.LoginRepoContract>(() => _i536.LoginRepoImpl());
    gh.factory<_i501.HomeApiClint>(() => _i501.HomeApiClint(gh<_i361.Dio>()));
    gh.factory<_i31.LoginRemoteDatasSourceContract>(
      () =>
          _i32.LoginRemoteDataSourceImp(homeApiClint: gh<_i501.HomeApiClint>()),
    );
    gh.factory<_i450.LoginUsecase>(
      () => _i450.LoginUsecase(homeRepo: gh<_i1067.LoginRepoContract>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i271.RegisterModule {}
