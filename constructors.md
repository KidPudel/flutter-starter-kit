- basic `MyClass(this.name)`
- with named parameters `MyClass({this.name})`
- with required parameters `MyClass({required this.name})`
- with required parameters `MyClass.secondConstructor({required this.name})`
- factory (return the same instance) `factory MyClass.factory constructor({required this.name})`
- hidden (return the same instance) 
  ```dart
  MyClass.hiddenConstructor();
  static final _construcor = MyClass.hiddenConstructor();
  factory MyClass() {
    return _constructor;
  }
  ```
- multiple singleton contructors
  ```dart
  class Routes {
  final String route;
  Routes._(this.route);

  factory Routes.startPage() => Routes._("/");
  factory Routes.loginPage() => Routes._("/login_page");
  factory Routes.smsPage() => Routes._("/sms_page");
  factory Routes.mapPage() => Routes._("/map_page");
  factory Routes.addressPage() => Routes._("/address_page");
  factory Routes.navigationPage() => Routes._("/navigation_page");
  factory Routes.specialOfferPage() => Routes._("/special_offer_page");
  factory Routes.savedAddressesPage() => Routes._("/saved_addresses_page");
  factory Routes.basketPage() => Routes._("/basket_page");
  factory Routes.paymentPage() => Routes._("/payment_page");
}
  ```
