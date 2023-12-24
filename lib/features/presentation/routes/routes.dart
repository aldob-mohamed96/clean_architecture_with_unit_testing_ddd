//class of all routes
sealed class Routes {
  //initial
  static const String splash = '/';
  static const String onBoarding = '/onBoarding';
  //auth
  static const String login = '/login';
  static const String register = 'register';
  static const String registerUrl = '/login/register';
  static const String resetPasswordSendCode = 'resetPasswordSendCode';
  static const String resetPasswordConfirmCode = 'resetPasswordConfirmCode';
  static const String resetPasswordCreateNewPasword =
      'resetPasswordCreateNewPasword';

  static const String resetPasswordUlr = '/resetPassword/resetPassword';
  static const String blocked = '/blocked';

  // app
  static const String home = '/home';
  static const String shippDataSea = 'shippDataSea';
  static const String shippDataSeaUrl = '/home/shippDataSea';
  static const String shippDataAir = 'shippDataAir';
  static const String shippDataAirUrl = '/home/shippDataAir';
  static const String faq = 'faq';
  static const String calcShippmentCost = 'calcShippmentCost';

  //wallet
  static const String wallet = 'wallet';
  static const String walletBondDetails = 'walletBondDetails';

  static const String profile = 'profile';
  static const String updateProfile = 'updateProfile';
  static const String confirmEmail = 'confirmEmailProfile';

  static const String notification = '/notification';
  static const String notificationDetails = 'notificationDetails';

  //support
  static const String support = 'support';

  //packages
  static const String parcelsRecipient = '/parcelsRecipient';
  static const String parcelsRecipientNotShippedSeaAndAir =
      'recipientNotShippedSeaAndAir';
  static const String parcelsRecipientNotSeaAndAirDetails =
      'recipient-details-not-shipped';

  static const String parcelsRecipientShippedSeaAndAir =
      'recipientShippedSeaAndAir';
  static const String parcelsRecipientShippedSeaAndAirDetails =
      'recipient-details-shipped';

  static const String parcelsShipped = '/parcelsShipped';
  static const String parcelsShippedSeaAndAirDetails = 'details-shipped';
  static const String parcelsShippedShippmentDataSeaAndAirDetails =
      'shippment-details-shipped';

  static const String parcelsCurrentShipped = '/parcelsCurrentShipped';
  static const String parcelsCurrentShippedSeaAndAirDetails =
      'details-current-shipped';
  static const String parcelsCurrentShippedShippmentDataSeaAndAirDetails =
      'shippment-details-current-shipped';

  // make order
  static const String makeOrderToShippment = 'make-order-to-shippment';
  static const String confirmOrderShippment = 'confirm-order-shippment';
  static const String shippingOrderDone = 'shipping-order-done';

  //undefine
  static const String unDefine = '/unDefineRoute';
}
