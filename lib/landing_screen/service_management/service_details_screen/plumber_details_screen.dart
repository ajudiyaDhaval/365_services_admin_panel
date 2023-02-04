import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:service365_admin_panel/tools/responsive_handler.dart';

import '../../../utility/text_field_widget.dart';
import '../../../utility/ui_color.dart';
import '../widgets/service_management_widget.dart';

class PlumberDetailsScreen extends StatelessWidget {
  PlumberDetailsScreen({Key? key}) : super(key: key);

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
                'Plumber Service',
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
                  serviceName: 'Waste pipe leakage (1 piece)',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Wash basin blockage removal',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Wash basin installation',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Bathroom tile gap filling',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Kitchen tile gap filling',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Mirror fitting installation',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Shower installation (wall mounted/hand held)',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Shower installation (celling mounted)',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Drainage pipe blockage removal',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Balcony drain blockage removal',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Drain cover installation',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Flush tank repair (external ceramic)',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Flush tank replacement',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Flush tank repair (external PVC)',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Flush tank repair (conceal in wall)',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Western toilet installation (floor mounted)',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Western toilet repair',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Floor mounted western toilet replacement',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Western toilet installation (wall mounted)',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Wall western toilet replacement',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Indian toilet installation',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Toilet pot blockage removal',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Toilet seat cover replacement',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Jet spray installation/repair',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Hot & cold-water mixtures repair',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Tap repair',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Tap replacement',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Hot & cold-water mixtures installation',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Water saving nozzle',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Underground tank cleaning (up to 3000L)',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Pipeline leakage repair',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Water meter installation',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Motor installation (1 unit up to 1HP)',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Motor replacement (1 unit up to 1HP)',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Motor air cavity removal (1 unit up to 1HP)',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Connection hose installation (1 unit)',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Washing machine inlet installation',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Tap filter installation',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Shower filter installation',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Washing machine filter',
                  addOnTap: () {},
                ),
                plumberCard(
                  serviceName: 'Shower filter- wall mounter',
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
