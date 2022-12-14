import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:la_vie/shared/components/component.dart';
import 'package:la_vie/shared/cubit/cubit.dart';
import 'package:la_vie/shared/cubit/states.dart';
import 'package:la_vie/shared/styles/colors.dart';

class Posts extends StatelessWidget {
  Posts({Key? key}) : super(key: key);
  TextEditingController commentsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LaVieCubit, LaVieStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LaVieCubit.get(context);
        var posts = cubit.posts;

        if (posts.isEmpty) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('My Card'),
              centerTitle: true,
            ),
            body: const Center(
              child: Text(
                'No Posts',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Posts'),
              centerTitle: true,
            ),
            body: ListView.separated(
                itemBuilder: (context, index) =>
                    builtPostItem(posts[index], context),
                separatorBuilder: (context, index) => builtDivider(),
                itemCount: posts.length),
          );
        }
      },
    );
  }

  Widget builtPostItem(Map model, context) => Card(
        margin: const EdgeInsets.symmetric(horizontal: 0.8),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25.0,
                    backgroundImage:
                        NetworkImage('${LaVieCubit.get(context).image}'),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${LaVieCubit.get(context).firstName}',
                              style: const TextStyle(
                                height: 1.4,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                        Text(DateFormat('yyyy-MM-dd At KK:mm').format(DateTime.tryParse('${DateTime.now()}')!),style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  IconButton(
                    onPressed: () {
                      LaVieCubit.get(context).deletePostData(id: model['id']);
                      showToast('post delete successfully', ToastStates.SUCCESS);
                    },
                    icon: const Icon(Icons.restore_from_trash , color: Colors.green,),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.grey[300],
                ),
              ),
              Center(
                child: Text(
                  '${model['title']}',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                '${model['des']}',
                style: const TextStyle(
                  color: Colors.black,
                    ),
              ),
                Padding(
                  padding:const EdgeInsetsDirectional.only(top: 15.0),
                  child: Container(
                      height:250,
                      width: double.infinity,
                      decoration:BoxDecoration(
                        image:DecorationImage(
                          image:NetworkImage(
                              '${model['image']}',
                          ),
                          fit:BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(4.0),
                      )
                  ),
                ),
          Padding(
      padding:const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical:5.0),
                child: Row(
                  children:[
                    const Icon(Icons.favorite,
                      size: 18.0,
                      color: Colors.green,
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      '${LaVieCubit.get(context).counter}',style:Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.green,
                    ),),
                    const Text(' Likes',style: TextStyle(color: Colors.green),)
                  ],
                ),
              ),
              onTap:(){
                LaVieCubit.get(context).addCount();
              },
            ),
          ),
          Expanded(
            child: InkWell(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.end,
                  children:[
                    Icon(
                      Icons.comment,
                      size: 18.0,
                      color:defaultColor,
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      '120',style:Theme.of(context).textTheme.caption,)
                  ],
                ),
              ),
              onTap:(){},
            ),
          )
            ],
          ),
        ),
              Row(
                crossAxisAlignment:CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      child: buildTextForm(
                        context,
                        title:'Comment',
                        color: Colors.white,
                        fontSize: 1,
                        buttonController: commentsController,
                        MediaQuery.of(context).size.height * 0.07,
                      ),
                    ),
                  ),
                  IconButton(onPressed:(){
                    LaVieCubit.get(context).insertCommentDatabase(title: commentsController.text);
                    showToast('Comment Add Successfully', ToastStates.SUCCESS);
                  }, icon:const Icon(Icons.send,color: Colors.green,size: 40,))
                ],
              ),
      ]
  ),
        ),
      );
}
