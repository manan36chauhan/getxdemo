import '../models/arrowright_item_model.dart';
import '../controller/dashboard_controller.dart';
import 'package:manan_s_application2/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:manan_s_application2/core/app_export.dart';

// ignore: must_be_immutable
class ArrowrightItemWidget extends StatelessWidget {
  ArrowrightItemWidget(
    this.arrowrightItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ArrowrightItemModel arrowrightItemModelObj;

  var controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70.h,
      child: Padding(
        padding: EdgeInsets.only(bottom: 1.v),
        child: Column(
          children: [
            Obx(
              () => CustomIconButton(
                height: 70.adaptSize,
                width: 70.adaptSize,
                padding: EdgeInsets.all(23.h),
                child: CustomImageView(
                  imagePath: arrowrightItemModelObj.arrowRight!.value,
                ),
              ),
            ),
            SizedBox(height: 7.v),
            Obx(
              () => Text(
                arrowrightItemModelObj.manShirt!.value,
                style: CustomTextStyles.bodySmall10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
