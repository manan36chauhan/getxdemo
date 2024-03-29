import 'package:manan_s_application2/widgets/app_bar/custom_app_bar.dart';
import 'package:manan_s_application2/widgets/app_bar/appbar_title.dart';
import 'package:manan_s_application2/widgets/app_bar/appbar_trailing_image.dart';
import 'package:flutter/material.dart';
import 'package:manan_s_application2/core/app_export.dart';
import 'controller/account_controller.dart';
import 'models/account_model.dart';

// ignore_for_file: must_be_immutable
class AccountPage extends StatelessWidget {
  AccountPage({Key? key}) : super(key: key);

  AccountController controller = Get.put(AccountController(AccountModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 11.v),
                child: Column(children: [
                  _buildAccountOptionOrder(
                      bagIcon: ImageConstant.imgLockPrimary,
                      order: "lbl_profile".tr,
                      onTapAccountOptionOrder: () {
                        onTapAccountOptionOrder();
                      }),
                  _buildAccountOptionOrder(
                      bagIcon: ImageConstant.imgBagIcon, order: "lbl_order".tr),
                  _buildAccountOptionOrder(
                      bagIcon: ImageConstant.imgLinkedin,
                      order: "lbl_address".tr),
                  SizedBox(height: 5.v),
                  _buildAccountOptionOrder(
                      bagIcon: ImageConstant.imgCreditCardIcon,
                      order: "lbl_payment".tr,
                      onTapAccountOptionOrder: () {
                        onTapAccountOptionOrder1();
                      })
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        title: AppbarTitle(
            text: "lbl_account".tr, margin: EdgeInsets.only(left: 16.h)),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgNotificationIcon,
              margin: EdgeInsets.fromLTRB(13.h, 15.v, 13.h, 16.v),
              onTap: () {
                onTapNotificationIcon();
              })
        ]);
  }

  /// Common widget
  Widget _buildAccountOptionOrder({
    required String bagIcon,
    required String order,
    Function? onTapAccountOptionOrder,
  }) {
    return GestureDetector(
        onTap: () {
          onTapAccountOptionOrder!.call();
        },
        child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.all(16.h),
            decoration: AppDecoration.fillOnPrimaryContainer,
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomImageView(
                  imagePath: bagIcon,
                  height: 24.adaptSize,
                  width: 24.adaptSize),
              Padding(
                  padding: EdgeInsets.only(left: 16.h, top: 2.v, bottom: 3.v),
                  child: Text(order,
                      style: theme.textTheme.labelLarge!.copyWith(
                          color: theme.colorScheme.onPrimary.withOpacity(1))))
            ])));
  }

  /// Navigates to the notificationScreen when the action is triggered.
  onTapNotificationIcon() {
    Get.toNamed(
      AppRoutes.notificationScreen,
    );
  }

  /// Navigates to the profileScreen when the action is triggered.
  onTapAccountOptionOrder() {
    Get.toNamed(
      AppRoutes.profileScreen,
    );
  }

  /// Navigates to the addPaymentScreen when the action is triggered.
  onTapAccountOptionOrder1() {
    Get.toNamed(
      AppRoutes.addPaymentScreen,
    );
  }
}
