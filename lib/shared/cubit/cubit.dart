import 'dart:async';
//import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:la_vie/layout/home.dart';
import 'package:la_vie/models/plant_model/plant_model.dart';
//import 'package:la_vie/models/post_model/post_model.dart';
import 'package:la_vie/models/product_model/product_model.dart';
import 'package:la_vie/models/seed_model/seed_model.dart';
import 'package:la_vie/models/tools_model/tools_model.dart';
import 'package:la_vie/models/user_model/user_model.dart';
import 'package:la_vie/modules/plants/plants.dart';
import 'package:la_vie/modules/products/products.dart';
import 'package:la_vie/modules/seeds/seeds.dart';
import 'package:la_vie/modules/tools/tools.dart';
import 'package:la_vie/shared/components/component.dart';
import 'package:la_vie/shared/cubit/states.dart';
import 'package:la_vie/shared/network/endPoint/values.dart';
import 'package:la_vie/shared/network/remote/dio_helper.dart';
import 'package:sqflite/sqflite.dart';

class LaVieCubit extends Cubit<LaVieStates> {
  LaVieCubit() : super(LaVieInitState());
  static LaVieCubit get(context) => BlocProvider.of(context);
  List<Widget> screens = const [
    Products(),
    Plants(),
    Seeds(),
    Tools(),
  ];
  List<Tab> tabs = const [
    Tab(
      text: 'All',
    ),
    Tab(
      text: 'Plants',
    ),
    Tab(text: 'Seeds'),
    Tab(text: 'Tools'),
  ];
  int counter = 0;
  String? firstName;
  String? lastName;
  String? email;
  String? image;
  UserModel? userModel;
  PlantModel? plantModel;
  SeedsModel? seedsModel;
  ToolsModel? toolsModel;
  ProductModel? productModel;
  Database? database;
  List<Map> cred = [];
  List<Map> posts = [];
  List<Map> comments = [];
  void getPlants() {
    DioHelper.getData(
      url: PLANTS,
      token: 'Bearer $token',
    ).then((value) {
      plantModel = PlantModel.fromJson(value.data);
      print('Plants name  = ${plantModel!.data[1].name}');
      emit(GetPlants());
    }).catchError((error) {
      print('Error occur : $error');
      emit(ErrorPlants());
    });
  }

  void getSeeds() {
    DioHelper.getData(
      url: SEEDS,
      token: 'Bearer $token',
    ).then((value) {
      seedsModel = SeedsModel.fromJson(value.data);
      print('Seeds name  = ${seedsModel!.data[1].name}');
      emit(GetSeeds());
    }).catchError((error) {
      print('Error occur : $error');
      emit(ErrorSeeds());
    });
  }

  void getTools() {
    DioHelper.getData(
      url: TOOLS,
      token: 'Bearer $token',
    ).then((value) {
      toolsModel = ToolsModel.fromJson(value.data);
      print('Tools name  = ${toolsModel!.data[1].name}');
      emit(GetTools());
    }).catchError((error) {
      print('Error occur : $error');
      emit(ErrorTools());
    });
  }

  void getProducts() {
    DioHelper.getData(
      url: PRODUCT,
      token: 'Bearer $token',
    ).then((value) {
      productModel = ProductModel.fromJson(value.data);
      print('Product price  = ${productModel!.data[2].price}');
      print('Product type  = ${productModel!.data[2].type}');

      emit(GetProduct());
    }).catchError((error) {
      print('Error occur : $error');
      emit(ErrorProduct());
    });
  }

  void createDatabase() {
    openDatabase('Cred.db', version: 3, onCreate: (database, version) {
      print('DataBase Created');
      database
          .execute(
              'create table Cred(id INTEGER PRIMARY KEY,name TEXT , des TEXT , price INT)')
          .then((value) {
        print('Table 1 Created');
      }).catchError((error) {
        print('Error occur : $error');
      });
      database
          .execute(
              'create table Posts(id INTEGER PRIMARY KEY,title TEXT , des TEXT,image TEXT)')
          .then((value) {
        print('Table 2 Created');
      }).catchError((error) {
        print('Error occur : $error');
      });
      database
          .execute('create table Comment(id INTEGER PRIMARY KEY,title TEXT)')
          .then((value) {
        print('Table 3 Created');
      }).catchError((error) {
        print('Error occur : $error');
      });
    }, onOpen: (database) {
      getData(database);
      getPostData(database);
      getCommentData(database);
      print('Database opened');
    }).then((value) {
      database = value;
      emit(CreateDatabaseState());
    }).catchError((error) {
      emit(ErrorCreateDatabaseState());
    });
  }

