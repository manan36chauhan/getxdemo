import 'package:manan_s_application2/widgets/app_bar/custom_app_bar.dart';
import 'package:manan_s_application2/widgets/app_bar/appbar_leading_image.dart';
import 'package:manan_s_application2/widgets/app_bar/appbar_subtitle.dart';
import 'widgets/creditcarditems_item_widget.dart';
import 'models/creditcarditems_item_model.dart';
import 'package:manan_s_application2/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:manan_s_application2/core/app_export.dart';
import 'controller/credit_card_and_debit_controller.dart';

class CreditCardAndDebitScreen extends GetWidget<CreditCardAndDebitController> {
  const CreditCardAndDebitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 9.v),
                child: Column(children: [
                  SizedBox(height: 8.v),
                  _buildCreditCardItems(),
                  Spacer()
                ])),
            bottomNavigationBar: _buildAddCard()));
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
            text: "msg_credit_card_and".tr,
            margin: EdgeInsets.only(left: 12.h)));
  }

  /// Section Widget
  Widget _buildCreditCardItems() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Obx(() => ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 14.v);
            },
            itemCount: controller.creditCardAndDebitModelObj.value
                .creditcarditemsItemList.value.length,
            itemBuilder: (context, index) {
              CreditcarditemsItemModel model = controller
                  .creditCardAndDebitModelObj
                  .value
                  .creditcarditemsItemList
                  .value[index];
              return CreditcarditemsItemWidget(model, onTapCreditCardItem: () {
                onTapCreditCardItem();
              });
            })));
  }

  /// Section Widget
  Widget _buildAddCard() {
    return CustomElevatedButton(
        text: "lbl_add_card".tr,
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 50.v),
        onPressed: () {
          onTapAddCard();
        });
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }

  /// Navigates to the lailyfaFebrinaCardScreen when the action is triggered.
  onTapCreditCardItem() {
    Get.toNamed(
      AppRoutes.lailyfaFebrinaCardScreen,
    );
  }

  /// Navigates to the addCardScreen when the action is triggered.
  onTapAddCard() {
    Get.toNamed(
      AppRoutes.addCardScreen,
    );
  }
}
