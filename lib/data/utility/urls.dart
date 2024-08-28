class Urls{
  static const String _baseUrl='http://ecom-api.teamrabbil.com/api';
  static String getHomeSlider='$_baseUrl/ListProductSlider';
  static String getCategory='$_baseUrl/CategoryList';
  static String getProductListByCategory(int categoryId) =>'$_baseUrl/ListProductByCategory/$categoryId';
  static String getProductListByRemark(String remark) =>'$_baseUrl/ListProductByRemark/$remark';
  static String getProductDetails(int productID) =>'$_baseUrl/ProductDetailsById/$productID';
  static String getAddToCart ='$_baseUrl/CreateCartList';
  static String getVerifyEmail(String email) =>'$_baseUrl/UserLogin/$email';
  static String getVerifyOtp(String email,String otp) =>'$_baseUrl/VerifyLogin/$email/$otp';
  static String getAddToWishList(int productId) =>'$_baseUrl/CreateWishList/$productId';
  static String getWishList ='$_baseUrl/ProductWishList';
  static String getCreateProfile = '$_baseUrl/CreateProfile';
  static String getReadProfile = '$_baseUrl/ReadProfile';
  static String getCartList = '$_baseUrl/CartList';
  static String getCreateReview = '$_baseUrl/CreateProductReview';
  static String getListReviewByProduct(int productId) => '$_baseUrl/ListReviewByProduct/$productId';
  static String getDeleteCartProductListProduct(int productId) => '$_baseUrl/DeleteCartList/$productId';
}