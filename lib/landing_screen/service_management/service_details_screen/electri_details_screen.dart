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
          child: SingleChildScrollView(
            child: Wrap(
              direction: Axis.horizontal,
              textDirection: TextDirection.ltr,
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                plumberCard(
                  serviceName: 'AC switch box installation',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Switch board installation',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Switch board repair',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Switch or socket replacement',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: '15+ Amp switch box',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Celling fan regulator replacement',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Decorative celling fan installation',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Celling fan installation',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Fan repair',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Fan replacement',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Fan uninstallation',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Bulbs installation (up to 6 bulbs)',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Bulb holder installation',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'False celling light installation (per piece)',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Tube light installation',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Fancy light installation',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: '3 phase changeover switch installation',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'MCB fuse replacement',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Single pole MCB installation',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Sub meter installation',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Single phase/3 phase panel board',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Single battery inverter installation',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Double battery inverter installation',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Inverter fuse replacement',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Inverter servicing',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Stabilizer installation',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'TV installation (up to 48 inches)',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'TV installation (above 48 inches)',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'TV uninstallation',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Mini home theatre installation',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Room heater repair',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'New internal wiring (per 5 meter)',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'New wiring with casing (per 5 meter)',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'New wiring without casing (per 5 meter)',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Doorbell installation (1 doorbell)',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Doorbell replacement (1 doorbell)',
                  addOnTap: () {},
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }

  Widget plumberCard({
    required String serviceName,
    required void Function()? addOnTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
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
