import 'package:manan_s_application2/widgets/app_bar/custom_app_bar.dart';
import 'package:manan_s_application2/widgets/app_bar/appbar_leading_image.dart';
import 'package:manan_s_application2/widgets/app_bar/appbar_subtitle.dart';
import 'widgets/addresses_item_widget.dart';
import 'models/addresses_item_model.dart';
import 'package:manan_s_application2/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:manan_s_application2/core/app_export.dart';
import 'controller/address_controller.dart';

class AddressScreen extends GetWidget<AddressController> {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 10.v),
                child: Column(children: [
                  SizedBox(height: 17.v),
                  _buildAddresses(),
                  Spacer()
                ])),
            bottomNavigationBar: _buildAddAddress()));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 16.h, top: 15.v, bottom: 16.v),
            onTap: () {
              onTapArrowLeft();
            }),
        title: AppbarSubtitle(
            text: "lbl_address".tr, margin: EdgeInsets.only(left: 12.h)));
  }

  /// Section Widget
  Widget _buildAddresses() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Obx(() => ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 18.v);
            },
            itemCount:
                controller.addressModelObj.value.addressesItemList.value.length,
            itemBuilder: (context, index) {
              AddressesItemModel model = controller
                  .addressModelObj.value.addressesItemList.value[index];
              return AddressesItemWidget(model);
            })));
  }

  /// Section Widget
  Widget _buildAddAddress() {
    return CustomElevatedButton(
        text: "lbl_add_address".tr,
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 50.v));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
