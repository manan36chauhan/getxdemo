import 'package:manan_s_application2/widgets/app_bar/custom_app_bar.dart';
import 'package:manan_s_application2/widgets/app_bar/appbar_leading_image.dart';
import 'package:manan_s_application2/widgets/app_bar/appbar_subtitle.dart';
import 'package:manan_s_application2/widgets/app_bar/appbar_trailing_image.dart';
import 'widgets/superflashsale_item_widget.dart';
import 'models/superflashsale_item_model.dart';
import 'package:flutter/material.dart';
import 'package:manan_s_application2/core/app_export.dart';
import 'controller/super_flash_sale_controller.dart';

class SuperFlashSaleScreen extends GetWidget<SuperFlashSaleController> {
  const SuperFlashSaleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 26.v),
                    child: Container(
                        margin: EdgeInsets.only(bottom: 5.v),
                        padding: EdgeInsets.symmetric(horizontal: 16.h),
                        child: Column(children: [
                          _buildOfferBanner(),
                          SizedBox(height: 16.v),
                          _buildSuperFlashSale()
                        ]))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 16.h, top: 14.v, bottom: 17.v),
            onTap: () {
              onTapArrowLeft();
            }),
        title: AppbarSubtitle(
            text: "msg_super_flash_sale".tr,
            margin: EdgeInsets.only(left: 12.h)),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgNavExplore,
              margin: EdgeInsets.fromLTRB(16.h, 14.v, 16.h, 17.v),
              onTap: () {
                onTapSearchIcon();
              })
        ]);
  }

  /// Section Widget
  Widget _buildOfferBanner() {
    return SizedBox(
        height: 206.v,
        width: 343.h,
        child: Stack(alignment: Alignment.centerLeft, children: [
          CustomImageView(
              imagePath: ImageConstant.imgPromotionImage,
              height: 206.v,
              width: 343.h,
              radius: BorderRadius.circular(5.h),
              alignment: Alignment.center),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 24.h, right: 110.h),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 209.h,
                            child: Text("msg_super_flash_sale_50".tr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.headlineSmall!
                                    .copyWith(height: 1.50))),
                        SizedBox(height: 27.v),
                        Padding(
                            padding: EdgeInsets.only(right: 59.h),
                            child: Row(children: [
                              Container(
                                  width: 42.h,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 9.h, vertical: 8.v),
                                  decoration: AppDecoration
                                      .fillOnPrimaryContainer
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder5),
                                  child: Text("lbl_08".tr,
                                      style: theme.textTheme.titleMedium)),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 4.h, top: 10.v, bottom: 9.v),
                                  child: Text("lbl".tr,
                                      style: CustomTextStyles
                                          .titleSmallOnPrimaryContainer)),
                              Container(
                                  width: 42.h,
                                  margin: EdgeInsets.only(left: 4.h),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 9.h, vertical: 8.v),
                                  decoration: AppDecoration
                                      .fillOnPrimaryContainer
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder5),
                                  child: Text("lbl_34".tr,
                                      style: theme.textTheme.titleMedium)),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 4.h, top: 10.v, bottom: 9.v),
                                  child: Text("lbl".tr,
                                      style: CustomTextStyles
                                          .titleSmallOnPrimaryContainer)),
                              Container(
                                  width: 42.h,
                                  margin: EdgeInsets.only(left: 4.h),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.h, vertical: 8.v),
                                  decoration: AppDecoration
                                      .fillOnPrimaryContainer
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder5),
                                  child: Text("lbl_52".tr,
                                      style: theme.textTheme.titleMedium))
                            ]))
                      ])))
        ]));
  }

  /// Section Widget
  Widget _buildSuperFlashSale() {
    return Obx(() => GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 283.v,
            crossAxisCount: 2,
            mainAxisSpacing: 13.h,
            crossAxisSpacing: 13.h),
        physics: NeverScrollableScrollPhysics(),
        itemCount: controller
            .superFlashSaleModelObj.value.superflashsaleItemList.value.length,
        itemBuilder: (context, index) {
          SuperflashsaleItemModel model = controller
              .superFlashSaleModelObj.value.superflashsaleItemList.value[index];
          return SuperflashsaleItemWidget(model, onTapProductItem: () {
            onTapProductItem();
          });
        }));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }

  /// Navigates to the searchScreen when the action is triggered.
  onTapSearchIcon() {
    Get.toNamed(
      AppRoutes.searchScreen,
    );
  }

  /// Navigates to the productDetailScreen when the action is triggered.
  onTapProductItem() {
    Get.toNamed(
      AppRoutes.productDetailScreen,
    );
  }
}