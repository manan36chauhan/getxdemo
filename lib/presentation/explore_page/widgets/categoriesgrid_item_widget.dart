import '../models/categoriesgrid_item_model.dart';
import '../controller/explore_controller.dart';
import 'package:manan_s_application2/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:manan_s_application2/core/app_export.dart';

// ignore: must_be_immutable
class CategoriesgridItemWidget extends StatelessWidget {
  CategoriesgridItemWidget(
    this.categoriesgridItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  CategoriesgridItemModel categoriesgridItemModelObj;

  var controller = Get.find<ExploreController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => CustomIconButton(
            height: 70.adaptSize,
            width: 70.adaptSize,
            padding: EdgeInsets.all(23.h),
            child: CustomImageView(
              imagePath: categoriesgridItemModelObj.manWorkEquipment!.value,
            ),
          ),
        ),
        SizedBox(height: 8.v),
        Obx(
          () => Text(
            categoriesgridItemModelObj.officeBag!.value,
            style: CustomTextStyles.labelMediumBluegray300,
          ),
        ),
      ],
    );
  }
}
