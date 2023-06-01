import 'package:coupino_api_call_usingget/model/model_coupino.dart';
import 'package:get/get.dart';

import '../remote_services.dart';

class CoupinoController extends GetxController {

  @override
  void onInit(){
    fetchDetails();
    super.onInit();
  }
   var postDet = <Post>[].obs;
  Future<List<Post>?> fetchDetails() async {
    var details = await RemoteServices().fetchpostDetails();
    if(details!= null){
      postDet.value = details!;
    }
    print(postDet.length);
  }
}