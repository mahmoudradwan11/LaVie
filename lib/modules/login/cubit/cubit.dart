import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:la_vie/layout/home.dart';
import 'package:la_vie/models/login_model/login_model.dart';
import 'package:la_vie/modules/login/cubit/states.dart';
import 'package:la_vie/shared/components/component.dart';
import 'package:la_vie/shared/network/endPoint/values.dart';
import 'package:la_vie/shared/network/remote/dio_helper.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitState());

  static LoginCubit get(context) => BlocProvider.of(context);
  LoginModel? login;
  IconData suffixIcon = Icons.visibility;
  bool passwordShow = true;
  void loginUser({required String email, required String password}) {
    emit(LoadingLogin());
    DioHelper.postData(url: LOGIN, data: {
      'password': password,
      'email': email,
    }).then((value) {
      login = LoginModel.fromJson(value.data);
      emit(LoginSuccessState(login!));
    }).catchError((error) {
      print(error.toString());
      emit(LoginFailedState(error.toString(), login!));
    });
  }

  void changePasswordIcon() {
    passwordShow = !passwordShow;
    suffixIcon =
        passwordShow ? Icons.visibility : Icons.visibility_off_outlined;
    emit(ChangePasswordVisState());
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
