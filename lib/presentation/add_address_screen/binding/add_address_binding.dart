import 'package:manan_s_application2/presentation/add_address_screen/controller/add_address_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AddAddressScreen.
///
/// This class ensures that the AddAddressController is created when the
/// AddAddressScreen is first loaded.
class AddAddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddAddressController());
  }
}
