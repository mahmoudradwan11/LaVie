import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/layout/home.dart';
import 'package:la_vie/modules/signup/signup.dart';
import 'package:la_vie/shared/components/component.dart';
import 'package:la_vie/shared/network/endPoint/values.dart';
import 'package:la_vie/shared/network/local/cache_helper.dart';
import 'package:la_vie/shared/styles/colors.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class Login extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.model.type == 'Success') {
              print(state.model.message);
              print(state.model.data!.accessToken);
              CacheHelper.saveData(
                      key: 'token', value: state.model.data!.accessToken)
                  .then((value) {
                token = state.model.data!.accessToken;
                showToast('${state.model.message}', ToastStates.SUCCESS);
                navigateAndFinish(context, const Home());
              });
            } else {
              showToast(
                '${state.model.message}',
                ToastStates.ERROR,
              );
            }
          }
          else if(state is LoginFailedState)
          {
            showToast(
              '${state.model.message}',
              ToastStates.ERROR,
            );
          }
        },
        builder: (context, state) {
          LoginCubit cubit = LoginCubit.get(context);
          return Scaffold(
            body:SafeArea(
              child:Stack(
              children:[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.001,
              right: MediaQuery.of(context).size.width * 0.001,
              child: Image.asset('images/logo.png'),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.001,
              left: MediaQuery.of(context).size.width * 0.001,
              child: Image.asset('images/logo.png'),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.05,
              left: MediaQuery.of(context).size.width * 0.38,
              child: logo(),
            ),
            Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Row(
                          children: [
                            MaterialButton(
                              onPressed: () {
                                navigateAndFinish(context, Login());
                              },
                              child: Text(
                                'Login',
                                style:
                                    TextStyle(fontSize: 25, color: defaultColor),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Spacer(),
                            MaterialButton(
                              onPressed: () {
                                navigateAndFinish(context, SignUp());
                              },
                              child: const Text(
                                'signUp',
                                style:
                                    TextStyle(fontSize: 18, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: textField(
                          show: false,
                          controller: emailController,
                          keyboard: TextInputType.emailAddress,
                          valid: (value) {
                            if (value.isEmpty) {
                              return 'Email Must not be Empty';
                            }
                            return null;
                          },
                          label: 'Email Address',
                          prefix: Icons.email_outlined,
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: textField(
                          show: cubit.passwordShow,
                          suffix: cubit.suffixIcon,
                          suffixPress: () {
                            cubit.changePasswordIcon();
                          },
                          controller: passwordController,
                          keyboard: TextInputType.visiblePassword,
                          valid: (value) {
                            if (value.isEmpty) {
                              return 'Password is to short';
                            }
                            return null;
                          },
                          label: 'password',
                          prefix: Icons.lock_outline,
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      if (state is LoadingLogin)
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: LinearProgressIndicator(),
                        ),
                      const SizedBox(
                        height: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: defButton(
                          function: () {
                            if (formKey.currentState!.validate()) {
                              cubit.loginUser(
                                  email: emailController.text,
                                  password: passwordController.text
                              );
                            }
                          },
                          text: 'login',
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          const SizedBox(
                            height: 20,
                          ),
                          IconButton(onPressed:(){
                            cubit.googleSignIn(context);
                          }, icon:const Image(
                              image: AssetImage('images/google.png'),
          ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
              ]
            ),
            ),
          );
        },
      ),
    );
  }
}
