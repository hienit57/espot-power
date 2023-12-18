class AppRoutes {
  static const onboarding = '/onboarding';
  static const home = '/home';

  ///Authentication
  static const verifyUserExists = '/verify-login';
  static const verifyOtp = '/verify-otp';
  static const verifyReferrer = '/verify-referrer';
  static const passwordSettings = '/password-settings';
  static const login = '/login';
  static const forgotPassword = '/forgot-password';

  ///Map
  static const map = '/map';

  ///Profile
  static const profile = '/profile';
  static const personalInformation = '/personal-information';
  static const changePassword = '/change-password';
  static const updateInformationUser = '/update-information-user';
  static const baseResultFeature = '/result-feature';
  static const informationAndSupportCenter = '/information-and-support-center';
  static const supportWebview = '/support-webview';
  static const userManual = '/user-manual';
  static const contactForCooperation = '/contact-for-cooperation';
  static const userFeedback = '/feedback';

  ///Notification
  static const notification = '/notification';

  ///Transaction
  static const transaction = '/dashboard-transaction';
  static const detailOrder = '/detail-order';

  ///Deposit Money Into Your Account
  static const dashboardDepositMoney = '/dashboard-deposit-money';
  static const dashboardElectronicWallet = '/dashboard-electronic-wallet';

  ///Transfer Money
  static const transferMoney = '/transfer-money';
  static const verifyTransferMoney = '/verify-transfer-money';

  ///Voucher
  static const voucher = '/voucher';

  ///Withdraw money
  static const addBankAccount = '/add-bank-account';
  static const selectBankAccount = '/select-bank-account';
  static const inputAmountWithdraw = '/input-amount-withdraw';
  static const verifyAmountWithdaw = '/verify-amount-withdraw';

  ///QRScan
  static const qrScan = '/qr-scan';
  static const balanceNotEnough = '/balance-not-enough';
  static const chargingStationErrorPage = '/charging-station-error';
  static const orderConfirmation = '/order-confirmation';

  // static Map<String, String> profile = {
  //   "profile": "/profile",
  //   "personal-information": "/personal-information",
  // };

  static const rentalBatteryFailed = 'rental-battery_failed';
  static const formOrderSuccess = '/form-order-success';
  static const checkOnepayOrder = '/onepay';
  static const checkZaloPay = '/zalopay';
  static const checkMomo = '/momo';
}
