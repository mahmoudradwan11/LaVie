import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/layout/home.dart';
import 'package:la_vie/modules/login/login.dart';
import 'package:la_vie/shared/components/component.dart';
import 'package:la_vie/shared/network/endPoint/values.dart';
import 'package:la_vie/shared/network/local/cache_helper.dart';
import 'package:la_vie/shared/styles/colors.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class SignUp extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var firstNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var lastNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            if (state.loginModel.type == 'Success') {
              print(state.loginModel.message);
              print(state.loginModel.data!.accessToken);

              CacheHelper.saveData(
                key: 'token',
                value: state.loginModel.data!.accessToken,
              ).then((value) {
                token = state.loginModel.data!.accessToken!;
                navigateAndFinish(
                  context,
                  Home(),
                );
              });
            } else {
              print(state.loginModel.message);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      height: 250,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Image(
                              image: AssetImage('images/plant.png'),
                              height: 180,
                            ),
                            Text(
                              'la_vie',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 30,
                                  fontFamily: 'Bursh'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Row(
                        children: [
                          MaterialButton(
                            onPressed: () {
                              navigateAndFinish(context, Login());
                            },
                            child: const Text(
                              'Login',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                          ),
                          const Spacer(),
                          MaterialButton(
                            onPressed: () {
                              navigateAndFinish(context, SignUp());
                            },
                            child: Text(
                              'signUp',
                              style:
                                  TextStyle(fontSize: 25, color: defaultColor),
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
                        controller: firstNameController,
                        keyboard: TextInputType.text,
                        valid: (String? value) {
                          if (value!.isEmpty) {
                            return 'please enter your fisrt name';
                          }
                        },
                        label: 'First name',
                        prefix: Icons.person,
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: textField(
                        show: false,
                        controller: lastNameController,
                        keyboard: TextInputType.text,
                        valid: (String? value) {
                          if (value!.isEmpty) {
                            return 'please enter your lastName';
                          }
                        },
                        label: 'last name',
                        prefix: Icons.person,
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: textField(
                        show: false,
                        controller: emailController,
                        keyboard: TextInputType.emailAddress,
                        valid: (String? value) {
                          if (value!.isEmpty) {
                            return 'please enter your email address';
                          }
                        },
                        label: 'Email Address',
                        prefix: Icons.email_outlined,
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: textField(
                        controller: passwordController,
                        keyboard: TextInputType.visiblePassword,
                        suffix: RegisterCubit.get(context).suffix,
                        onSubmit: (value) {},
                        show: RegisterCubit.get(context).isPassword,
                        suffixPress: () {
                          RegisterCubit.get(context).changePasswordVisibility();
                        },
                        valid: (String? value) {
                          if (value!.isEmpty) {
                            return 'password is too short';
                          }
                        },
                        label: 'Password',
                        prefix: Icons.lock_outline,
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    if (state is RegisterLoadingState)
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
                        isUpper: true,
                        function: () {
                          if (formKey.currentState!.validate()) {
                            RegisterCubit.get(context).userRegister(
                              firstname: firstNameController.text,
                              lastname: lastNameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                        text: 'login',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
