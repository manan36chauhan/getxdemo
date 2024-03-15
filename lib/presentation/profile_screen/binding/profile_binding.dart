import 'package:manan_s_application2/presentation/profile_screen/controller/profile_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ProfileScreen.
///
/// This class ensures that the ProfileController is created when the
/// ProfileScreen is first loaded.
class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
}
