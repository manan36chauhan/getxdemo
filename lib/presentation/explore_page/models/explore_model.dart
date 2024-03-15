import '../../../core/app_export.dart';
import 'categoriesgrid_item_model.dart';
import 'categoriesgrid1_item_model.dart';

/// This class defines the variables used in the [explore_page],
/// and is typically used to hold data that is passed between different parts of the application.
class ExploreModel {
  Rx<List<CategoriesgridItemModel>> categoriesgridItemList = Rx([
    CategoriesgridItemModel(
        manWorkEquipment: ImageConstant.imgManWorkEquipment.obs,
        officeBag: "Office Bag".obs),
    CategoriesgridItemModel(
        manWorkEquipment: ImageConstant.imgArrowRight.obs,
        officeBag: "Shirt".obs),
    CategoriesgridItemModel(
        manWorkEquipment: ImageConstant.imgManTShirtIcon.obs,
        officeBag: "T-Shirt".obs),
    CategoriesgridItemModel(
        manWorkEquipment: ImageConstant.imgManShoesIcon.obs,
        officeBag: "Shoes".obs),
    CategoriesgridItemModel(
        manWorkEquipment: ImageConstant.imgManPantsIcon.obs,
        officeBag: "Pants".obs),
    CategoriesgridItemModel(
        manWorkEquipment: ImageConstant.imgManUnderwearIcon.obs,
        officeBag: "Underwear".obs)
  ]);

  Rx<List<Categoriesgrid1ItemModel>> categoriesgrid1ItemList = Rx([
    Categoriesgrid1ItemModel(
        womanTShirtIcon: ImageConstant.imgWomanTShirtIcon.obs,
        tShirt: "T-Shirt".obs),
    Categoriesgrid1ItemModel(
        womanTShirtIcon: ImageConstant.imgDressIcon.obs, tShirt: "Dress".obs),
    Categoriesgrid1ItemModel(
        womanTShirtIcon: ImageConstant.imgWomanPantsIcon.obs,
        tShirt: "Pants".obs),
    Categoriesgrid1ItemModel(
        womanTShirtIcon: ImageConstant.imgSkirtIcon.obs, tShirt: "Skirt".obs),
    Categoriesgrid1ItemModel(
        womanTShirtIcon: ImageConstant.imgWomanBagIcon.obs, tShirt: "Bag".obs),
    Categoriesgrid1ItemModel(
        womanTShirtIcon: ImageConstant.imgHighHeelsIcon.obs,
        tShirt: "Heels".obs),
    Categoriesgrid1ItemModel(
        womanTShirtIcon: ImageConstant.imgBikiniIcon.obs, tShirt: "Bikini".obs)
  ]);
}
