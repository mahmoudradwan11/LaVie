import 'package:flutter/material.dart';
import 'package:la_vie/models/notification/notification.dart';
import 'package:la_vie/shared/components/component.dart';
import 'package:la_vie/shared/styles/colors.dart';
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Notifications'),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return buildNotificationItems(
                context, NotificationModel.notificationData[index]);
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: PGray200,
              thickness: 1.0,
            );
          },
          itemCount: NotificationModel.notificationData.length,
        ),
      ),
    );
  }
  Widget buildNotificationItems(BuildContext context, NotificationModel model) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 23.0,
          backgroundColor: PGray100,
          backgroundImage: NetworkImage(
            '${model.image}',
          ),
        ),
        PHSpace10,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${model.name}',
                style:const TextStyle(
                  fontSize: 20,
                )
              ),
              PVSpace10,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: PGray300,
                        width: 4.0,
                      ),
                    )),
                child: Text(
                  '${model.body}',maxLines: 3,
                   overflow: TextOverflow.ellipsis,
                   style:const TextStyle(
                   fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              PVSpace10,
              Text(
                '${model.createdAt}',
                style:TextStyle(
               fontSize: 10,
                  color: PGray400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
