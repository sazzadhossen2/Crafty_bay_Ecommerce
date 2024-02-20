class Utils {
  static const String _basUrl = 'http://ecom-api.teamrabbil.com/api';

  static String verifyEmail(String email) => '$_basUrl/UserLogin/$email';

  static String verifyOtp(String email, String otp) =>
      '$_basUrl/VerifyLogin/$email/$otp';
  static const String readProfile = '$_basUrl/ReadProfile';
  static const String creatProfile = '$_basUrl/CreateProfile';
  static const String homeBannerList = '$_basUrl/ListProductSlider';
  static const String categoryList = '$_basUrl/CategoryList';
  static const String popularProduct = '$_basUrl/ListProductByRemark/popular';
  static const String newProduct = '$_basUrl/ListProductByRemark/new';
  static const String specialProduct = '$_basUrl/ListProductByRemark/special';

  static String Listproduct(int categoryId) =>
      '$_basUrl/ListProductByCategory/$categoryId';

  static String productDetails(int productDetailsId) =>
      '$_basUrl/ProductDetailsById/$productDetailsId';

  static const String addToCart= '$_basUrl/CreateCartList';
  static const String cartItemList='$_basUrl/CartList';
}
