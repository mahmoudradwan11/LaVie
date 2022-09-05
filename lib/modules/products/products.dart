import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/models/product_model/product_model.dart';
import 'package:la_vie/shared/components/component.dart';
import 'package:la_vie/shared/cubit/cubit.dart';
import 'package:la_vie/shared/cubit/states.dart';

class Products extends StatelessWidget {
  const Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LaVieCubit, LaVieStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LaVieCubit.get(context);
        if (cubit.productModel == null) {
          return const Center(
            child: Text(
              'Product',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
            ),
          );
        } else {
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) =>
                productItem(cubit.productModel!.data[index], context),
            separatorBuilder: (context, index) => builtDivider(),
            itemCount: cubit.productModel!.data.length,
          );
        }
      },
    );
  }

  Widget productItem(ProductDataModel model, context) => InkWell(
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'des : ${model.description} ',
                      style: const TextStyle(color: Colors.grey),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                    if (model.plant != null)
                      const SizedBox(
                        height: 3,
                      ),
                    if (model.plant != null)
                      Text(
                        'Temperature : ${model.plant!.temperature}',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    const SizedBox(
                      height: 3,
                    ),
                    if (model.plant != null)
                      Text(
                        'SunLight : ${model.plant!.sunLight}',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    const SizedBox(
                      height: 3,
                    ),
                    if (model.plant != null)
                      Text(
                        'WaterCapacity : ${model.plant!.waterCapacity}',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    Text(
                      'Type: ${model.type!.toLowerCase()}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      'Available: ${model.available}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      'Price: ${model.price}',
                      style: const TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                const Spacer(),
                if (model.imageUrl != null)
                  if (model.type == 'PLANT')
                    const Image(
                      image: AssetImage('images/th.png'),
                      height: 120,
                      width: 90,
                      fit: BoxFit.cover,
                    ),
                if (model.type == 'SEED')
                  const Image(
                    image: AssetImage('images/seeds.png'),
                    height: 120,
                    width: 90,
                    fit: BoxFit.cover,
                  ),
                if (model.type == 'TOOL')
                  const Image(
                    image: AssetImage('images/tool.png'),
                    height: 120,
                    width: 90,
                    fit: BoxFit.cover,
                  ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            defButton(
                function: () {
                  LaVieCubit.get(context).insertDatabase(
                    name: model.name!,
                    des: model.description!,
                    price: model.price!,
                  );
                },
                text: 'Add Cred',
                isUpper: false)
          ]),
        ),
      );
}
