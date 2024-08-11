import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/repo/home_repo_implement.dart';
import 'package:bookly_app/features/search/data/repo/search_repo_implement.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  getIt.registerSingleton<HomeRepoImplement>(
    HomeRepoImplement(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton<SearchRepoImplement>(
    SearchRepoImplement(
      getIt.get<ApiService>(),
    ),
  );
}
