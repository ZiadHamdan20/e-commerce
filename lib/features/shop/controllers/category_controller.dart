import 'package:get/get.dart';

import '../../../common/widgets/loaders/loaders.dart';
import '../../../data/repositories/categories/category_repository.dart';
import '../models/category_model.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final _categoryRepository = Get.put(CategoryRepository());
  final isLoading=false.obs;
  RxList<CategoryModel>allCategories=<CategoryModel>[].obs;
  RxList<CategoryModel>featuredCategories=<CategoryModel>[].obs;



  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      // Show loader while loading categories
      isLoading.value=true;

      // Fetch categories from data source (Firestore, API, etc.)
      final categories=await _categoryRepository.getAllCategories();

      // Update the categories list
      allCategories.assignAll(categories);

      // Filter featured categories
      featuredCategories.assignAll(allCategories.where((category)=>category.isFeatured && category.parentId.isEmpty).take(8).toList());

    } catch (e) {
      CustomLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove Loader
      isLoading.value=false;

    }
  }
}