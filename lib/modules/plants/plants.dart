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
                if (model.name == 'American Marigold')
                  const Image(
                    image: NetworkImage(
                        'https://th.bing.com/th/id/OIP.DZHDzehEv8_5xB_yaZDRuQHaHa?pid=ImgDet&rs=1'),
                    height: 120,
                    width: 110,
                    fit: BoxFit.cover,
                  ),
                if (model.name == 'Orange Blossom')
                  const Image(
                    image: NetworkImage(
                        'https://th.bing.com/th/id/R.227435d580dff6324e8a69687509712b?rik=w%2bY4R%2fKatfe7rg&riu=http%3a%2f%2f1.bp.blogspot.com%2f-eAnw5WYELOI%2fUV8UEVswQOI%2fAAAAAAAAMj0%2fpL5vhZdG5V8%2fs1600%2forange-blossoms-1.jpg&ehk=CXg%2bDNfHEHoKptiIm02sqqgyASEVi1DlKaRu8EJ7T8w%3d&risl=&pid=ImgRaw&r=0'),
                    height: 120,
                    width: 110,
                    fit: BoxFit.cover,
                  ),
                if (model.name == 'Hawaiin Flowers')
                  const Image(
                    image: NetworkImage(
                        'https://4.bp.blogspot.com/-AT6o_N-YpgY/UEa_bV-VS7I/AAAAAAAAAEI/gCLW7xVZeqQ/s1600/028+copy.jpg'),
                    height: 120,
                    width: 110,
                    fit: BoxFit.cover,
                  ),
                if (model.name == 'Forget Me Not')
                  const Image(
                    image: NetworkImage(
                        'https://th.bing.com/th/id/OIP.whDtFSzwu0wcssm57Xw-TQHaHa?w=204&h=204&c=7&r=0&o=5&dpr=1.25&pid=1.7'),
                    height: 120,
                    width: 110,
                    fit: BoxFit.cover,
                  ),
                if (model.name == 'Mountain Laurel')
                  const Image(
                    image: NetworkImage(
                        'https://th.bing.com/th/id/OIP.kgPI3fk37sYKpXZwJUbVgQHaE8?w=294&h=196&c=7&r=0&o=5&dpr=1.25&pid=1.7'),
                    height: 120,
                    width: 110,
                    fit: BoxFit.cover,
                  ),
                if (model.name == 'Common Violet')
                  const Image(
                    image: NetworkImage(
                        'https://th.bing.com/th/id/OIP.iqjHV9cJc_C9T_W9LiB_HwHaHD?w=200&h=191&c=7&r=0&o=5&dpr=1.25&pid=1.7'),
                    height: 120,
                    width: 110,
                    fit: BoxFit.cover,
                  ),
                if (model.name == 'California Poppy')
                  const Image(
                    image: NetworkImage(
                        'https://th.bing.com/th/id/OIP.D4NM2O-kRzVE9swk_u5YkwHaE7?w=299&h=200&c=7&r=0&o=5&dpr=1.25&pid=1.7'),
                    height: 120,
                    width: 110,
                    fit: BoxFit.cover,
                  ),
                if (model.name == 'Camellia')
                  const Image(
                    image: NetworkImage(
                        'https://th.bing.com/th/id/OIP.Zb6SSwHFC_pqxupcssqTVAHaHa?w=201&h=201&c=7&r=0&o=5&dpr=1.25&pid=1.7'),
                    height: 120,
                    width: 110,
                    fit: BoxFit.cover,
                  ),
                if (model.name == 'Yellow Hibiscus')
                  const Image(
                    image: NetworkImage(
                        'https://th.bing.com/th/id/OIP.d8fefxSAnfcsT_X7HSP8zAHaFj?w=275&h=206&c=7&r=0&o=5&dpr=1.25&pid=1.7'),
                    height: 120,
                    width: 110,
                    fit: BoxFit.cover,
                  ),
                if (model.name == 'Ageratum')
                  const Image(
                    image: NetworkImage(
                        'https://th.bing.com/th/id/OIP.g59ru3jHTd8k9eOY8rfs_QHaGY?w=214&h=184&c=7&r=0&o=5&dpr=1.25&pid=1.7'),
                    height: 120,
                    width: 110,
                    fit: BoxFit.cover,
                  ),
                if (model.name == 'Peach Blossom')
                  const Image(
                    image: NetworkImage(
                        'https://th.bing.com/th/id/OIP.sW1ZENz8xNb79VugVHP0FQHaF0?w=239&h=187&c=7&r=0&o=5&dpr=1.25&pid=1.7'),
                    height: 120,
                    width: 110,
                    fit: BoxFit.cover,
                  ),
                if (model.name == 'Lewis Mock Orange')
                  const Image(
                    image: NetworkImage(
                        'https://th.bing.com/th/id/OIP.s9BpA_8Rjl_PWvZ9pYyz8wHaEQ?w=301&h=180&c=7&r=0&o=5&dpr=1.25&pid=1.7'),
                    height: 120,
                    width: 76,
                    fit: BoxFit.cover,
                  ),
                if (model.name == 'Saguaro Cactus Blossom')
                  const Image(
                    image: NetworkImage(
                        'https://bloximages.chicago2.vip.townnews.com/tucson.com/content/tncms/assets/v3/editorial/f/85/f858f532-566e-11e8-84da-33e3c0153539/5a09d354a5dfb.image.jpg?resize=1200%2C911'),
                    height: 120,
                    width: 99,
                    fit: BoxFit.cover,
                  ),
                if (model.name == 'Rocky Mountain Columbine')
                  const Image(
                    image: NetworkImage(
                        'https://th.bing.com/th/id/OIP.3pNBSNmF8fncjnGLwEHqrwHaHa?w=185&h=185&c=7&r=0&o=5&dpr=1.25&pid=1.7'),
                    height: 120,
                    width: 110,
                    fit: BoxFit.cover,
                  ),
                if (model.name == 'Peony')
                  const Image(
                    image: NetworkImage(
                        'https://th.bing.com/th/id/OIP.333vK9t15_VNbTtX68Wu9gHaHa?w=177&h=180&c=7&r=0&o=5&dpr=1.25&pid=1.7'),
                    height: 120,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                if (model.name == 'Apple Blossom')
                  const Image(
                    image: NetworkImage(
                        'https://th.bing.com/th/id/OIP.4IWvRU7JIoHvUltqy5ex2gHaE9?w=288&h=193&c=7&r=0&o=5&dpr=1.25&pid=1.7'),
                    height: 120,
                    width: 110,
                    fit: BoxFit.cover,
                  ),
                if (model.name == 'Cherokee Rose')
                  const Image(
                    image: NetworkImage(
                        'https://th.bing.com/th/id/OIP.nQC8nhcoyC-gdcE-RNKGHAHaFk?w=247&h=186&c=7&r=0&o=5&dpr=1.25&pid=1.7'),
                    height: 120,
                    width: 110,
                    fit: BoxFit.cover,
                  ),
              ],
            )
          ]),
        ),
      );
}
