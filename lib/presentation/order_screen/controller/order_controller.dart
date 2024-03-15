import '../../../core/app_export.dart';
import '../models/order_model.dart';

/// A controller class for the OrderScreen.
///
/// This class manages the state of the OrderScreen, including the
/// current orderModelObj
class OrderController extends GetxController {
  Rx<OrderModel> orderModelObj = OrderModel().obs;
}
