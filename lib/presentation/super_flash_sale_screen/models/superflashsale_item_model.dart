import '../../../core/app_export.dart';

/// This class is used in the [superflashsale_item_widget] screen.
class SuperflashsaleItemModel {
  SuperflashsaleItemModel({
    this.image,
    this.nikeAirMaxReact,
    this.price,
    this.price1,
    this.offer,
    this.id,
  }) {
    image = image ?? Rx(ImageConstant.imgProductImage3);
    nikeAirMaxReact = nikeAirMaxReact ?? Rx("Nike Air Max 270 React ENG");
    price = price ?? Rx("299,43");
    price1 = price1 ?? Rx("534,33");
    offer = offer ?? Rx("24% Off");
    id = id ?? Rx("");
  }

  Rx<String>? image;

  Rx<String>? nikeAirMaxReact;

  Rx<String>? price;

  Rx<String>? price1;

  Rx<String>? offer;

  Rx<String>? id;
}
