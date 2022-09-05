class NotificationModel {
  NotificationModel({
    this.name,
    this.id,
    this.title,
    this.body,
    this.image,
    this.createdAt,
    this.isRead,
  });
  String? name;
  int? id;
  String? title;
  String? body;
  String? image;
  String? createdAt;
  bool? isRead;
  static List<NotificationModel> notificationData = [
    NotificationModel(
      name: 'Aya Mahmoud',
      id: 1,
      title: 'New Post',
      body:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      image:
      'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      createdAt:"2022-3-17 At 03:23 Pm",
      isRead: false,
    ),
    NotificationModel(
      name: 'Esraa Ahmed',
      id: 2,
      title: 'New Post',
      body: 'New post has been added',
      image:
      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      createdAt: "2022-3-19 At 06:23 Am",
      isRead: false,
    ),
    NotificationModel(
      name: 'Fatma Ameen',
      id: 3,
      title: 'New Post',
      body:
      'leaves are an integral part of the stem system. They are attached by a continuous vascular system to the rest of the plant so that free exchange of nutrients',
      image:
      'https://images.unsplash.com/photo-1489424731084-a5d8b219a5bb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDd8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      createdAt: "2022-1-17 At 07:23 Pm",
      isRead: false,
    ),
    NotificationModel(
      name: 'Ali Hatem',
      id: 5,
      title: 'New Post',
      body:
      'leaves are an integral part of the stem system. They are attached by a continuous vascular system to the rest of the plant so that free exchange of nutrients',
      image:
      'https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE5fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
      createdAt: "2022-3-17 At 03:25 Pm",
      isRead: false,
    ),
    NotificationModel(
      name: 'Nour Yahua',
      id: 6,
      title: 'New Post',
      body:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      image:
      'https://images.unsplash.com/photo-1514626585111-9aa86183ac98?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDIwfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
      createdAt: "2021-3-29 At 03:25 Pm",
      isRead: false,
    ),
    NotificationModel(
      name:'Mohamed Saad',
      id: 7,
      title: 'New Post',
      body:
      'leaves are an integral part of the stem system. They are attached by a continuous vascular system to the rest of the plant so that free exchange of nutrients',
      image:
      'https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
      createdAt: "2022-3-17 At 09:23 Pm",
      isRead: false,
    ),
    NotificationModel(
      name: 'Mohamed Nasser',
      id: 8,
      title: 'New Post',
      body: 'New post has been added',
      createdAt: "2022-3-16 At 10:23 Pm",
      image:
      'https://images.unsplash.com/photo-1599423468197-96f6612488cb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDh8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    ),
  ];
}