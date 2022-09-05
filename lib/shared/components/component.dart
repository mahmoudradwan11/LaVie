import 'package:flutter/material.dart';
import 'package:la_vie/shared/styles/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget builtDivider() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        color: Colors.grey,
        height: 1.0,
        width: double.infinity,
      ),
    );
Widget textField({
  required TextEditingController controller,
  required TextInputType keyboard,
  required var valid,
  required String label,
  required IconData prefix,
  //IconData? suffix,
  bool show = true,
  var tap,
  var onchange,
  var onSubmit,
  var suffix,
  var suffixPress,
  var labelStyle,
}) =>
    TextFormField(
      validator: valid,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: labelStyle,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: defaultColor),
          // borderRadius: BorderRadius.circular(30),
        ),
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(icon: Icon(suffix), onPressed: suffixPress)
            : null,
      ),
      keyboardType: keyboard,
      onFieldSubmitted: onSubmit,
      onChanged: onchange,
      obscureText: show,
      onTap: tap,
    );
void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (Route<dynamic> route) => false,
    );

var uId;
PreferredSizeWidget defaultAppBar({
  required BuildContext context,
  String? title,
  List<Widget>? actions,
}) =>
    AppBar(
      titleSpacing: 5.0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_circle_left_rounded),
      ),
      title: Text(
        title!,
      ),
      actions: actions,
    );

Widget defButton({
  double width = double.infinity,
  double heigth = 40.0,
  bool isUpper = true,
  required var function,
  required String text,
}) =>
    Container(
      height: heigth,
      width: width,
      decoration: BoxDecoration(
        color: defaultColor,
        // borderRadius: BorderRadius.circular(30),
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpper ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

Widget textButton({
  required String text,
  required var function,
}) =>
    TextButton(
      onPressed: function,
      child: Text(text.toUpperCase()),
    );
Widget listItem(
  model,
  context, {
  bool isOldPrice = true,
}) =>
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 120,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(model.image),
                  width: 120,
                  height: 120,
                ),
                if (model.discount != 0 && isOldPrice)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    color: Colors.red,
                    child: const Text(
                      'Discount',
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  )
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14.0, height: 1.3),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        "${model.price}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12.0, color: defaultColor),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      if (model.discount != 0 && isOldPrice)
                        Text(
                          "${model.oldPrice}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 10.0,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                      const Spacer(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

void showToast(String message, ToastStates state) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: chooseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

enum ToastStates {
  SUCCESS,
  ERROR,
  WARNING,
}

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.yellow;
      break;
  }
  return color;
}
const PVSpace0 = SizedBox(width: 0.0, height: 0.0);
const PVSpace5 = SizedBox(width: 0.0, height: 5.0);
const PVSpace10 = SizedBox(width: 0.0, height: 10.0);
const PVSpace20 = SizedBox(width: 0.0, height: 20.0);
const PVSpace25 = SizedBox(width: 0.0, height: 25.0);
const PVSpace30 = SizedBox(width: 0.0, height: 30.0);
const PVSpace40 = SizedBox(width: 0.0, height: 40.0);
const PVSpace50 = SizedBox(width: 0.0, height: 50.0);
const PVSpace60 = SizedBox(width: 0.0, height: 60.0);
const PVSpace70 = SizedBox(width: 0.0, height: 70.0);
const PVSpace80 = SizedBox(width: 0.0, height: 80.0);

// Horizontal widget spaces
const PHSpace0 = SizedBox(width: 0.0, height: 0.0);
const PHSpace5 = SizedBox(width: 5.0, height: 0.0);
const PHSpace10 = SizedBox(width: 10.0, height: 0.0);
const PHSpace20 = SizedBox(width: 20.0, height: 0.0);
const PHSpace25 = SizedBox(width: 25.0, height: 0.0);
const PHSpace30 = SizedBox(width: 30.0, height: 0.0);
const PHSpace40 = SizedBox(width: 40.0, height: 0.0);
const PHSpace50 = SizedBox(width: 50.0, height: 0.0);
const PHSpace60 = SizedBox(width: 60.0, height: 0.0);
const PHSpace70 = SizedBox(width: 70.0, height: 0.0);
const PHSpace80 = SizedBox(width: 80.0, height: 0.0);
const PHSpace120 = SizedBox(width: 120.0, height: 0.0);
Widget buildTextForm(
    BuildContext context,
    String title,
    double height, {
      TextEditingController? buttonController,
    }) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 16.0),
      ),
      PVSpace10,
      Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(color: PGray300, width: 1.0),
        ),
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextField(
            controller: buttonController,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    ],
  );
}