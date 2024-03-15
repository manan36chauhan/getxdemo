import 'package:manan_s_application2/widgets/app_bar/custom_app_bar.dart';
import 'package:manan_s_application2/widgets/app_bar/appbar_title.dart';
import 'package:manan_s_application2/widgets/app_bar/appbar_trailing_image.dart';
import 'widgets/cart_item_widget.dart';
import 'models/cart_item_model.dart';
import 'package:manan_s_application2/widgets/custom_text_form_field.dart';
import 'package:manan_s_application2/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:manan_s_application2/core/app_export.dart';
import 'controller/cart_controller.dart';
import 'models/cart_model.dart';

// ignore_for_file: must_be_immutable
class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  CartController controller = Get.put(CartController(CartModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 7.v),
                child: Column(children: [
                  _buildCart(),
                  SizedBox(height: 52.v),
                  _buildCouponCode(),
                  SizedBox(height: 16.v),
                  _buildTotalPriceDetails(),
                  SizedBox(height: 16.v),
                  CustomElevatedButton(
                      text: "lbl_check_out".tr,
                      onPressed: () {
                        onTapCheckOut();
                      }),
                  SizedBox(height: 8.v)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        title: AppbarTitle(
            text: "lbl_your_cart".tr, margin: EdgeInsets.only(left: 16.h)),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgNotificationIcon,
              margin: EdgeInsets.fromLTRB(13.h, 15.v, 13.h, 16.v),
              onTap: () {
                onTapNotificationIcon();
              })
        ]);
  }

  /// Section Widget
  Widget _buildCart() {
    return Obx(() => ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(height: 16.v);
        },
        itemCount: controller.cartModelObj.value.cartItemList.value.length,
        itemBuilder: (context, index) {
          CartItemModel model =
              controller.cartModelObj.value.cartItemList.value[index];
          return CartItemWidget(model);
        }));
  }

  /// Section Widget
  Widget _buildCouponCode() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(
          child: CustomTextFormField(
              controller: controller.cuponCodeController,
              hintText: "msg_enter_cupon_code".tr,
              textInputAction: TextInputAction.done,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.h, vertical: 19.v))),
      CustomElevatedButton(
          width: 87.h,
          text: "lbl_apply".tr,
          buttonStyle: CustomButtonStyles.fillPrimary,
          buttonTextStyle: CustomTextStyles.labelLargeOnPrimaryContainer)
    ]);
  }

  /// Section Widget
  Widget _buildTotalPriceDetails() {
    return Container(
        padding: EdgeInsets.all(15.h),
        decoration: AppDecoration.outlineBlue50
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildShippingPrice(
                  shippingText: "lbl_items_3".tr, priceText: "lbl_598_86".tr),
              SizedBox(height: 16.v),
              _buildShippingPrice(
                  shippingText: "lbl_shipping".tr, priceText: "lbl_40_00".tr),
              SizedBox(height: 14.v),
              _buildShippingPrice(
                  shippingText: "lbl_import_charges".tr,
                  priceText: "lbl_128_00".tr),
              SizedBox(height: 12.v),
              Divider(),
              SizedBox(height: 10.v),
              _buildShippingPrice(
                  shippingText: "lbl_total_price".tr,
                  priceText: "lbl_766_86".tr)
            ]));
  }

  /// Common widget
  Widget _buildShippingPrice({
    required String shippingText,
    required String priceText,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
          padding: EdgeInsets.only(top: 1.v),
          child: Text(shippingText,
              style: theme.textTheme.bodySmall!
                  .copyWith(color: appTheme.blueGray300))),
      Text(priceText,
          style: CustomTextStyles.bodySmallOnPrimary
              .copyWith(color: theme.colorScheme.onPrimary.withOpacity(1)))
    ]);
  }

  /// Navigates to the notificationScreen when the action is triggered.
  onTapNotificationIcon() {
    Get.toNamed(
      AppRoutes.notificationScreen,
    );
  }

  /// Navigates to the shipToScreen when the action is triggered.
  onTapCheckOut() {
    Get.toNamed(
      AppRoutes.shipToScreen,
    );
  }
}
