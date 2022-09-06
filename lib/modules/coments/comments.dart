import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:la_vie/models/user_model/user_model.dart';
import 'package:la_vie/shared/components/component.dart';
import 'package:la_vie/shared/cubit/cubit.dart';
import 'package:la_vie/shared/cubit/states.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LaVieCubit, LaVieStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LaVieCubit.get(context);
        var comments = cubit.comments;
        if (comments.isEmpty) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Comments'),
              centerTitle: true,
            ),
            body: const Center(
              child: Text(
                'No Comments Yet',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Comments'),
              centerTitle: true,
            ),
            body: ListView.separated(
                itemBuilder: (context, index) =>
                    builtCommentsItem(comments[index], context,cubit.userModel!.data!),
                separatorBuilder: (context, index) => builtDivider(),
                itemCount: comments.length),
          );
        }
      },
    );
  }

  Widget builtCommentsItem(Map model, context,User mod) => Padding(
    padding: const EdgeInsets.all(20.0),
    child:
    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
      const SizedBox(
        height: 3,
      ),
      Text('${model['title']}'),
      const SizedBox(
        height: 3,
      ),
      Align(
          alignment: Alignment.bottomRight,
          child: IconButton(onPressed:(){
            LaVieCubit.get(context).deleteCommentData(id: model['id']);
            showToast('Deleted Successfully',ToastStates.SUCCESS);
          }, icon:const Icon(Icons.restore_from_trash , color: Colors.green,),)
      )
    ]),
  );
}
