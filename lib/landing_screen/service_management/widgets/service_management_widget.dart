import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:service365_admin_panel/constant/colors/base_screen_color.dart';
import 'package:service365_admin_panel/landing_screen/dashboard/widgets/header.dart';
import 'package:service365_admin_panel/landing_screen/service_management/logic/city_manager/city_manager_cubit.dart';
import 'package:service365_admin_panel/landing_screen/service_management/logic/pick_service_image/pick_service_image_cubit.dart';
import 'package:service365_admin_panel/landing_screen/service_management/logic/service_manager/service_cubit.dart';
import 'package:service365_admin_panel/landing_screen/service_management/model/city_model.dart';
import 'package:service365_admin_panel/landing_screen/service_management/model/service_model.dart';
import 'package:service365_admin_panel/landing_screen/service_management/widgets/add_city_dialog.dart';
import 'package:service365_admin_panel/landing_screen/service_management/widgets/add_service_dialog.dart';
import 'package:service365_admin_panel/tools/responsive_handler.dart';
import 'package:service365_admin_panel/utility/spinloading_indicator.dart';

import '../../../utility/text_field_widget.dart';
import '../../../utility/ui_color.dart';

class ServiceManagementWidget extends StatelessWidget {
  const ServiceManagementWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _deviceSize = MediaQuery.of(context).size;
    final _serviceTextFontStyle = GoogleFonts.poppins(
        textStyle: TextStyle(
      color: BaseScreenColor.pageTitleTextfontColor,
      // fontSize: ((ResponsiveWidget.isDesktop(context) ? 12 : 10)),
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
    ));
    final _diologBodyTextFontStyle = GoogleFonts.poppins(
        textStyle: TextStyle(
      color: BaseScreenColor.pageTitleTextfontColor,
      // fontSize: ((ResponsiveWidget.isDesktop(context) ? 12 : 10)),
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
    ));
    final _diologHeadingTextFontStyle = GoogleFonts.poppins(
        textStyle: TextStyle(
      color: BaseScreenColor.pageTitleTextfontColor,
      // fontSize: ((ResponsiveWidget.isDesktop(context) ? 12 : 10)),
      fontSize: 15.sp,
      fontWeight: FontWeight.w600,
    ));
    final _diologActionTextFontStyle = GoogleFonts.poppins(
        textStyle: TextStyle(
      color: BaseScreenColor.pageTitleTextfontColor,
      // fontSize: ((ResponsiveWidget.isDesktop(context) ? 12 : 10)),
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
    ));

    return ResponsiveWidget(
      mobile: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(width: _deviceSize.height * 0.01),
            ServiceManagement(
              deviceSize: _deviceSize,
              serviceTextFontStyle: _serviceTextFontStyle,
              diologHeadingTextFontStyle: _diologHeadingTextFontStyle,
              diologBodyTextFontStyle: _diologBodyTextFontStyle,
              diologActionTextFontStyle: _diologActionTextFontStyle,
            ),
            SizedBox(height: _deviceSize.height * 0.02),
            CityManagement(
              deviceSize: _deviceSize,
              serviceTextFontStyle: _serviceTextFontStyle,
              diologHeadingTextFontStyle: _diologHeadingTextFontStyle,
              diologBodyTextFontStyle: _diologBodyTextFontStyle,
              diologActionTextFontStyle: _diologActionTextFontStyle,
            ),
          ],
        ),
      ),
      desktop: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(width: _deviceSize.width * 0.01),
            ServiceManagement(
              deviceSize: _deviceSize,
              serviceTextFontStyle: _serviceTextFontStyle,
              diologHeadingTextFontStyle: _diologHeadingTextFontStyle,
              diologBodyTextFontStyle: _diologBodyTextFontStyle,
              diologActionTextFontStyle: _diologActionTextFontStyle,
            ),
            SizedBox(width: _deviceSize.width * 0.01),
            CityManagement(
              deviceSize: _deviceSize,
              serviceTextFontStyle: _serviceTextFontStyle,
              diologHeadingTextFontStyle: _diologHeadingTextFontStyle,
              diologBodyTextFontStyle: _diologBodyTextFontStyle,
              diologActionTextFontStyle: _diologActionTextFontStyle,
            ),
          ],
        ),
      ),
    );
  }
}

