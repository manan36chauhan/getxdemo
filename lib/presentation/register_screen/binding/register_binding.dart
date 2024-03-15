import 'package:manan_s_application2/presentation/register_screen/controller/register_controller.dart';
import 'package:get/get.dart';

/// A binding class for the RegisterScreen.
///
/// This class ensures that the RegisterController is created when the
/// RegisterScreen is first loaded.
class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}
