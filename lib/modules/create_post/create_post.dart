import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/shared/components/component.dart';
import 'package:la_vie/shared/cubit/cubit.dart';
import 'package:la_vie/shared/cubit/states.dart';
import 'package:la_vie/shared/styles/colors.dart';

class CreatePost extends StatelessWidget {
  CreatePost({Key? key}) : super(key: key);
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LaVieCubit,LaVieStates>(
        listener:(context,state) {},
        builder:(context,state){
          var cubit = LaVieCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Create New Post'),
              elevation: 0.0,
            ),
            body: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    PVSpace10,
                    buildTextForm(
                      context,
                      buttonController: titleController,
                      'Title',
                      MediaQuery.of(context).size.height * 0.07,
                    ),
                    PVSpace30,
                    buildTextForm(
                      context,
                      buttonController: descriptionController,
                      'Description',
                      MediaQuery.of(context).size.height * 0.22,
                    ),
                    PVSpace30,
                    defButton(function:(){
                      cubit.insertPost(
                          title:titleController.text,
                          des:descriptionController.text,
                          image:'https://www.bing.com/th?id=OIP.Pp0yCTNK-xQoApXdq0rAmwHaFj&w=288&h=216&c=8&rs=1&qlt=90&o=6&dpr=1.25&pid=3.1&rm=2');
                    },
                        text:'Add Post')
                  ],
                ),
              ),
            ),
          );
        },
    );
  }
}