class CityManagement extends StatelessWidget {
  const CityManagement({
    Key? key,
    required Size deviceSize,
    required TextStyle serviceTextFontStyle,
    required TextStyle diologHeadingTextFontStyle,
    required TextStyle diologBodyTextFontStyle,
    required TextStyle diologActionTextFontStyle,
  })  : _deviceSize = deviceSize,
        _serviceTextFontStyle = serviceTextFontStyle,
        _diologHeadingTextFontStyle = diologHeadingTextFontStyle,
        _diologBodyTextFontStyle = diologBodyTextFontStyle,
        _diologActionTextFontStyle = diologActionTextFontStyle,
        super(key: key);

  final Size _deviceSize;
  final TextStyle _serviceTextFontStyle;
  final TextStyle _diologHeadingTextFontStyle;
  final TextStyle _diologBodyTextFontStyle;
  final TextStyle _diologActionTextFontStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black45,
      // width: _deviceSize.width *
      //     (ResponsiveWidget.isDesktop(context)
      //         ? 0.4
      //         : (ResponsiveWidget.isTablet(context) ? 0.6 : 1)),
      width: 540.w,
      child: Column(
        children: [
          Header(
            title: 'CITY MANAGEMENT',
            buttonName: 'Add City',
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (dialogContext) {
                  return StatefulBuilder(builder: (dialogContext, setState) {
                    return AlertDialog(
                      title: Text(
                        'Add City',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                        ),
                      ),
                      content: const AddCityDialogWidget(),
                    );
                  });
                },
              );
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _deviceSize.width * 0.05),
            child: StreamBuilder<List<CityModel?>>(
              stream: BlocProvider.of<CityManagerCubit>(context)
                  .fetchCity(context: context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                    height: _deviceSize.height * 0.6,
                    width: _deviceSize.width *
                        (ResponsiveWidget.isDesktop(context) ? 0.3 : 0.6),
                    child: const Center(
                      child: SpinLoadingIndicator(),
                    ),
                  );
                } else {
                  final logs = snapshot.data ?? [];
                  //print(logs);
                  if (logs.isEmpty) {
                    return SizedBox(
                      // height: _deviceSize.height * 0.6,
                      // width: _deviceSize.width *
                      //     (ResponsiveWidget.isDesktop(context) ? 0.3 : 0.6),
                      height: 400.h,
                      width: 150.w,
                      child: Center(
                        child: Text(
                          'No city available',
                          style: TextStyle(
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    );
                  } else {
                    return SizedBox(
                      // height: _deviceSize.height * 0.6,
                      // width: _deviceSize.width *
                      //     (ResponsiveWidget.isDesktop(context) ? 0.3 : 0.8),
                      height: 400.h,
                      width: 500.w,
                      child: ListView.builder(
                          controller: ScrollController(),
                          itemCount: logs.length,
                          itemBuilder: (context, index) {
                            return Column(children: [
                              const Divider(),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      logs[index]?.cityName ?? 'N/A',
                                      style: _serviceTextFontStyle,
                                    ),
                                    Wrap(
                                      children: [
                                        IconButton(
                                          onPressed: () async {
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return StatefulBuilder(builder:
                                                    (dialogContext, setState) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                      'Edit City',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    content:
                                                        AddCityDialogWidget(
                                                      cityModel: logs[index],
                                                    ),
                                                  );
                                                });
                                              },
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.edit,
                                            size: 20,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (ctx) => AlertDialog(
                                                title: Text(
                                                  "Are you sure!",
                                                  style:
                                                      _diologHeadingTextFontStyle,
                                                ),
                                                content: Text(
                                                  "You are about to delete the city ${logs[index]?.cityName}!",
                                                  style:
                                                      _diologBodyTextFontStyle,
                                                ),
                                                actions: [
                                                  TextButton(
                                                    style: TextButton.styleFrom(
                                                      primary: Colors.white,
                                                    ),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text(
                                                      'No',
                                                      style:
                                                          _diologActionTextFontStyle,
                                                    ),
                                                  ),
                                                  TextButton(
                                                    style: TextButton.styleFrom(
                                                      primary: Colors.white,
                                                    ),
                                                    onPressed: () async {
                                                      Navigator.of(context)
                                                          .pop();
                                                      await BlocProvider.of<
                                                                  CityManagerCubit>(
                                                              context)
                                                          .deleteCity(
                                                        cityModel: logs[index]!,
                                                        context: context,
                                                      );
                                                    },
                                                    child: Text(
                                                      'Yes',
                                                      style:
                                                          _diologActionTextFontStyle,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            size: 22,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                              const Divider(),
                            ]);
                          }),
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceManagement extends StatefulWidget {
  ServiceManagement({
    Key? key,
    // this.firstTimeService,
    required Size deviceSize,
    required TextStyle serviceTextFontStyle,
    required TextStyle diologHeadingTextFontStyle,
    required TextStyle diologBodyTextFontStyle,
    required TextStyle diologActionTextFontStyle,
  })  : _deviceSize = deviceSize,
        _serviceTextFontStyle = serviceTextFontStyle,
        _diologHeadingTextFontStyle = diologHeadingTextFontStyle,
        _diologBodyTextFontStyle = diologBodyTextFontStyle,
        _diologActionTextFontStyle = diologActionTextFontStyle,
        super(key: key);

  final Size _deviceSize;
  final TextStyle _serviceTextFontStyle;
  final TextStyle _diologHeadingTextFontStyle;
  final TextStyle _diologBodyTextFontStyle;
  final TextStyle _diologActionTextFontStyle;

  // final FirstTimeServiceModel? firstTimeService;

  static TextStyle textStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontWeight: FontWeight.w600,
      // fontSize: ResponsiveWidget.isMobile(context) ? 12 : 14,
      fontSize: 12.sp,
    ),
  );

  @override
  State<ServiceManagement> createState() => _ServiceManagementState();
}

class _ServiceManagementState extends State<ServiceManagement> {
  final _firstBhk1Controller = TextEditingController();
  final _firstBhk2Controller = TextEditingController();
  final _firstBhk3Controller = TextEditingController();
  final _firstBhk4Controller = TextEditingController();
  final _firstBhk5Controller = TextEditingController();
  final secondBhk1Controller = TextEditingController();
  final secondBhk2Controller = TextEditingController();
  final secondBhk3Controller = TextEditingController();
  final secondBhk4Controller = TextEditingController();
  final secondBhk5Controller = TextEditingController();

  // cook
  final firstCook1Controller = TextEditingController();
  final firstCook2Controller = TextEditingController();
  final firstCook3Controller = TextEditingController();
  final firstCook4Controller = TextEditingController();
  final firstCook5Controller = TextEditingController();
  final firstCook6Controller = TextEditingController();

  // driver
  final driverSmallController = TextEditingController();
  final driverMediumController = TextEditingController();
  final driverSuvController = TextEditingController();
  final driver7SeaterController = TextEditingController();
  final driverCarsController = TextEditingController();

  // Future<void> _submit({
  //   String? id,
  //   String? imageUrl,
  //   String? serviceName,
  // }) async {
  //   if (widget.firstTimeService == null) {
  //     await BlocProvider.of<ServiceCubit>(context).maidPriceService(
  //       context: context,
  //       serviceModel: ServiceModel(
  //         firstTimeServiceModel: FirstTimeServiceModel(
  //           bhk1: _firstBhk1Controller.text,
  //           bhk2: _firstBhk2Controller.text,
  //           bhk3: _firstBhk3Controller.text,
  //           bhk4: _firstBhk4Controller.text,
  //           bhk5: _firstBhk5Controller.text,
  //         ),
  //         secondTimeServiceModel: SecondTimeServiceModel(
  //           bhk1: _firstBhk1Controller.text,
  //           bhk2: _firstBhk2Controller.text,
  //           bhk3: _firstBhk3Controller.text,
  //           bhk4: _firstBhk4Controller.text,
  //           bhk5: _firstBhk5Controller.text,
  //         ),
  //         id: id,
  //         imageUrl: imageUrl,
  //         serviceName: serviceName,
  //       ),
  //     );
  //     //Close the dialog box
  //   } else {
  //     // await BlocProvider.of<ServiceCubit>(context).editService(
  //     //   context: context,
  //     //   service: ServiceModel(firstTimeService: FirstTimeService()),
  //     // );
  //   }
  //   Navigator.of(context).pop();
  // }

  Widget _addButtons({
    String? id,
    String? imageUrl,
    String? serviceName,
    VoidCallback? onPressed,
  }) {
    return ElevatedButton(
      child: const Text('Add'),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(
          // horizontal: _deviceSize.width *
          //     (ResponsiveWidget.isMobile(context) ? 0.1 : 0.05),
          // vertical: _deviceSize.height * 0.02,
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
      // onPressed: () async {
      //   await _submit(
      //     id: id,
      //     imageUrl: imageUrl,
      //     serviceName: serviceName,
      //   );
      // },
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    final _addButton = ElevatedButton(
      child: const Text('Add'),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(
          // horizontal: _deviceSize.width *
          //     (ResponsiveWidget.isMobile(context) ? 0.1 : 0.05),
          // vertical: _deviceSize.height * 0.02,
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
      onPressed: () async {
        //   await _submit();
      },
    );

    return Container(
      color: Colors.black45,
      // width: _deviceSize.width *
      //     (ResponsiveWidget.isDesktop(context)
      //         ? 0.4
      //         : (ResponsiveWidget.isTablet(context) ? 0.6 : 1)),
      width: 540.w,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(
            title: 'SERVICE MANAGEMENT',
            buttonName: 'Add Service',
            onPressed: () async {
              await BlocProvider.of<PickServiceImageCubit>(context)
                  .resetImage();
              await showDialog(
                context: context,
                builder: (dialogContext) {
                  return StatefulBuilder(builder: (dialogContext, setState) {
                    return AlertDialog(
                      title: Text(
                        'Add Service',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                        ),
                      ),
                      content: const AddServiceDialogWidget(),
                    );
                  });
                },
              );
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: widget._deviceSize.width * 0.05),
            child: StreamBuilder<List<ServiceModel?>>(
                stream: BlocProvider.of<ServiceCubit>(context)
                    .fetchService(context: context),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SizedBox(
                      height: widget._deviceSize.height * 0.6,
                      width: widget._deviceSize.width *
                          (ResponsiveWidget.isDesktop(context) ? 0.3 : 0.6),
                      child: const Center(
                        child: SpinLoadingIndicator(),
                      ),
                    );
                  } else {
                    final logs = snapshot.data ?? [];
                    //print(logs);
                    if (logs.isEmpty) {
                      return SizedBox(
                        // height: _deviceSize.height * 0.6,
                        // width: _deviceSize.width *
                        //     (ResponsiveWidget.isDesktop(context) ? 0.3 : 0.6),
                        height: 400.h,
                        width: 150.w,
                        child: Center(
                          child: Text(
                            'No service available',
                            style: TextStyle(
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      );
                    }

                    return SizedBox(
                      // height: _deviceSize.height * 0.6,
                      // width: _deviceSize.width *
                      //     (ResponsiveWidget.isDesktop(context) ? 0.3 : 0.8),
                      height: 400.h,
                      width: 500.w,
                      child: ListView.builder(
                          controller: ScrollController(),
                          itemCount: logs.length,
                          itemBuilder: (context, index) {
                            return Column(children: [
                              const Divider(),
                              GestureDetector(
                                onTap: () async {
                                  print('=====$index');
                                  print('=====${logs[index]?.id}');
                                  _dialog(index, logs);
                                },
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        logs[index]?.serviceName ?? 'N/A',
                                        style: widget._serviceTextFontStyle,
                                      ),
                                      Wrap(
                                        children: [
                                          IconButton(
                                            onPressed: () async {
                                              await BlocProvider.of<
                                                          PickServiceImageCubit>(
                                                      context)
                                                  .resetImage();
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return StatefulBuilder(
                                                      builder: (dialogContext,
                                                          setState) {
                                                    return AlertDialog(
                                                      title: const Text(
                                                        'Edit Service',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      content:
                                                          AddServiceDialogWidget(
                                                        service: logs[index],
                                                      ),
                                                    );
                                                  });
                                                },
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.edit,
                                              size: 20,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder: (ctx) => AlertDialog(
                                                  title: Text(
                                                    "Are you sure!",
                                                    style: widget
                                                        ._diologHeadingTextFontStyle,
                                                  ),
                                                  content: Text(
                                                    "You are about to delete the service ${logs[index]?.serviceName}!",
                                                    style: widget
                                                        ._diologBodyTextFontStyle,
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                        primary: Colors.white,
                                                      ),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text(
                                                        'No',
                                                        style: widget
                                                            ._diologActionTextFontStyle,
                                                      ),
                                                    ),
                                                    TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                        primary: Colors.white,
                                                      ),
                                                      onPressed: () async {
                                                        Navigator.of(context)
                                                            .pop();
                                                        await BlocProvider.of<
                                                                    ServiceCubit>(
                                                                context)
                                                            .deleteService(
                                                          service: logs[index]!,
                                                          context: context,
                                                        );
                                                      },
                                                      child: Text(
                                                        'Yes',
                                                        style: widget
                                                            ._diologActionTextFontStyle,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.delete,
                                              size: 22,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ]),
                              ),
                              const Divider(),
                            ]);
                          }),
                    );
                  }
                }),
          )
        ],
      ),
    );
  }

  Text buildText(List<ServiceModel?> logs, int index) {
    return Text(
      '${logs[index]?.serviceName ?? 'N/A'} Service',
      style: TextStyle(
        color: Colors.white,
        fontSize: 15.sp,
      ),
    );
  }

  Widget buildTextFieldWidget({
    TextEditingController? controller,
    String? text,
    String? hintText,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
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

  Future<void> _dialog(index, logs) async {
    switch (index) {
      case 0:
        await showDialog(
          context: context,
          builder: (dialogContext) {
            return StatefulBuilder(
              builder: (dialogContext, setState) {
                return AlertDialog(
                  title: buildText(logs, index),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppText("1 BHK"),
                      Row(
                        children: [
                          Expanded(
                            child: buildTextFieldWidget(
                              controller: _firstBhk1Controller,
                              text: '1 time Service',
                              hintText: '1 BHK',
                            ),
                          ),
                          Expanded(
                            child: buildTextFieldWidget(
                              controller: secondBhk1Controller,
                              text: '2 time Service',
                              hintText: '1 BHK',
                            ),
                          ),
                        ],
                      ),
                      AppText("2 BHK"),
                      Row(
                        children: [
                          Expanded(
                            child: buildTextFieldWidget(
                              controller: _firstBhk2Controller,
                              text: '1 time Service',
                              hintText: '2 BHK',
                            ),
                          ),
                          Expanded(
                            child: buildTextFieldWidget(
                              controller: secondBhk2Controller,
                              text: '2 time Service',
                              hintText: '2 BHK',
                            ),
                          ),
                        ],
                      ),
                      AppText("3 BHK"),
                      Row(
                        children: [
                          Expanded(
                            child: buildTextFieldWidget(
                              controller: _firstBhk3Controller,
                              text: '1 time Service',
                              hintText: '3 BHK',
                            ),
                          ),
                          Expanded(
                            child: buildTextFieldWidget(
                              controller: secondBhk3Controller,
                              text: '2 time Service',
                              hintText: '3 BHK',
                            ),
                          ),
                        ],
                      ),
                      AppText("4 BHK"),
                      Row(
                        children: [
                          Expanded(
                            child: buildTextFieldWidget(
                              controller: _firstBhk4Controller,
                              text: '1 time Service',
                              hintText: '4 BHK',
                            ),
                          ),
                          Expanded(
                            child: buildTextFieldWidget(
                              controller: secondBhk4Controller,
                              text: '2 time Service',
                              hintText: '4 BHK',
                            ),
                          ),
                        ],
                      ),
                      AppText("5 BHK"),
                      Row(
                        children: [
                          Expanded(
                            child: buildTextFieldWidget(
                              controller: _firstBhk5Controller,
                              text: '1 time Service',
                              hintText: '5 BHK',
                            ),
                          ),
                          Expanded(
                            child: buildTextFieldWidget(
                              controller: secondBhk5Controller,
                              text: '2 time Service',
                              hintText: '5 BHK',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      _addButtons(
                        // id: logs[index]?.id ?? "",
                        // serviceName: logs[index]?.serviceName ?? "",
                        // imageUrl: logs[index]?.imageUrl ?? "",
                        onPressed: () async {
                          // if (widget.firstTimeService == null) {
                          await BlocProvider.of<ServiceCubit>(context)
                              .maidPriceService(
                            context: context,
                            // id: logs[index]?.id ?? "",
                            maidService: MaidService(
                              serviceName: "Maid Service",
                              bhk1: _firstBhk1Controller.text,
                              bhk2: _firstBhk2Controller.text,
                              bhk3: _firstBhk3Controller.text,
                              bhk4: _firstBhk4Controller.text,
                              bhk5: _firstBhk5Controller.text,
                              bhk1_2: secondBhk1Controller.text,
                              bhk2_2: secondBhk2Controller.text,
                              bhk3_2: secondBhk3Controller.text,
                              bhk4_2: secondBhk4Controller.text,
                              bhk5_2: secondBhk5Controller.text,
                            ),
                            // secondTimeServiceModel: SecondTimeServiceModel(
                            //   bhk1: _firstBhk1Controller.text,
                            //   bhk2: _firstBhk2Controller.text,
                            //   bhk3: _firstBhk3Controller.text,
                            //   bhk4: _firstBhk4Controller.text,
                            //   bhk5: _firstBhk5Controller.text,
                            // ),
                            // imageUrl: logs[index]?.imageUrl ?? "",
                            // serviceName: logs[index]?.serviceName ?? "",
                            // ),
                          );
                          //Close the dialog box
                          // } else {
                          // await BlocProvider.of<ServiceCubit>(context).editService(
                          //   context: context,
                          //   service: ServiceModel(firstTimeService: FirstTimeService()),
                          // );
                          // }
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
        break;
      // case 1:
      //   await showDialog(
      //     context: context,
      //     builder: (dialogContext) {
      //       return StatefulBuilder(
      //         builder: (dialogContext, setState) {
      //           return AlertDialog(
      //             title: buildText(logs, index),
      //             content: Column(
      //               mainAxisSize: MainAxisSize.min,
      //               children: [
      //                 buildTextFieldWidget(
      //                   controller: firstCook1Controller,
      //                   text: '1 COOK',
      //                   hintText: '1 COOK',
      //                 ),
      //                 buildTextFieldWidget(
      //                   controller: firstCook2Controller,
      //                   text: '2 COOK',
      //                   hintText: '2 COOK',
      //                 ),
      //                 buildTextFieldWidget(
      //                   controller: firstCook3Controller,
      //                   text: '3 COOK',
      //                   hintText: '3 COOK',
      //                 ),
      //                 buildTextFieldWidget(
      //                   controller: firstCook4Controller,
      //                   text: '4 COOK',
      //                   hintText: '4 COOK',
      //                 ),
      //                 buildTextFieldWidget(
      //                   controller: firstCook5Controller,
      //                   text: '5 COOK',
      //                   hintText: '5 COOK',
      //                 ),
      //                 buildTextFieldWidget(
      //                   controller: firstCook6Controller,
      //                   text: '6 COOK',
      //                   hintText: '6 COOK',
      //                 ),
      //                 SizedBox(
      //                   height: 2.h,
      //                 ),
      //                 _addButtons(
      //                   // id: logs[index]?.id ?? "",
      //                   // serviceName: logs[index]?.serviceName ?? "",
      //                   // imageUrl: logs[index]?.imageUrl ?? "",
      //                   onPressed: () async {
      //                     if (widget.firstTimeService == null) {
      //                       await BlocProvider.of<ServiceCubit>(context)
      //                           .addCookPriceService(
      //                         context: context,
      //                         id: logs[index]?.id ?? "",
      //                         serviceModel: ServiceModel(
      //                           cookFirstServiceModel: CookFirstServiceModel(
      //                             firstPerson1: firstCook1Controller.text,
      //                             firstPerson2: firstCook2Controller.text,
      //                             firstPerson3: firstCook3Controller.text,
      //                             firstPerson4: firstCook4Controller.text,
      //                             firstPerson5: firstCook5Controller.text,
      //                             firstPerson6: firstCook6Controller.text,
      //                           ),
      //                           cookSecondTimeServiceModel:
      //                               CookSecondTimeServiceModel(
      //                             secondPerson1: firstCook1Controller.text,
      //                             secondPerson2: firstCook2Controller.text,
      //                             secondPerson3: firstCook3Controller.text,
      //                             secondPerson4: firstCook4Controller.text,
      //                             secondPerson5: firstCook5Controller.text,
      //                             secondPerson6: firstCook6Controller.text,
      //                           ),
      //                           imageUrl: logs[index]?.imageUrl ?? "",
      //                           serviceName: logs[index]?.serviceName ?? "",
      //                         ),
      //                       );
      //                       //Close the dialog box
      //                     } else {
      //                       // await BlocProvider.of<ServiceCubit>(context).editService(
      //                       //   context: context,
      //                       //   service: ServiceModel(firstTimeService: FirstTimeService()),
      //                       // );
      //                     }
      //                     Navigator.of(context).pop();
      //                   },
      //                 ),
      //               ],
      //             ),
      //           );
      //         },
      //       );
      //     },
      //   );
      //   break;
      // case 2:
      //   await showDialog(
      //     context: context,
      //     builder: (dialogContext) {
      //       return StatefulBuilder(
      //         builder: (dialogContext, setState) {
      //           return AlertDialog(
      //             title: buildText(logs, index),
      //             content: Column(
      //               mainAxisSize: MainAxisSize.min,
      //               children: [
      //                 buildTextFieldWidget(
      //                   controller: driverSmallController,
      //                   text: 'Small',
      //                   hintText: 'Small',
      //                 ),
      //                 buildTextFieldWidget(
      //                   controller: driverMediumController,
      //                   text: 'Medium/Sedan',
      //                   hintText: 'Medium/Sedan',
      //                 ),
      //                 buildTextFieldWidget(
      //                   controller: driverSuvController,
      //                   text: 'Compact SUV',
      //                   hintText: 'Compact SUV',
      //                 ),
      //                 buildTextFieldWidget(
      //                   controller: driver7SeaterController,
      //                   text: 'SUV 7Seater',
      //                   hintText: 'SUV 7Seater',
      //                 ),
      //                 buildTextFieldWidget(
      //                   controller: driverCarsController,
      //                   text: 'Luxury Cars',
      //                   hintText: 'Luxury Cars',
      //                 ),
      //                 SizedBox(
      //                   height: 2.h,
      //                 ),
      //                 _addButtons(
      //                   id: logs[index]?.id ?? "",
      //                   serviceName: logs[index]?.serviceName ?? "",
      //                   imageUrl: logs[index]?.imageUrl ?? "",
      //                   onPressed: () async {
      //                     if (widget.firstTimeService == null) {
      //                       await BlocProvider.of<ServiceCubit>(context)
      //                           .addCookPriceService(
      //                         context: context,
      //                         id: logs[index]?.id ?? "",
      //                         serviceModel: ServiceModel(
      //                           driverModel: DriverModel(
      //                             driverSmall: driverSmallController.text,
      //                             driverMedium: driverMediumController.text,
      //                             driverSuv: driverSuvController.text,
      //                             driver7Seater: driver7SeaterController.text,
      //                             driverCars: driverCarsController.text,
      //                           ),
      //                           imageUrl: logs[index]?.imageUrl ?? "",
      //                           serviceName: logs[index]?.serviceName ?? "",
      //                         ),
      //                       );
      //                       //Close the dialog box
      //                     } else {
      //                       // await BlocProvider.of<ServiceCubit>(context).editService(
      //                       //   context: context,
      //                       //   service: ServiceModel(firstTimeService: FirstTimeService()),
      //                       // );
      //                     }
      //                     Navigator.of(context).pop();
      //                   },
      //                 ),
      //               ],
      //             ),
      //           );
      //         },
      //       );
      //     },
      //   );
      //   break;
      // case 3:
      //   await showDialog(
      //     context: context,
      //     builder: (dialogContext) {
      //       return StatefulBuilder(
      //         builder: (dialogContext, setState) {
      //           return AlertDialog(
      //             title: buildText(logs, index),
      //             content: Column(
      //               mainAxisSize: MainAxisSize.min,
      //               children: [
      //                 buildTextFieldWidget(
      //                   controller: _firstBhk1Controller,
      //                   text: '1 BHK',
      //                   hintText: '1 BHK',
      //                 ),
      //                 buildTextFieldWidget(
      //                   controller: _firstBhk2Controller,
      //                   text: '2 BHK',
      //                   hintText: '2 BHK',
      //                 ),
      //                 SizedBox(
      //                   height: 2.h,
      //                 ),
      //                 _addButton,
      //               ],
      //             ),
      //           );
      //         },
      //       );
      //     },
      //   );
      //   break;
      // case 4:
      //   await showDialog(
      //     context: context,
      //     builder: (dialogContext) {
      //       return StatefulBuilder(
      //         builder: (dialogContext, setState) {
      //           return AlertDialog(
      //             title: buildText(logs, index),
      //             content: Column(
      //               mainAxisSize: MainAxisSize.min,
      //               children: [
      //                 buildTextFieldWidget(
      //                   controller: _firstBhk1Controller,
      //                   text: '1 BHK',
      //                   hintText: '1 BHK',
      //                 ),
      //                 buildTextFieldWidget(
      //                   controller: _firstBhk2Controller,
      //                   text: '2 BHK',
      //                   hintText: '2 BHK',
      //                 ),
      //                 SizedBox(
      //                   height: 2.h,
      //                 ),
      //                 _addButton,
      //               ],
      //             ),
      //           );
      //         },
      //       );
      //     },
      //   );
      //   break;
      // case 5:
      //   await showDialog(
      //     context: context,
      //     builder: (dialogContext) {
      //       return StatefulBuilder(
      //         builder: (dialogContext, setState) {
      //           return AlertDialog(
      //             title: buildText(logs, index),
      //             content: Column(
      //               mainAxisSize: MainAxisSize.min,
      //               children: [
      //                 buildTextFieldWidget(
      //                   controller: _firstBhk1Controller,
      //                   text: '1 BHK',
      //                   hintText: '1 BHK',
      //                 ),
      //                 buildTextFieldWidget(
      //                   controller: _firstBhk2Controller,
      //                   text: '2 BHK',
      //                   hintText: '2 BHK',
      //                 ),
      //                 SizedBox(
      //                   height: 2.h,
      //                 ),
      //                 _addButton,
      //               ],
      //             ),
      //           );
      //         },
      //       );
      //     },
      //   );
      //   break;
      // default:
      //   showDialog(
      //     context: context,
      //     builder: (dialogContext) {
      //       return StatefulBuilder(
      //         builder: (dialogContext, setState) {
      //           return AlertDialog(
      //             title: buildText(logs, index),
      //             content: Column(
      //               mainAxisSize: MainAxisSize.min,
      //               children: [
      //                 buildTextFieldWidget(
      //                   controller: _firstBhk1Controller,
      //                   text: '1 BHK',
      //                   hintText: '1 BHK',
      //                 ),
      //                 buildTextFieldWidget(
      //                   controller: _firstBhk2Controller,
      //                   text: '2 BHK',
      //                   hintText: '2 BHK',
      //                 ),
      //                 SizedBox(
      //                   height: 2.h,
      //                 ),
      //                 _addButton,
      //               ],
      //             ),
      //           );
      //         },
      //       );
      //     },
      //   );
    }
  }
}
