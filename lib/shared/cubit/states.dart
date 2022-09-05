import 'package:la_vie/models/user_model/user_model.dart';

abstract class LaVieStates {}

class LaVieInitState extends LaVieStates {}

class ChangeBarItem extends LaVieStates {}

class GetPlants extends LaVieStates {}

class ErrorPlants extends LaVieStates {}

class GetSeeds extends LaVieStates {}

class ErrorSeeds extends LaVieStates {}

class GetUser extends LaVieStates {}

class ErrorUser extends LaVieStates {}

class GetTools extends LaVieStates {}

class ErrorTools extends LaVieStates {}

class GetProduct extends LaVieStates {}

class ErrorProduct extends LaVieStates {}

class CreateDatabaseState extends LaVieStates {}

class ErrorCreateDatabaseState extends LaVieStates {}

class InsertDatabaseState extends LaVieStates {}

class ErrorInsertDatabaseState extends LaVieStates {}

class GetDatabaseState extends LaVieStates {}

class ErrorGetDatabaseState extends LaVieStates {}

class InsertPostDataState extends LaVieStates {}

class ErrorInsertPostDataState extends LaVieStates {}

class GetPostDataState extends LaVieStates {}

class ErrorGetPostDataState extends LaVieStates {}

class DeleteDataState extends LaVieStates {}

class DeletePostDataState extends LaVieStates {}

class UpdateLoadingState extends LaVieStates {}

class UserDataFailedState extends LaVieStates {}

class UserUpdateSuccessState extends LaVieStates {
  UserModel? userModel;
  UserUpdateSuccessState(this.userModel);
}

class UserUpdateFailedState extends LaVieStates {}

class UploadImageSuccessState extends LaVieStates {}

class UploadImageErrorState extends LaVieStates {
}



