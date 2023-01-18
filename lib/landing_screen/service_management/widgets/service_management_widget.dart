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
import 'package:service365_admin_panel/landing_screen/service_management/model/electrician_modal.dart';
import 'package:service365_admin_panel/landing_screen/service_management/model/plumber_modal.dart';
import 'package:service365_admin_panel/landing_screen/service_management/model/service_model.dart';
import 'package:service365_admin_panel/landing_screen/service_management/widgets/add_city_dialog.dart';
import 'package:service365_admin_panel/landing_screen/service_management/widgets/add_service_dialog.dart';
import 'package:service365_admin_panel/landing_screen/service_management/widgets/controller.dart';
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
                                  _dialog(
                                      logs[index]?.serviceName, index, logs);
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

  Future<void> _dialog(String? serviceName, index, logs) async {
    switch (serviceName) {
      case "Maid":
        await showDialog(
          context: context,
          builder: (dialogContext) {
            return StatefulBuilder(
              builder: (dialogContext, setState) {
                return AlertDialog(
                  title: buildText(logs, index),
                  content: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText("1 BHK"),
                        Row(
                          children: [
                            Expanded(
                              child: buildTextFieldWidget(
                                controller: C.firstBhk1Controller,
                                text: '1 time Service',
                                hintText: '1 BHK',
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Expanded(
                              child: buildTextFieldWidget(
                                controller: C.secondBhk1Controller,
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
                                controller: C.firstBhk2Controller,
                                text: '1 time Service',
                                hintText: '2 BHK',
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Expanded(
                              child: buildTextFieldWidget(
                                controller: C.secondBhk2Controller,
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
                                controller: C.firstBhk3Controller,
                                text: '1 time Service',
                                hintText: '3 BHK',
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Expanded(
                              child: buildTextFieldWidget(
                                controller: C.secondBhk3Controller,
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
                                controller: C.firstBhk4Controller,
                                text: '1 time Service',
                                hintText: '4 BHK',
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Expanded(
                              child: buildTextFieldWidget(
                                controller: C.secondBhk4Controller,
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
                                controller: C.firstBhk5Controller,
                                text: '1 time Service',
                                hintText: '5 BHK',
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Expanded(
                              child: buildTextFieldWidget(
                                controller: C.secondBhk5Controller,
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
                                serviceName: "Maid_Service",
                                bhk1: C.firstBhk1Controller.text.isEmpty
                                    ? ""
                                    : C.firstBhk1Controller.text,
                                bhk2: C.firstBhk2Controller.text.isEmpty
                                    ? ""
                                    : C.firstBhk2Controller.text,
                                bhk3: C.firstBhk3Controller.text.isEmpty
                                    ? ""
                                    : C.firstBhk3Controller.text,
                                bhk4: C.firstBhk4Controller.text.isEmpty
                                    ? ""
                                    : C.firstBhk4Controller.text,
                                bhk5: C.firstBhk5Controller.text.isEmpty
                                    ? ""
                                    : C.firstBhk5Controller.text,
                                bhk1_2: C.secondBhk1Controller.text.isEmpty
                                    ? ""
                                    : C.secondBhk1Controller.text,
                                bhk2_2: C.secondBhk2Controller.text.isEmpty
                                    ? ""
                                    : C.secondBhk2Controller.text,
                                bhk3_2: C.secondBhk3Controller.text.isEmpty
                                    ? ""
                                    : C.secondBhk3Controller.text,
                                bhk4_2: C.secondBhk4Controller.text.isEmpty
                                    ? ""
                                    : C.secondBhk4Controller.text,
                                bhk5_2: C.secondBhk5Controller.text.isEmpty
                                    ? ""
                                    : C.secondBhk5Controller.text,
                              ),
                            );
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
        break;
      case "Cook":
        await showDialog(
          context: context,
          builder: (dialogContext) {
            return StatefulBuilder(
              builder: (dialogContext, setState) {
                return AlertDialog(
                  title: buildText(logs, index),
                  content: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText("Person 1"),
                        Row(
                          children: [
                            Expanded(
                              child: buildTextFieldWidget(
                                controller: C.firstCook1Controller,
                                text: '1 time Service',
                                hintText: '1 Person',
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Expanded(
                              child: buildTextFieldWidget(
                                controller: C.secondCook1Controller,
                                text: '2 time Service',
                                hintText: '2 Person',
                              ),
                            ),
                          ],
                        ),
                        AppText("Person 2"),
                        Row(
                          children: [
                            Expanded(
                              child: buildTextFieldWidget(
                                controller: C.firstCook2Controller,
                                text: '1 time Service',
                                hintText: '2 Person',
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Expanded(
                              child: buildTextFieldWidget(
                                controller: C.secondCook2Controller,
                                text: '2 time Service',
                                hintText: '2 Person',
                              ),
                            ),
                          ],
                        ),
                        AppText("Person 3"),
                        Row(
                          children: [
                            Expanded(
                              child: buildTextFieldWidget(
                                controller: C.firstCook3Controller,
                                text: '1 time Service',
                                hintText: '3 Person',
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Expanded(
                              child: buildTextFieldWidget(
                                controller: C.secondCook3Controller,
                                text: '2 time Service',
                                hintText: '3 Person',
                              ),
                            ),
                          ],
                        ),
                        AppText("Person 4"),
                        Row(
                          children: [
                            Expanded(
                              child: buildTextFieldWidget(
                                controller: C.firstCook4Controller,
                                text: '1 time Service',
                                hintText: '4 Person',
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Expanded(
                              child: buildTextFieldWidget(
                                controller: C.secondCook4Controller,
                                text: '2 time Service',
                                hintText: '4 Person',
                              ),
                            ),
                          ],
                        ),
                        AppText("Person 5"),
                        Row(
                          children: [
                            Expanded(
                              child: buildTextFieldWidget(
                                controller: C.firstCook5Controller,
                                text: '1 time Service',
                                hintText: '5 Person',
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Expanded(
                              child: buildTextFieldWidget(
                                controller: C.secondCook5Controller,
                                text: '2 time Service',
                                hintText: '5 Person',
                              ),
                            ),
                          ],
                        ),
                        AppText("Person 6"),
                        Row(
                          children: [
                            Expanded(
                              child: buildTextFieldWidget(
                                controller: C.firstCook6Controller,
                                text: '1 time Service',
                                hintText: '6 Person',
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Expanded(
                              child: buildTextFieldWidget(
                                controller: C.secondCook6Controller,
                                text: '2 time Service',
                                hintText: '6 Person',
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
                            await BlocProvider.of<ServiceCubit>(context)
                                .cookPriceService(
                              context: context,
                              // id: logs[index]?.id ?? "",
                              cookService: CookService(
                                serviceName: "Cook_Service",
                                person_1_1time:
                                    C.firstCook1Controller.text.isEmpty
                                        ? ""
                                        : C.firstCook1Controller.text,
                                person_2_1time:
                                    C.firstCook2Controller.text.isEmpty
                                        ? ""
                                        : C.firstCook2Controller.text,
                                person_3_1time:
                                    C.firstCook3Controller.text.isEmpty
                                        ? ""
                                        : C.firstCook3Controller.text,
                                person_4_1time:
                                    C.firstCook4Controller.text.isEmpty
                                        ? ""
                                        : C.firstCook4Controller.text,
                                person_5_1time:
                                    C.firstCook5Controller.text.isEmpty
                                        ? ""
                                        : C.firstCook5Controller.text,
                                person_6_1time:
                                    C.firstCook6Controller.text.isEmpty
                                        ? ""
                                        : C.firstCook6Controller.text,
                                person_1_2time:
                                    C.secondCook1Controller.text.isEmpty
                                        ? ""
                                        : C.secondCook1Controller.text,
                                person_2_2time:
                                    C.secondCook2Controller.text.isEmpty
                                        ? ""
                                        : C.secondCook2Controller.text,
                                person_3_2time:
                                    C.secondCook3Controller.text.isEmpty
                                        ? ""
                                        : C.secondCook3Controller.text,
                                person_4_2time:
                                    C.secondCook4Controller.text.isEmpty
                                        ? ""
                                        : C.secondCook4Controller.text,
                                person_5_2time:
                                    C.secondCook5Controller.text.isEmpty
                                        ? ""
                                        : C.secondCook5Controller.text,
                                person_6_2time:
                                    C.secondCook6Controller.text.isEmpty
                                        ? ""
                                        : C.secondCook6Controller.text,
                              ),
                            );
                            //Close the dialog box
                            // await BlocProvider.of<ServiceCubit>(context).editService(
                            //   context: context,
                            //   service: ServiceModel(firstTimeService: FirstTimeService()),
                            // );
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
        break;
      case "Driver":
        await showDialog(
          context: context,
          builder: (dialogContext) {
            return StatefulBuilder(
              builder: (dialogContext, setState) {
                return AlertDialog(
                  title: buildText(logs, index),
                  content: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        buildTextFieldWidget(
                          controller: C.driverSmallController,
                          text: 'Small',
                          hintText: 'Small',
                        ),
                        buildTextFieldWidget(
                          controller: C.driverMediumController,
                          text: 'Medium/Sedan',
                          hintText: 'Medium/Sedan',
                        ),
                        buildTextFieldWidget(
                          controller: C.driverSuvController,
                          text: 'Compact SUV',
                          hintText: 'Compact SUV',
                        ),
                        buildTextFieldWidget(
                          controller: C.driver7SeaterController,
                          text: 'SUV 7Seater',
                          hintText: 'SUV 7Seater',
                        ),
                        buildTextFieldWidget(
                          controller: C.driverCarsController,
                          text: 'Luxury Cars',
                          hintText: 'Luxury Cars',
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        _addButtons(
                          onPressed: () async {
                            await BlocProvider.of<ServiceCubit>(context)
                                .driverPriceService(
                              context: context,
                              driverService: DriverService(
                                  serviceName: "Driver_Service",
                                  driverSmall:
                                      C.driverSmallController.text.isEmpty
                                          ? ""
                                          : C.driverSmallController.text,
                                  driverMediumAndSedan:
                                      C.driverMediumController.text.isEmpty
                                          ? ""
                                          : C.driverMediumController.text,
                                  driverCompactSuv:
                                      C.driverSuvController.text.isEmpty
                                          ? ""
                                          : C.driverSuvController.text,
                                  driver7Seater:
                                      C.driver7SeaterController.text.isEmpty
                                          ? ""
                                          : C.driver7SeaterController.text,
                                  driverLuxuryCars:
                                      C.driverCarsController.text.isEmpty
                                          ? ""
                                          : C.driverCarsController.text),
                            );
                            //Close the dialog box
                            // await BlocProvider.of<ServiceCubit>(context).editService(
                            //   context: context,
                            //   service: ServiceModel(firstTimeService: FirstTimeService()),
                            // );
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
        break;
      case "Electrician":
        await showDialog(
          context: context,
          builder: (dialogContext) {
            return StatefulBuilder(
              builder: (dialogContext, setState) {
                return AlertDialog(
                  title: buildText(logs, index),
                  content: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        buildTextFieldWidget(
                          controller: C.acswitch_box_installationController,
                          text: 'Ac Switch Box installation',
                          hintText: 'Ac Switch Box',
                        ),
                        buildTextFieldWidget(
                          controller: C.switch_board_installationController,
                          text: 'Switch Board Installation',
                          hintText: 'Switch Board',
                        ),
                        buildTextFieldWidget(
                          controller: C.switch_board_repairController,
                          text: 'Switch Board Repair',
                          hintText: 'Switch Board Repair',
                        ),
                        buildTextFieldWidget(
                          controller: C.switch_or_socket_controller,
                          text: 'Switch & Socket Replacement',
                          hintText: 'Switch & Socket Replacement',
                        ),
                        buildTextFieldWidget(
                          controller: C.switch_box_15Amp_controller,
                          text: '15 + Amp Switch Box',
                          hintText: '15 + Amp Switch Box',
                        ),
                        buildTextFieldWidget(
                          controller:
                              C.celling_regulator_fan_replacementController,
                          text: 'Celling Regulator Fan Replacement',
                          hintText: 'Regulator Replacement',
                        ),
                        buildTextFieldWidget(
                          controller:
                              C.decorative_celling_fan_installationController,
                          text: 'Decorative Celling Fan Installation',
                          hintText: 'Decorative Fan Installation',
                        ),
                        buildTextFieldWidget(
                          controller: C.celling_fan_installationController,
                          text: 'Celling Fan Installation',
                          hintText: 'Fan Installation ',
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        _addButtons(
                          onPressed: () async {
                            await BlocProvider.of<ServiceCubit>(context)
                                .electricianPriceService(
                              context: context,
                              electricianService: ElectricianService(
                                serviceName: "Electrician_Service",
                                celling_fan_installation: C
                                        .celling_fan_installationController
                                        .text
                                        .isEmpty
                                    ? ""
                                    : C.celling_fan_installationController.text,
                                celling_regulator_fan_replacement: C
                                        .celling_regulator_fan_replacementController
                                        .text
                                        .isEmpty
                                    ? ""
                                    : C.celling_regulator_fan_replacementController
                                        .text,
                                decorative_celling_fan_installation: C
                                        .decorative_celling_fan_installationController
                                        .text
                                        .isEmpty
                                    ? ""
                                    : C.decorative_celling_fan_installationController
                                        .text,
                                acswitch_box_installation: C
                                        .acswitch_box_installationController
                                        .text
                                        .isEmpty
                                    ? ""
                                    : C.acswitch_box_installationController
                                        .text,
                                switch_board_installation: C
                                        .switch_board_installationController
                                        .text
                                        .isEmpty
                                    ? ""
                                    : C.switch_board_installationController
                                        .text,
                                switch_board_repair:
                                    C.switch_board_repairController.text.isEmpty
                                        ? ""
                                        : C.switch_board_repairController.text,
                                switch_or_socket_replacement:
                                    C.switch_or_socket_controller.text.isEmpty
                                        ? ""
                                        : C.switch_or_socket_controller.text,
                                switch_box_15Amp:
                                    C.switch_box_15Amp_controller.text.isEmpty
                                        ? ""
                                        : C.switch_box_15Amp_controller.text,
                              ),
                            );

                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
        break;
      case "Plumber":
        await showDialog(
          context: context,
          builder: (dialogContext) {
            return StatefulBuilder(
              builder: (dialogContext, setState) {
                return AlertDialog(
                  title: buildText(logs, index),
                  content: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        buildTextFieldWidget(
                          controller: C.waste_pipe_leakage_Controller,
                          text: 'Waste Pipe Leakage (1 piece)',
                          hintText: 'Pipe Leakage',
                        ),
                        buildTextFieldWidget(
                          controller: C.waste_pipe_blockge_removal_Controller,
                          text: 'Waste Pipe Blockge Removal',
                          hintText: 'Waste Pipe Blockge Removal',
                        ),
                        buildTextFieldWidget(
                          controller: C.wash_basin_installation_Controller,
                          text: 'Wash Basin Installation',
                          hintText: 'Wash Basin Installation',
                        ),
                        buildTextFieldWidget(
                          controller: C.bathroom_tile_gap_filling_Controller,
                          text: 'Bathroom Tile Gap Filling',
                          hintText: 'Bathroom Tile Gap Filling',
                        ),
                        buildTextFieldWidget(
                          controller: C.kithen_title_gap_filling_Controller,
                          text: 'Kithen Tile Gap Filling',
                          hintText: 'Kithen Tile Gap Filling',
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        _addButtons(
                          onPressed: () async {
                            await BlocProvider.of<ServiceCubit>(context)
                                .plumberPriceService(
                              context: context,
                              plumberService: PlumberService(
                                serviceName: "Plumber_Service",
                                waste_pipe_leakage_1piece:
                                    C.waste_pipe_leakage_Controller.text.isEmpty
                                        ? ""
                                        : C.waste_pipe_leakage_Controller.text,
                                waste_pipe_blockge_removal: C
                                        .waste_pipe_blockge_removal_Controller
                                        .text
                                        .isEmpty
                                    ? ""
                                    : C.waste_pipe_blockge_removal_Controller
                                        .text,
                                wash_basin_installation: C
                                        .wash_basin_installation_Controller
                                        .text
                                        .isEmpty
                                    ? ""
                                    : C.wash_basin_installation_Controller.text,
                                bathroom_tile_gap_filling: C
                                        .bathroom_tile_gap_filling_Controller
                                        .text
                                        .isEmpty
                                    ? ""
                                    : C.bathroom_tile_gap_filling_Controller
                                        .text,
                                kithen_title_gap_filling: C
                                        .kithen_title_gap_filling_Controller
                                        .text
                                        .isEmpty
                                    ? ""
                                    : C.kithen_title_gap_filling_Controller
                                        .text,
                              ),
                            );
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
        break;
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
      //                   controller: firstBhk2Controller,
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
      //                   controller: firstBhk2Controller,
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
}
