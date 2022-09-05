import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/modules/login/login.dart';
import 'package:la_vie/shared/components/component.dart';
import 'package:la_vie/shared/cubit/cubit.dart';
import 'package:la_vie/shared/cubit/states.dart';
import 'package:la_vie/shared/network/local/cache_helper.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var firstNameController = TextEditingController();
    var emailController = TextEditingController();
    var addressController = TextEditingController();
    var lastNameController = TextEditingController();
    return BlocConsumer<LaVieCubit, LaVieStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LaVieCubit.get(context);
          var model = cubit.userModel;
          firstNameController.text = model!.data!.firstName!;
          lastNameController.text = model.data!.lastName!;
          emailController.text = model.data!.email!;
          addressController.text = model.data!.address!;
          return Scaffold(
            appBar: AppBar(
              title: const Text('User'),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
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
                            children: [
                              CircleAvatar(
                                radius: 90,
                                child: Image(
                                  image: NetworkImage('${cubit.image}'),
                                  height: 180,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                'El  ${model.data!.lastName}',
                                style: const TextStyle(
                                    fontFamily: 'Bursh',
                                    color: Colors.green,
                                    fontSize: 30),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (state is UpdateLoadingState)
                        const LinearProgressIndicator(),
                      const SizedBox(
                        height: 15,
                      ),
                      textField(
                        show: false,
                        controller: firstNameController,
                        keyboard: TextInputType.name,
                        valid: (value) {
                          if (value.isEmpty) {
                            return 'firstName Must Not Be Empty';
                          }
                          return null;
                        },
                        label: 'Name',
                        prefix: Icons.person,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      textField(
                        show: false,
                        controller: lastNameController,
                        keyboard: TextInputType.text,
                        valid: (value) {
                          if (value.isEmpty) {
                            return 'lastName Must Not Be Empty';
                          }
                          return null;
                        },
                        label: 'lastName',
                        prefix: Icons.person,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      textField(
                        show: false,
                        controller: emailController,
                        keyboard: TextInputType.emailAddress,
                        valid: (value) {
                          if (value.isEmpty) {
                            return 'email Must Not Be Empty';
                          }
                          return null;
                        },
                        label: 'email',
                        prefix: Icons.email,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      textField(
                        show: false,
                        controller: addressController,
                        keyboard: TextInputType.text,
                        valid: (value) {
                          if (value.isEmpty) {
                            return 'email Must Not Be Empty';
                          }
                          return null;
                        },
                        label: 'address',
                        prefix: Icons.location_city,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      defButton(
                        function: () {
                          signOut(context);
                        },
                        text: 'Logout',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      defButton(
                        function: () {
                          if (formKey.currentState!.validate()) {
                            cubit.updateUserData(
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              email: emailController.text,
                              address: addressController.text,
                            );
                          }
                        },
                        text: 'Update',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  void signOut(context) {
    CacheHelper.removeData(key: 'token').then((value) {
      if (value) {
        navigateAndFinish(context, Login());
      }
    });
  }
}
