import 'package:manan_s_application2/widgets/app_bar/custom_app_bar.dart';
import 'package:manan_s_application2/widgets/app_bar/appbar_leading_image.dart';
import 'package:manan_s_application2/widgets/app_bar/appbar_subtitle.dart';
import 'widgets/favoriteproduct_item_widget.dart';
import 'models/favoriteproduct_item_model.dart';
import 'package:flutter/material.dart';
import 'package:manan_s_application2/core/app_export.dart';
import 'controller/favorite_product_controller.dart';

class FavoriteProductScreen extends GetWidget<FavoriteProductController> {
  const FavoriteProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(),
            body: Padding(
                padding: EdgeInsets.only(left: 16.h, top: 8.v, right: 16.h),
                child: Obx(() => GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 283.v,
                        crossAxisCount: 2,
                        mainAxisSpacing: 13.h,
                        crossAxisSpacing: 13.h),
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.favoriteProductModelObj.value
                        .favoriteproductItemList.value.length,
                    itemBuilder: (context, index) {
                      FavoriteproductItemModel model = controller
                          .favoriteProductModelObj
                          .value
                          .favoriteproductItemList
                          .value[index];
                      return FavoriteproductItemWidget(model,
                          onTapProductItem: () {
                        onTapProductItem();
                      });
                    })))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 16.h, top: 16.v, bottom: 15.v),
            onTap: () {
              onTapArrowLeft();
            }),
        title: AppbarSubtitle(
            text: "msg_favorite_product".tr,
            margin: EdgeInsets.only(left: 12.h)));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }

  /// Navigates to the productDetailScreen when the action is triggered.
  onTapProductItem() {
    Get.toNamed(
      AppRoutes.productDetailScreen,
    );
  }
}
