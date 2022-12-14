import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:la_vie/layout/home.dart';
import 'package:la_vie/models/login_model/login_model.dart';
import 'package:la_vie/modules/signup/cubit/states.dart';
import 'package:la_vie/shared/components/component.dart';
import 'package:la_vie/shared/network/endPoint/values.dart';
import 'package:la_vie/shared/network/remote/dio_helper.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  LoginModel? loginModel;

  void userRegister({
    required String firstname,
    required String email,
    required String password,
    required String lastname,
  }) {
    emit(RegisterLoadingState());

    DioHelper.postData(
      url: SIGNUP,
      data: {
        'firstName': firstname,
        'lastName': lastname,
        'email': email,
        'password': password,
      },
    ).then((value) {
      print(value.data);
      loginModel = LoginModel.fromJson(value.data);
      emit(RegisterSuccessState(loginModel!));
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(RegisterChangePasswordVisibilityState());
  }

  final google = GoogleSignIn();
  Future<GoogleSignInAccount?> googleSignIn(BuildContext context) async {
    final userAccount = await google.signIn();
    if (userAccount == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Sign in failed'),
        ),
      );
    } else {
      navigateTo(context, const Home());
    }
    userAccount!.id;
    userAccount.email;
    userAccount.photoUrl;
    userAccount.displayName;
    return null;
  }
}
