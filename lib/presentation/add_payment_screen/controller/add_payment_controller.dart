import '../../../core/app_export.dart';
import '../models/add_payment_model.dart';

/// A controller class for the AddPaymentScreen.
///
/// This class manages the state of the AddPaymentScreen, including the
/// current addPaymentModelObj
class AddPaymentController extends GetxController {
  Rx<AddPaymentModel> addPaymentModelObj = AddPaymentModel().obs;
}
