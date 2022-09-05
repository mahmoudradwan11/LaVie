import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:la_vie/shared/components/component.dart';
import 'package:la_vie/shared/cubit/cubit.dart';
import 'package:la_vie/shared/cubit/states.dart';

class Posts extends StatelessWidget {
  const Posts({Key? key}) : super(key: key);

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

  Widget builtPostItem(Map model, context) => Dismissible(key: Key(model['id'].toString()),
  onDismissed: (direction) {
  LaVieCubit.get(context).deletePostData(id: model['id']);
  },
    child: Card(
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
                      onPressed: () {},
                      icon: const Icon(Icons.more_horiz),
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
              ],
            ),
          ),
        ),
  );
}
