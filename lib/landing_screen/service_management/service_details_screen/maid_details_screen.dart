import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../tools/responsive_handler.dart';
import '../../../utility/text_field_widget.dart';
import '../../../utility/ui_color.dart';
import '../widgets/service_management_widget.dart';

class MaidDetailScreen extends StatefulWidget {
  MaidDetailScreen({Key? key}) : super(key: key);

  @override
  State<MaidDetailScreen> createState() => _MaidDetailScreenState();
}

class _MaidDetailScreenState extends State<MaidDetailScreen> {
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
                        'Work Specification',
                        style: TextStyle(color: Colors.grey),
                      ),
                      value: workSpecification,
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
                          workSpecification = v;
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
                maidCard(
                  serviceName: '1 Time Service - 1 BHK',
                  addOnTap: () {},
                ),
                maidCard(
                  serviceName: '1 Time Service - 2 BHK',
                  addOnTap: () {},
                ),
                maidCard(
                  serviceName: '1 Time Service - 3 BHK',
                  addOnTap: () {},
                ),
                maidCard(
                  serviceName: '1 Time Service - 4 BHK',
                  addOnTap: () {},
                ),
                maidCard(
                  serviceName: '1 Time Service - 5 BHK',
                  addOnTap: () {},
                ),
                maidCard(
                  serviceName: '2 Time Service - 1 BHK',
                  addOnTap: () {},
                ),
                maidCard(
                  serviceName: '2 Time Service - 2 BHK',
                  addOnTap: () {},
                ),
                maidCard(
                  serviceName: '2 Time Service - 3 BHK',
                  addOnTap: () {},
                ),
                maidCard(
                  serviceName: '2 Time Service - 4 BHK',
                  addOnTap: () {},
                ),
                maidCard(
                  serviceName: '2 Time Service - 5 BHK',
                  addOnTap: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget maidCard({
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

class Lst {
  List<Object> Gender_lst = ['Male', 'Female'];
  List<Object> Work_Spe_lst = ['Sweeping', 'Mopping', 'Dishwashing', 'Dusting'];
  List<Object> Work_mopp_lst = ['3 time a week', '7 time a week'];
  List<Object> Work__dust_lst = [
    'Once a week',
    '4 Time a week',
    '5 Time a week',
    '6 Time a week',
    '7 Time a week'
  ];
  List<Object> no_people_lst = [
    '01 to 02',
    '03 to 04',
    '05 to 06',
    '07 to 08',
    '09 to 10',
  ];
  List<Object> pew_Timing_lst = [
    '06:00am to 10:00pm',
    '12:00am to 03:00pm',
    '04:00am to 08:00pm'
  ];
}
