import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/shared/components/component.dart';
import 'package:la_vie/shared/cubit/cubit.dart';
import 'package:la_vie/shared/cubit/states.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LaVieCubit, LaVieStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LaVieCubit.get(context);
        var cred = cubit.cred;
        if (cred.isEmpty) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('My Card'),
              centerTitle: true,
            ),
            body: const Center(
              child: Text(
                'Add Some Cred Items',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text('My Card'),
              centerTitle: true,
            ),
            body: ListView.separated(
                itemBuilder: (context, index) =>
                    builtCredItem(cred[index], context),
                separatorBuilder: (context, index) => builtDivider(),
                itemCount: cred.length),
          );
        }
      },
    );
  }

  Widget builtCredItem(Map model, context) => Padding(
    padding: const EdgeInsets.all(20.0),
    child:
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(' Name : ${model['name']}'),
      const SizedBox(
        height: 3,
      ),
      Text(' Description : ${model['des']}'),
      const SizedBox(
        height: 3,
      ),
      Text(' Price : ${model['price']}'),
      const SizedBox(
        height: 3,
      ),
      Align(
            alignment: Alignment.bottomRight,
            child: IconButton(onPressed:(){
              LaVieCubit.get(context).deleteData(id: model['id']);
              showToast('Deleted Successfully',ToastStates.SUCCESS);
            }, icon:const Icon(Icons.restore_from_trash , color: Colors.green,),)
          )
    ]),
  );
}
