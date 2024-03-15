import '../models/flashsale_item_model.dart';
import '../controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:manan_s_application2/core/app_export.dart';

// ignore: must_be_immutable
class FlashsaleItemWidget extends StatelessWidget {
  FlashsaleItemWidget(
    this.flashsaleItemModelObj, {
    Key? key,
    this.onTapProductItem,
  }) : super(
          key: key,
        );

  FlashsaleItemModel flashsaleItemModelObj;

  var controller = Get.find<DashboardController>();

  VoidCallback? onTapProductItem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 141.h,
      child: GestureDetector(
        onTap: () {
          onTapProductItem!.call();
        },
        child: Container(
          padding: EdgeInsets.all(15.h),
          decoration: AppDecoration.outlineBlue.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder5,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => CustomImageView(
                  imagePath: flashsaleItemModelObj.image!.value,
                  height: 109.adaptSize,
                  width: 109.adaptSize,
                  radius: BorderRadius.circular(
                    5.h,
                  ),
                ),
              ),
              SizedBox(height: 7.v),
              SizedBox(
                width: 105.h,
                child: Obx(
                  () => Text(
                    flashsaleItemModelObj.fSNikeAirMax!.value,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.labelLarge!.copyWith(
                      height: 1.50,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.v),
              Obx(
                () => Text(
                  flashsaleItemModelObj.price!.value,
                  style: CustomTextStyles.labelLargePrimary,
                ),
              ),
              SizedBox(height: 9.v),
              Row(
                children: [
                  Obx(
                    () => Text(
                      flashsaleItemModelObj.price1!.value,
                      style: CustomTextStyles.bodySmall10.copyWith(
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.h),
                    child: Obx(
                      () => Text(
                        flashsaleItemModelObj.offer!.value,
                        style: theme.textTheme.labelMedium,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
