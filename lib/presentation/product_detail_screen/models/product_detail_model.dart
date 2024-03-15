import 'widget_item_model.dart';
import '../../../core/app_export.dart';
import 'sizes_item_model.dart';
import 'bluelist_item_model.dart';
import 'products1_item_model.dart';
import 'recommended_item_model.dart';

/// This class defines the variables used in the [product_detail_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ProductDetailModel {
  Rx<List<WidgetItemModel>> widgetItemList =
      Rx(List.generate(1, (index) => WidgetItemModel()));

  Rx<List<SizesItemModel>> sizesItemList = Rx([
    SizesItemModel(six: "6".obs),
    SizesItemModel(six: "6.5".obs),
    SizesItemModel(six: "7".obs),
    SizesItemModel(six: "7.5".obs),
    SizesItemModel(six: "8".obs),
    SizesItemModel(six: "8.5".obs)
  ]);

  Rx<List<BluelistItemModel>> bluelistItemList =
      Rx(List.generate(6, (index) => BluelistItemModel()));

  Rx<List<Products1ItemModel>> products1ItemList = Rx([
    Products1ItemModel(productPicture: ImageConstant.imgProductPicture02.obs),
    Products1ItemModel(productPicture: ImageConstant.imgProductPicture03.obs),
    Products1ItemModel(productPicture: ImageConstant.imgProductPicture01.obs)
  ]);

  Rx<List<RecommendedItemModel>> recommendedItemList = Rx([
    RecommendedItemModel(
        image: ImageConstant.imgProductImage.obs,
        fSNikeAirMax: "FS - Nike Air Max 270 React...".obs,
        price: "299,43".obs,
        price1: "534,33".obs,
        offer: "24% Off".obs),
    RecommendedItemModel(
        image: ImageConstant.imgProductImage109x109.obs,
        fSNikeAirMax: "FS - QUILTED MAXI CROS...".obs,
        price: "299,43".obs,
        price1: "534,33".obs,
        offer: "24% Off".obs),
    RecommendedItemModel(
        image: ImageConstant.imgProductImage1.obs,
        fSNikeAirMax: "FS - Nike Air Max 270 React...".obs,
        price: "299,43".obs,
        price1: "534,33".obs,
        offer: "24% Off".obs)
  ]);
}
