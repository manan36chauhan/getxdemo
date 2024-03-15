import 'conditionchipview_item_model.dart';
import 'buyingformatchipview_item_model.dart';
import 'itemlocationchipview_item_model.dart';
import 'showonly_item_model.dart';
import '../../../core/app_export.dart';

/// This class defines the variables used in the [filter_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class FilterModel {
  Rx<List<ConditionchipviewItemModel>> conditionchipviewItemList =
      Rx(List.generate(3, (index) => ConditionchipviewItemModel()));

  Rx<List<BuyingformatchipviewItemModel>> buyingformatchipviewItemList =
      Rx(List.generate(5, (index) => BuyingformatchipviewItemModel()));

  Rx<List<ItemlocationchipviewItemModel>> itemlocationchipviewItemList =
      Rx(List.generate(4, (index) => ItemlocationchipviewItemModel()));

  Rx<List<ShowonlyItemModel>> showonlyItemList =
      Rx(List.generate(11, (index) => ShowonlyItemModel()));
}
