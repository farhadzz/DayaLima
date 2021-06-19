import 'package:dayalimatest/helpers/network_helpers.dart';
import 'package:dayalimatest/models/category_list_model.dart';
import 'package:dayalimatest/models/category_model.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  var _data;
  var _isLoad = false.obs;
  var _dataList;
  var _isLoadList = false.obs;

  bool get isLoad => _isLoad.value;
  bool get isLoadList => _isLoadList.value;
  CategoryModel get data => _data;
  CategoryListModel get dataList => _dataList;

  @override
  void onInit() {
    fetchCategory();
    super.onInit();
  }

  disposeList() {
    _dataList = null;
    _isLoadList.value = false;
  }

  Future<void> fetchCategory() async {
    try {
      String uri = "https://s3-ap-southeast-1.amazonaws.com/static.klob.id/tmp_files/index.json";
      NetworkHelpers fetch = NetworkHelpers(uri);
      var output = await fetch.getData();
      _data = CategoryModel.fromJson(output);
    } catch(e) {
      print(e);
      throw(e);
    } finally {
      _isLoad.value = _data != null;
      update();
    }
  }

  Future<void> fetchList(String val) async {
    try {
      String uri = "https://s3-ap-southeast-1.amazonaws.com/static.klob.id/tmp_files/$val.json";
      NetworkHelpers fetch = NetworkHelpers(uri);
      var output = await fetch.getData();
      _dataList = CategoryListModel.fromJson(output);
      print(_dataList);
      update();
    } catch(e) {
      print(e);
      throw(e);
    } finally {
      _isLoadList.value = _dataList != null;
      update();
    }
  }
}