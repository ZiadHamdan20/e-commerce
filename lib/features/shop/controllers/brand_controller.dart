import 'package:get/get.dart';

import '../../../common/widgets/loaders/loaders.dart';
import '../../../data/repositories/brands/brand_repository.dart';
import '../../../data/repositories/product/product_repository.dart';
import '../models/brand_model.dart';
import '../models/product_model.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  RxBool isLoading = true.obs;
  final RxList<BrandModel> allBrands =<BrandModel> [].obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final brandRepository=Get.put(BrandRepository());

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }

  /// -- Load Brands
  Future<void> getFeaturedBrands() async {
    try {
      //show loader while loading Brands
      isLoading.value=true;

      final brands=await brandRepository.getAllBrands();
      allBrands.assignAll(brands);

      featuredBrands.assignAll(allBrands.where((brand)=>brand.isFeatured??false).take(4));

    } catch (e) {
    CustomLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }finally{
      isLoading.value=false;
    }
  }

/// -- Get Brands For Category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      final brands = await brandRepository.getBrandsForCategory(categoryId);
      return brands;
    } catch (e) {
      CustomLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  /// Get Brand specific Products from your data source
  Future<List<ProductModel>> getBrandProducts(
      {required String brandId, int limit=-1}) async {

    try{
    final products = await ProductRepository.instance.getProductsForBrand(brandId: brandId,limit: limit);
    return products;
  }catch(e){
      CustomLoaders.errorSnackBar(title: "Oh Snap!",message: e.toString());
      return [];
    }

  }
}