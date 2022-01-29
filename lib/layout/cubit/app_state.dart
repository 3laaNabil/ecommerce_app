part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class ChangeBottomNavState extends AppState {}

class LoadingProductsataState extends AppState {}

class SuccessProductsDataState extends AppState {}

class ErrorProductsDataState extends AppState {}
class LoadingCategoriesDataState extends AppState {}

class SuccessCategoriesDataState extends AppState {}

class ErrorCategoriesState extends AppState {}

class LoadingCategorieIdDataState extends AppState {}

class SuccessCategorieIdDataState extends AppState {}

class ErrorCategorieIdState extends AppState {}