  Future<void> insertDatabase(
      {required String name, required String des, required int price}) async {
    database!.transaction((txn) {
      return txn
          .rawInsert(
              'INSERT INTO Cred(name,des,price) VALUES("$name","$des","$price")')
          .then((value) {
        print('$value Inserted Successfully');
        emit(InsertDatabaseState());
        getData(database);
        //print()
      }).catchError((error) {
        print('Error occur : $error');
        emit(ErrorInsertDatabaseState());
      });
    });
  }

  void getData(database) {
    cred = [];
    database!.rawQuery('select * from Cred').then((value) {
      value.forEach((element) {
        cred.add(element);
      });
      print(cred);
      emit(GetDatabaseState());
    }).catchError((error) {
      print('Error occur no data');
      emit(ErrorGetDatabaseState());
    });
  }

  void deleteData({required int id}) async {
    await database!
        .rawDelete('DELETE FROM Cred WHERE id= ?', [id]).then((value) {
      getData(database);
      emit(DeleteDataState());
    });
  }

  void deletePostData({required int id}) async {
    await database!
        .rawDelete('DELETE FROM Posts WHERE id= ?', [id]).then((value) {
      getPostData(database);
      emit(DeletePostDataState());
    });
  }

  void getUser() {
    DioHelper.getData(
      url: USER,
      token: 'Bearer $token',
    ).then((value) {
      userModel = UserModel.fromJson(value.data);
      print('User name  = ${userModel!.data!.lastName}');
      firstName = userModel!.data!.firstName;
      lastName = userModel!.data!.lastName;
      email = userModel!.data!.email;
      image = userModel!.data!.imageUrl;
      emit(GetUser());
    }).catchError((error) {
      print('Error occur : $error');
      emit(ErrorUser());
    });
  }

  void updateUserData({
    required String firstName,
    required String email,
    required String address,
    required String lastName,
  }) {
    emit(UpdateLoadingState());
    DioHelper.patchData(
      url: USER,
      token: 'Bearer $token',
      data: {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'address': address,
      },
    ).then((value) {
      userModel = UserModel.fromJson(value.data);
      //printFullText(userModel!.data!.name!);
      emit(UserUpdateSuccessState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(UserUpdateFailedState());
    });
  }

  Future<void> insertPost(
      {required String title,
      required String des,
      required String image}) async {
    database!.transaction((txn) {
      return txn
          .rawInsert(
              'INSERT INTO Posts(title,des,image) VALUES("$title","$des","$image")')
          .then((value) {
        print('$value Inserted Successfully');
        emit(InsertPostDataState());
        getPostData(database);
        //print()
      }).catchError((error) {
        print('Error occur : $error');
        emit(ErrorInsertDatabaseState());
      });
    });
  }

  void getPostData(database) {
    posts = [];
    database!.rawQuery('select * from Posts').then((value) {
      value.forEach((element) {
        posts.add(element);
      });
      print(posts);
      emit(GetPostDataState());
    }).catchError((error) {
      print('Error occur no data');
      emit(ErrorGetPostDataState());
    });
  }

  void addCount() {
    counter++;
    emit(AddCounter());
  }

  void minusCounter() {
    counter--;
    emit(MinusCounter());
  }

  Future<void> insertCommentDatabase({
    required String title,
  }) async {
    database!.transaction((txn) {
      return txn
          .rawInsert('INSERT INTO Comment(title) VALUES("$title")')
          .then((value) {
        print('$value Inserted Successfully');
        emit(InsertCommentDataState());
        getCommentData(database);
        //print()
      }).catchError((error) {
        print('Error occur : $error');
        emit(ErrorCommentInsertDataState());
      });
    });
  }

  void getCommentData(database) {
    comments = [];
    database!.rawQuery('select * from Comment').then((value) {
      value.forEach((element) {
        comments.add(element);
      });
      print(comments);
      emit(GetCommentDataState());
    }).catchError((error) {
      print('Error occur no data');
      emit(ErrorGetCommentDataState());
    });
  }

  void deleteCommentData({required int id}) async {
    await database!
        .rawDelete('DELETE FROM Comment WHERE id= ?', [id]).then((value) {
      getCommentData(database);
      emit(DeleteCommentDataState());
    });
  }
}
