import 'package:manan_s_application2/widgets/app_bar/custom_app_bar.dart';
import 'package:manan_s_application2/widgets/app_bar/appbar_leading_image.dart';
import 'package:manan_s_application2/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:manan_s_application2/widgets/app_bar/appbar_trailing_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'widgets/offerbanner_item_widget.dart';
import 'models/offerbanner_item_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'widgets/arrowright_item_widget.dart';
import 'models/arrowright_item_model.dart';
import 'widgets/flashsale_item_widget.dart';
import 'models/flashsale_item_model.dart';
import 'widgets/megasale_item_widget.dart';
import 'models/megasale_item_model.dart';
import 'widgets/products_item_widget.dart';
import 'models/products_item_model.dart';
import 'package:flutter/material.dart';
import 'package:manan_s_application2/core/app_export.dart';
import 'controller/dashboard_controller.dart';
import 'models/dashboard_model.dart';

// ignore_for_file: must_be_immutable
class DashboardPage extends StatelessWidget {
  DashboardPage({Key? key}) : super(key: key);

  DashboardController controller =
      Get.put(DashboardController(DashboardModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 27.v),
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 5.v),
                        child: Column(children: [
                          _buildOfferBanner(),
                          SizedBox(height: 16.v),
                          Obx(() => SizedBox(
                              height: 8.v,
                              child: AnimatedSmoothIndicator(
                                  activeIndex: controller.sliderIndex.value,
                                  count: controller.dashboardModelObj.value
                                      .offerbannerItemList.value.length,
                                  axisDirection: Axis.horizontal,
                                  effect: ScrollingDotsEffect(
                                      spacing: 8,
                                      activeDotColor: theme.colorScheme.primary
                                          .withOpacity(1),
                                      dotColor: appTheme.blue50,
                                      dotHeight: 8.v,
                                      dotWidth: 8.h)))),
                          SizedBox(height: 25.v),
                          _buildCategories(),
                          SizedBox(height: 37.v),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.h),
                              child: _buildFlashSaleHeader(
                                  flashSaleText: "lbl_flash_sale".tr,
                                  seeMoreText: "lbl_see_more".tr,
                                  onTapFlashSaleHeader: () {
                                    onTapFlashSaleHeader();
                                  })),
                          SizedBox(height: 12.v),
                          _buildFlashSale(),
                          SizedBox(height: 23.v),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.h),
                              child: _buildFlashSaleHeader(
                                  flashSaleText: "lbl_mega_sale".tr,
                                  seeMoreText: "lbl_see_more".tr)),
                          SizedBox(height: 10.v),
                          _buildMegaSale(),
                          SizedBox(height: 29.v),
                          CustomImageView(
                              imagePath: ImageConstant.imgRecomendedProduct,
                              height: 206.v,
                              width: 343.h,
                              radius: BorderRadius.circular(5.h)),
                          SizedBox(height: 16.v),
                          _buildProducts()
                        ]))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 48.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgRewind,
            margin: EdgeInsets.only(left: 32.h, top: 20.v, bottom: 20.v)),
        title: AppbarSubtitleOne(
            text: "lbl_search_product".tr,
            margin: EdgeInsets.only(left: 8.h),
            onTap: () {
              onTapSearchProduct();
            }),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgLoveIcon,
              margin: EdgeInsets.only(left: 16.h, top: 16.v, right: 16.h),
              onTap: () {
                onTapLoveIcon();
              }),
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
  Widget _buildOfferBanner() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Obx(() => CarouselSlider.builder(
            options: CarouselOptions(
                height: 206.v,
                initialPage: 0,
                autoPlay: true,
                viewportFraction: 1.0,
                enableInfiniteScroll: false,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  controller.sliderIndex.value = index;
                }),
            itemCount: controller
                .dashboardModelObj.value.offerbannerItemList.value.length,
            itemBuilder: (context, index, realIndex) {
              OfferbannerItemModel model = controller
                  .dashboardModelObj.value.offerbannerItemList.value[index];
              return OfferbannerItemWidget(model);
            })));
  }

  /// Section Widget
  Widget _buildCategories() {
    return Padding(
        padding: EdgeInsets.only(left: 16.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(right: 16.h),
              child: _buildFlashSaleHeader(
                  flashSaleText: "lbl_category".tr,
                  seeMoreText: "lbl_more_category".tr,
                  onTapSeeMoreText: () {
                    onTapTxtSeeMoreText();
                  })),
          SizedBox(height: 10.v),
          SizedBox(
              height: 94.v,
              child: Obx(() => ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 12.h);
                  },
                  itemCount: controller
                      .dashboardModelObj.value.arrowrightItemList.value.length,
                  itemBuilder: (context, index) {
                    ArrowrightItemModel model = controller.dashboardModelObj
                        .value.arrowrightItemList.value[index];
                    return ArrowrightItemWidget(model);
                  })))
        ]));
  }

  /// Section Widget
  Widget _buildFlashSale() {
    return SizedBox(
        height: 238.v,
        child: Obx(() => ListView.separated(
            padding: EdgeInsets.only(left: 16.h),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return SizedBox(width: 16.h);
            },
            itemCount: controller
                .dashboardModelObj.value.flashsaleItemList.value.length,
            itemBuilder: (context, index) {
              FlashsaleItemModel model = controller
                  .dashboardModelObj.value.flashsaleItemList.value[index];
              return FlashsaleItemWidget(model, onTapProductItem: () {
                onTapProductItem();
              });
            })));
  }

  /// Section Widget
  Widget _buildMegaSale() {
    return SizedBox(
        height: 238.v,
        child: Obx(() => ListView.separated(
            padding: EdgeInsets.only(left: 16.h),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return SizedBox(width: 16.h);
            },
            itemCount: controller
                .dashboardModelObj.value.megasaleItemList.value.length,
            itemBuilder: (context, index) {
              MegasaleItemModel model = controller
                  .dashboardModelObj.value.megasaleItemList.value[index];
              return MegasaleItemWidget(model);
            })));
  }

  /// Section Widget
  Widget _buildProducts() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Obx(() => GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 283.v,
                crossAxisCount: 2,
                mainAxisSpacing: 13.h,
                crossAxisSpacing: 13.h),
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller
                .dashboardModelObj.value.productsItemList.value.length,
            itemBuilder: (context, index) {
              ProductsItemModel model = controller
                  .dashboardModelObj.value.productsItemList.value[index];
              return ProductsItemWidget(model);
            })));
  }

  /// Common widget
  Widget _buildFlashSaleHeader({
    required String flashSaleText,
    required String seeMoreText,
    Function? onTapFlashSaleHeader,
    Function? onTapSeeMoreText,
  }) {
    return GestureDetector(
        onTap: () {
          onTapFlashSaleHeader!.call();
        },
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(flashSaleText,
              style: theme.textTheme.titleSmall!
                  .copyWith(color: theme.colorScheme.onPrimary.withOpacity(1))),
          GestureDetector(
              onTap: () {
                onTapSeeMoreText!.call();
              },
              child: Text(seeMoreText,
                  style: CustomTextStyles.titleSmallPrimary.copyWith(
                      color: theme.colorScheme.primary.withOpacity(1))))
        ]));
  }

  /// Navigates to the searchScreen when the action is triggered.
  onTapSearchProduct() {
    Get.toNamed(
      AppRoutes.searchScreen,
    );
  }

  /// Navigates to the favoriteProductScreen when the action is triggered.
  onTapLoveIcon() {
    Get.toNamed(
      AppRoutes.favoriteProductScreen,
    );
  }

  /// Navigates to the notificationScreen when the action is triggered.
  onTapImgNotificationIcon() {
    Get.toNamed(
      AppRoutes.notificationScreen,
    );
  }

  /// Navigates to the listCategoryScreen when the action is triggered.
  onTapTxtSeeMoreText() {
    Get.toNamed(
      AppRoutes.listCategoryScreen,
    );
  }

  /// Navigates to the superFlashSaleScreen when the action is triggered.
  onTapFlashSaleHeader() {
    Get.toNamed(
      AppRoutes.superFlashSaleScreen,
    );
  }

  /// Navigates to the productDetailScreen when the action is triggered.
  onTapProductItem() {
    Get.toNamed(
      AppRoutes.productDetailScreen,
    );
  }
}
