import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/modules/login/login.dart';
import 'package:la_vie/shared/cubit/cubit.dart';
import 'package:la_vie/shared/cubit/states.dart';
import 'package:la_vie/shared/network/endPoint/values.dart';
import 'package:la_vie/shared/network/local/cache_helper.dart';
import 'package:la_vie/shared/network/remote/dio_helper.dart';
import 'package:la_vie/shared/styles/themes.dart';

import 'layout/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  Widget widget;
  token = CacheHelper.getData(key: 'token');
  print('Token = $token');
  if (token != null) {
    widget = const Home();
  } else {
    widget = Login();
  }
  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget? startWidget;
  const MyApp({Key? key, this.startWidget}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LaVieCubit()
        ..getPlants()
        ..getSeeds()
        ..getTools()
        ..getProducts()
        ..createDatabase()
        ..getUser(),
      child: BlocConsumer<LaVieCubit, LaVieStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Plant',
            theme: lightTheme,
            themeMode: ThemeMode.light,
            darkTheme: darkTheme,
            home: startWidget,
          );
        },
      ),
    );
  }
}
