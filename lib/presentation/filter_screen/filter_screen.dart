import 'package:manan_s_application2/widgets/app_bar/custom_app_bar.dart';
import 'package:manan_s_application2/widgets/app_bar/appbar_leading_image.dart';
import 'package:manan_s_application2/widgets/app_bar/appbar_subtitle.dart';
import 'package:manan_s_application2/widgets/custom_text_form_field.dart';
import 'models/conditionchipview_item_model.dart';
import '../filter_screen/widgets/conditionchipview_item_widget.dart';
import 'models/buyingformatchipview_item_model.dart';
import '../filter_screen/widgets/buyingformatchipview_item_widget.dart';
import 'models/itemlocationchipview_item_model.dart';
import '../filter_screen/widgets/itemlocationchipview_item_widget.dart';
import 'models/showonly_item_model.dart';
import '../filter_screen/widgets/showonly_item_widget.dart';
import 'package:manan_s_application2/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:manan_s_application2/core/app_export.dart';
import 'controller/filter_controller.dart';

class FilterScreen extends GetWidget<FilterController> {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 7.v),
                child: Column(children: [
                  SizedBox(height: 31.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Container(
                              margin: EdgeInsets.only(bottom: 5.v),
                              padding: EdgeInsets.symmetric(horizontal: 16.h),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("lbl_price_range".tr,
                                        style: theme.textTheme.titleSmall),
                                    SizedBox(height: 11.v),
                                    _buildPriceRow(),
                                    SizedBox(height: 34.v),
                                    Text("lbl_condition".tr,
                                        style: theme.textTheme.titleSmall),
                                    SizedBox(height: 13.v),
                                    _buildConditionChipView(),
                                    SizedBox(height: 24.v),
                                    Text("lbl_buying_format".tr,
                                        style: theme.textTheme.titleSmall),
                                    SizedBox(height: 11.v),
                                    _buildBuyingFormatChipView(),
                                    SizedBox(height: 22.v),
                                    Text("lbl_item_location".tr,
                                        style: theme.textTheme.titleSmall),
                                    SizedBox(height: 13.v),
                                    _buildItemLocationChipView(),
                                    SizedBox(height: 25.v),
                                    _buildShowOnlyColumn()
                                  ]))))
                ])),
            bottomNavigationBar: _buildApplyButton()));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 42.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgCloseIcon,
            margin: EdgeInsets.only(left: 18.h, top: 16.v, bottom: 16.v)),
        title: AppbarSubtitle(
            text: "lbl_filter_search".tr, margin: EdgeInsets.only(left: 12.h)));
  }

  /// Section Widget
  Widget _buildPriceRow() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(
          child: Padding(
              padding: EdgeInsets.only(right: 6.h),
              child: CustomTextFormField(
                  controller: controller.priceController,
                  hintText: "lbl_1_245".tr,
                  hintStyle: CustomTextStyles.labelLargeBluegray300))),
      Expanded(
          child: Padding(
              padding: EdgeInsets.only(left: 6.h),
              child: CustomTextFormField(
                  controller: controller.priceController1,
                  hintText: "lbl_9_344".tr,
                  hintStyle: CustomTextStyles.labelLargeBluegray300,
                  textInputAction: TextInputAction.done)))
    ]);
  }

  /// Section Widget
  Widget _buildConditionChipView() {
    return Obx(() => Wrap(
        runSpacing: 9.v,
        spacing: 9.h,
        children: List<Widget>.generate(
            controller.filterModelObj.value.conditionchipviewItemList.value
                .length, (index) {
          ConditionchipviewItemModel model = controller
              .filterModelObj.value.conditionchipviewItemList.value[index];
          return ConditionchipviewItemWidget(model);
        })));
  }

  /// Section Widget
  Widget _buildBuyingFormatChipView() {
    return Obx(() => Wrap(
        runSpacing: 8.v,
        spacing: 8.h,
        children: List<Widget>.generate(
            controller.filterModelObj.value.buyingformatchipviewItemList.value
                .length, (index) {
          BuyingformatchipviewItemModel model = controller
              .filterModelObj.value.buyingformatchipviewItemList.value[index];
          return BuyingformatchipviewItemWidget(model);
        })));
  }

  /// Section Widget
  Widget _buildItemLocationChipView() {
    return Obx(() => Wrap(
        runSpacing: 8.v,
        spacing: 8.h,
        children: List<Widget>.generate(
            controller.filterModelObj.value.itemlocationchipviewItemList.value
                .length, (index) {
          ItemlocationchipviewItemModel model = controller
              .filterModelObj.value.itemlocationchipviewItemList.value[index];
          return ItemlocationchipviewItemWidget(model);
        })));
  }

  /// Section Widget
  Widget _buildShowOnlyColumn() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_show_only".tr, style: theme.textTheme.titleSmall),
      SizedBox(height: 10.v),
      Obx(() => Wrap(
          runSpacing: 8.v,
          spacing: 8.h,
          children: List<Widget>.generate(
              controller.filterModelObj.value.showonlyItemList.value.length,
              (index) {
            ShowonlyItemModel model =
                controller.filterModelObj.value.showonlyItemList.value[index];
            return ShowonlyItemWidget(model);
          })))
    ]);
  }

  /// Section Widget
  Widget _buildApplyButton() {
    return CustomElevatedButton(
        text: "lbl_apply".tr,
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 50.v),
        onPressed: () {
          onTapApplyButton();
        });
  }

  /// Navigates to the searchResultScreen when the action is triggered.
  onTapApplyButton() {
    Get.toNamed(
      AppRoutes.searchResultScreen,
    );
  }
}
