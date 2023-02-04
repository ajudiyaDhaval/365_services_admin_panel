import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../tools/responsive_handler.dart';
import '../../../utility/text_field_widget.dart';
import '../../../utility/ui_color.dart';
import '../widgets/service_management_widget.dart';
import 'maid_details_screen.dart';

class CookDetailsScreen extends StatefulWidget {
  CookDetailsScreen({Key? key}) : super(key: key);

  @override
  State<CookDetailsScreen> createState() => _CookDetailsScreenState();
}

class _CookDetailsScreenState extends State<CookDetailsScreen> {
  Object? gender;

  Object? workSpecification;

  Object? preferenceTiming;

  Lst lists = Lst();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveWidget(
        mobile: buildColumn(context),
        desktop: buildColumn(context),
      ),
    );
  }

  Widget buildColumn(BuildContext context) {
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
                'Maid Service',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                ),
              )
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Card(
                color: Colors.white.withOpacity(0.3),
                child: SizedBox(
                  height: 40.h,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: DropdownButton(
                      underline: const SizedBox(),
                      isExpanded: true,
                      iconEnabledColor: Colors.white,
                      hint: const Text(
                        'Gender Preferences',
                        style: TextStyle(color: Colors.grey),
                      ),
                      value: gender,
                      items: lists.Work_Spe_lst.map((Object? items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (v) {
                        setState(() {
                          gender = v;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Card(
                color: Colors.white.withOpacity(0.3),
                child: SizedBox(
                  height: 40.h,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: DropdownButton(
                      underline: const SizedBox(),
                      isExpanded: true,
                      iconEnabledColor: Colors.white,
                      hint: const Text(
                        'Preference Timing',
                        style: TextStyle(color: Colors.grey),
                      ),
                      value: preferenceTiming,
                      items: lists.pew_Timing_lst.map((Object? items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (v) {
                        setState(() {
                          preferenceTiming = v;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Wrap(
              direction: Axis.horizontal,
              textDirection: TextDirection.ltr,
              spacing: 10.h,
              runSpacing: 8.0,
              children: [
                cookCard(
                  serviceName: '1 Person - 1 Time',
                  addOnTap: () {},
                ),
                cookCard(
                  serviceName: '1 Person - 2 Time',
                  addOnTap: () {},
                ),
                cookCard(
                  serviceName: '2 Person - 1 Time',
                  addOnTap: () {},
                ),
                cookCard(
                  serviceName: '2 Person - 2 Time',
                  addOnTap: () {},
                ),
                cookCard(
                  serviceName: '3 Person - 1 Time',
                  addOnTap: () {},
                ),
                cookCard(
                  serviceName: '3 Person - 2 Time',
                  addOnTap: () {},
                ),
                cookCard(
                  serviceName: '4 Person - 1 Time',
                  addOnTap: () {},
                ),
                cookCard(
                  serviceName: '4 Person - 2 Time',
                  addOnTap: () {},
                ),
                cookCard(
                  serviceName: '5 Person - 1 Time',
                  addOnTap: () {},
                ),
                cookCard(
                  serviceName: '5 Person - 1 Time',
                  addOnTap: () {},
                ),
                cookCard(
                  serviceName: '6 Person - 1 Time',
                  addOnTap: () {},
                ),
                cookCard(
                  serviceName: '6 Person - 2 Time',
                  addOnTap: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget cookCard({
    required String serviceName,
    required void Function()? addOnTap,
  }) {
    return Container(
      width: 250.w,
      height: 155.h,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Card(
            color: Colors.white.withOpacity(0.3),
            child: SizedBox(
              width: double.infinity,
              height: 40.h,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 2.w,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    serviceName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 2.w,
              vertical: 2.h,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: buildTextFieldWidget1(
                controller: TextEditingController(),
              ),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          _addButtons(
            onPressed: addOnTap,
          ),
        ],
      ),
    );
  }

  Widget _addButtons({
    VoidCallback? onPressed,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: SizedBox(
        width: double.infinity,
        height: 40.h,
        child: ElevatedButton(
          child: const Text('Add'),
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(UiColors.themeColor),
            foregroundColor:
                MaterialStateProperty.all(UiColors.logInButtonForeground),
            textStyle: MaterialStateProperty.all(ServiceManagement.textStyle),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }

  Widget buildTextFieldWidget1({
    TextEditingController? controller,
    String? text,
    String? hintText,
  }) {
    return SizedBox(
      height: 40.h,
      child: TextFieldWidget(
        controller: controller!,
        labelText: text ?? "",
        hintText: 'Price',
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
