import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/modules/Cred/cred.dart';
import 'package:la_vie/modules/User/user.dart';
import 'package:la_vie/modules/create_post/create_post.dart';
import 'package:la_vie/modules/notification/notification.dart';
import 'package:la_vie/modules/posts/posts.dart';
import 'package:la_vie/shared/components/component.dart';

import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LaVieCubit, LaVieStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LaVieCubit.get(context);
          return DefaultTabController(
              length: cubit.tabs.length,
              child: Scaffold(
                appBar: AppBar(
                  //backgroundColor: Colors.green,
                  title: const Text('LaVie'),
                  centerTitle: true,
                  bottom: TabBar(
                    labelColor: Colors.green,
                    tabs: cubit.tabs,
                  ),
                ),
                drawer: Drawer(
                  child: ListView(
                    children: [
                      UserAccountsDrawerHeader(
                        accountName: Row(
                          children: [
                            Text('${cubit.firstName}'),
                            const SizedBox(
                              width: 5,
                            ),
                            Text('${cubit.lastName}')
                          ],
                        ),
                        accountEmail: Text('${cubit.email}'),
                        currentAccountPicture: CircleAvatar(
                          backgroundImage: NetworkImage('${cubit.image}'),
                        ),
                      ),
                      ListTile(
                        title: const Text('My Card'),
                        leading: const Icon(Icons.production_quantity_limits),
                        onTap: () {
                          navigateTo(context, const CardScreen());
                        },
                      ),
                      ListTile(
                        title: const Text('User Account'),
                        leading: const Icon(Icons.account_box_rounded),
                        onTap: () {
                          navigateTo(context, const UserScreen());
                        },
                      ),
                      ListTile(
                        title: const Text('Notification'),
                        leading: const Icon(Icons.notification_important),
                        onTap: () {
                          navigateTo(context,const NotificationsScreen());
                        },
                      ),
                      ListTile(
                        title: const Text('Create Post'),
                        leading: const Icon(Icons.post_add),
                        onTap: () {
                          navigateTo(context, CreatePost());
                        },
                      ),
                      ListTile(
                        title: const Text('Posts'),
                        leading: const Icon(Icons.local_post_office_sharp),
                        onTap: () {
                          navigateTo(context,const Posts());
                        },
                      ),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: cubit.screens,
                ),
              ));
        });
  }
}
