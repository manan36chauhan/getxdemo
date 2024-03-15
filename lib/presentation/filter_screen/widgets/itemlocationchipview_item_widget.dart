import '../models/itemlocationchipview_item_model.dart';
import 'package:flutter/material.dart';
import 'package:manan_s_application2/core/app_export.dart';

// ignore: must_be_immutable
class ItemlocationchipviewItemWidget extends StatelessWidget {
  ItemlocationchipviewItemWidget(
    this.itemlocationchipviewItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ItemlocationchipviewItemModel itemlocationchipviewItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Theme(
        data: ThemeData(
          canvasColor: Colors.transparent,
        ),
        child: RawChip(
          padding: EdgeInsets.all(16.h),
          showCheckmark: false,
          labelPadding: EdgeInsets.zero,
          label: Text(
            itemlocationchipviewItemModelObj.uSOnly!.value,
            style: TextStyle(
              color:
                  (itemlocationchipviewItemModelObj.isSelected?.value ?? false)
                      ? theme.colorScheme.primary.withOpacity(1)
                      : appTheme.blueGray300,
              fontSize: 12.fSize,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
          selected:
              (itemlocationchipviewItemModelObj.isSelected?.value ?? false),
          backgroundColor: Colors.transparent,
          selectedColor: theme.colorScheme.primary.withOpacity(0.1),
          shape: (itemlocationchipviewItemModelObj.isSelected?.value ?? false)
              ? RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.circular(
                    5.h,
                  ),
                )
              : RoundedRectangleBorder(
                  side: BorderSide(
                    color: appTheme.blue50,
                    width: 1.h,
                  ),
                  borderRadius: BorderRadius.circular(
                    5.h,
                  ),
                ),
          onSelected: (value) {
            itemlocationchipviewItemModelObj.isSelected!.value = value;
          },
        ),
      ),
    );
  }
}
