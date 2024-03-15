import 'package:manan_s_application2/widgets/app_bar/custom_app_bar.dart';
import 'package:manan_s_application2/widgets/app_bar/appbar_title_searchview.dart';
import 'package:manan_s_application2/widgets/app_bar/appbar_trailing_image.dart';
import 'widgets/categoriesgrid_item_widget.dart';
import 'models/categoriesgrid_item_model.dart';
import 'widgets/categoriesgrid1_item_widget.dart';
import 'models/categoriesgrid1_item_model.dart';
import 'package:flutter/material.dart';
import 'package:manan_s_application2/core/app_export.dart';
import 'controller/explore_controller.dart';
import 'models/explore_model.dart';

// ignore_for_file: must_be_immutable
class ExplorePage extends StatelessWidget {
  ExplorePage({Key? key}) : super(key: key);

  ExploreController controller = Get.put(ExploreController(ExploreModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 25.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("lbl_man_fashion".tr,
                          style: theme.textTheme.titleSmall),
                      SizedBox(height: 13.v),
                      _buildCategoriesGrid(),
                      SizedBox(height: 37.v),
                      Text("lbl_woman_fashion".tr,
                          style: theme.textTheme.titleSmall),
                      SizedBox(height: 13.v),
                      _buildCategoriesGrid1()
                    ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        title: AppbarTitleSearchview(
            margin: EdgeInsets.only(left: 16.h),
            hintText: "lbl_search_product".tr,
            controller: controller.searchController),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgLoveIcon,
              margin: EdgeInsets.only(left: 16.h, top: 16.v, right: 16.h)),
          Container(
              height: 24.adaptSize,
              width: 24.adaptSize,
              margin: EdgeInsets.only(left: 16.h, top: 16.v, right: 32.h),
              child: Stack(alignment: Alignment.topRight, children: [
                CustomImageView(
                    imagePath: ImageConstant.imgNotificationIcon,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    alignment: Alignment.center,
                    onTap: () {
                      onTapImgNotificationIcon();
                    }),
                CustomImageView(
                    imagePath: ImageConstant.imgClosePink300,
                    height: 8.adaptSize,
                    width: 8.adaptSize,
                    alignment: Alignment.topRight,
                    margin:
                        EdgeInsets.only(left: 14.h, right: 2.h, bottom: 16.v))
              ]))
        ]);
  }

  /// Section Widget
  Widget _buildCategoriesGrid() {
    return Obx(() => GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 94.v,
            crossAxisCount: 4,
            mainAxisSpacing: 21.h,
            crossAxisSpacing: 21.h),
        physics: NeverScrollableScrollPhysics(),
        itemCount: controller
            .exploreModelObj.value.categoriesgridItemList.value.length,
        itemBuilder: (context, index) {
          CategoriesgridItemModel model = controller
              .exploreModelObj.value.categoriesgridItemList.value[index];
          return CategoriesgridItemWidget(model);
        }));
  }

  /// Section Widget
  Widget _buildCategoriesGrid1() {
    return Obx(() => GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 93.v,
            crossAxisCount: 4,
            mainAxisSpacing: 21.h,
            crossAxisSpacing: 21.h),
        physics: NeverScrollableScrollPhysics(),
        itemCount: controller
            .exploreModelObj.value.categoriesgrid1ItemList.value.length,
        itemBuilder: (context, index) {
          Categoriesgrid1ItemModel model = controller
              .exploreModelObj.value.categoriesgrid1ItemList.value[index];
          return Categoriesgrid1ItemWidget(model);
        }));
  }

  /// Navigates to the notificationScreen when the action is triggered.
  onTapImgNotificationIcon() {
    Get.toNamed(
      AppRoutes.notificationScreen,
    );
  }
}
