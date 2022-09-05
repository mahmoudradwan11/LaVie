import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:la_vie/models/plant_model/plant_model.dart';
import 'package:la_vie/models/seed_model/seed_model.dart';
import 'package:la_vie/shared/components/component.dart';
import 'package:la_vie/shared/cubit/cubit.dart';
import 'package:la_vie/shared/cubit/states.dart';

class Seeds extends StatelessWidget {
  const Seeds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LaVieCubit, LaVieStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LaVieCubit.get(context);
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              seedsItem(cubit.seedsModel!.data[index]),
          separatorBuilder: (context, index) => builtDivider(),
          itemCount: cubit.seedsModel!.data.length,
        );
      },
    );
  }

  Widget seedsItem(SeedsDataModel model) => InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Align(child: Text('${model.name}')),
            const SizedBox(
              height: 3,
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'des : ${model.description} ',
                    style: const TextStyle(color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                //const Spacer(),
                if (model.imageUrl != null)
                  const Image(
                    image: AssetImage('images/seeds.png'),
                    height: 120,
                    width: 90,
                    fit: BoxFit.cover,
                  ),
              ],
            )
          ]),
        ),
      );
}
