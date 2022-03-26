import 'package:get/get.dart';
import '../core/services/provider.dart';

class HomeController extends GetxController with StateMixin<List<dynamic>> {
  var isLoading = true.obs;
  static RxList<dynamic> productList = List.generate.obs as RxList;

  @override
  void onInit() {
    super.onInit();
    Provider().getUser().then((resp) {
      change(resp, status: RxStatus.success());
    }, onError: (err) {
      change(
        null,
        status: RxStatus.error(err.toString()),
      );
    });
  }
}