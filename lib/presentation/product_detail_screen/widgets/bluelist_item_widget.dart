import '../models/bluelist_item_model.dart';
import '../controller/product_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:manan_s_application2/core/app_export.dart';

// ignore: must_be_immutable
class BluelistItemWidget extends StatelessWidget {
  BluelistItemWidget(
    this.bluelistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  BluelistItemModel bluelistItemModelObj;

  var controller = Get.find<ProductDetailController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48.h,
      child: Align(
        alignment: Alignment.centerRight,
        child: CustomImageView(
          imagePath: ImageConstant.imgGroup475,
          height: 48.adaptSize,
          width: 48.adaptSize,
        ),
      ),
    );
  }
}
