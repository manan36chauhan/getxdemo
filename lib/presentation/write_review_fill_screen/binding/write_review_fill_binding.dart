import 'package:manan_s_application2/presentation/write_review_fill_screen/controller/write_review_fill_controller.dart';
import 'package:get/get.dart';

/// A binding class for the WriteReviewFillScreen.
///
/// This class ensures that the WriteReviewFillController is created when the
/// WriteReviewFillScreen is first loaded.
class WriteReviewFillBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WriteReviewFillController());
  }
}
