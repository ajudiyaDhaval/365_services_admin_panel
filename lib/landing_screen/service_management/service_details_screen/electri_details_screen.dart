import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../tools/responsive_handler.dart';
import '../../../utility/text_field_widget.dart';
import '../../../utility/ui_color.dart';
import '../widgets/service_management_widget.dart';

class ElecDetailsScreen extends StatelessWidget {
  const ElecDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveWidget(
        mobile: buildColumn(context),
        desktop: buildColumn(context),
      ),
    );
  }

  Column buildColumn(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 37.h,
          color: Colors.grey.shade800,
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              IconButton(
                color: Colors.white,
                icon: const Icon(Icons.arrow_back_outlined),
                onPressed: () => Navigator.pop(context),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Electrician Service',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 285,
              crossAxisSpacing: 15,
              mainAxisExtent: 50,
              mainAxisSpacing: 15,
            ),
            itemCount: 10,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(top: 10.h, left: 6.w, right: 6.w),
                child: Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 2.w,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            'Shower filter wall mounter',
                            style: TextStyle(
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.h),
                            child: buildTextFieldWidget1(
                              hintText: 'Price',
                              controller: TextEditingController(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        _addButtons(
          onPressed: () async {},
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }

  Widget _addButtons({
    VoidCallback? onPressed,
  }) {
    return ElevatedButton(
      child: const Text('Add'),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(
          horizontal: 80.w,
          vertical: 10.h,
        )),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(UiColors.themeColor),
        foregroundColor:
            MaterialStateProperty.all(UiColors.logInButtonForeground),
        textStyle: MaterialStateProperty.all(ServiceManagement.textStyle),
      ),
      onPressed: onPressed,
    );
  }

  Widget buildTextFieldWidget1({
    TextEditingController? controller,
    String? text,
    String? hintText,
  }) {
    return SizedBox(
      width: 80.w,
      height: 60,
      child: TextFieldWidget(
        controller: controller!,
        labelText: text ?? "",
        hintText: hintText,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value!.isEmpty) {
            return "Field can't be empty";
          }
          return null;
        },
      ),
    );
  }
}
