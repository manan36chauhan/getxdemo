import 'package:manan_s_application2/presentation/sort_by_screen/controller/sort_by_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SortByScreen.
///
/// This class ensures that the SortByController is created when the
/// SortByScreen is first loaded.
class SortByBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SortByController());
  }
}
