class Urls{
  static const String _baseUrl='http://ecom-api.teamrabbil.com/api';
  static String getHomeSlider='$_baseUrl/ListProductSlider';
  static String getCategory='$_baseUrl/CategoryList';
  static String getProductListByCategory(int categoryId) =>'$_baseUrl/ListProductByCategory/$categoryId';
  static String getProductListByRemark(String remark) =>'$_baseUrl/ListProductByRemark/$remark';
  static String getProductDetails(int productID) =>'$_baseUrl/ProductDetailsById/$productID';
}