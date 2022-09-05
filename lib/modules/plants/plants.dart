import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/models/plant_model/plant_model.dart';
import 'package:la_vie/shared/components/component.dart';
import 'package:la_vie/shared/cubit/cubit.dart';
import 'package:la_vie/shared/cubit/states.dart';

class Plants extends StatelessWidget {
  const Plants({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LaVieCubit, LaVieStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LaVieCubit.get(context);
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              plantItem(cubit.plantModel!.data[index]),
          separatorBuilder: (context, index) => builtDivider(),
          itemCount: cubit.plantModel!.data.length,
        );
      },
    );
  }

  Widget plantItem(PlantDataModel model) => InkWell(
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'des : ${model.description} ',
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      'Temperature : ${model.temperature}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      'SunLight : ${model.sunLight}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      'WaterCapacity : ${model.waterCapacity}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const Spacer(),
                if (model.imageUrl != null)
                  const Image(
                    image: AssetImage('images/plant.png'),
                    height: 120,
                    width: 54,
                    //fit: BoxFit.cover,
                  ),
              ],
            )
          ]),
        ),
      );
}
