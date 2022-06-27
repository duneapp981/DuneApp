
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_hi.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations returned
/// by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('hi')
  ];

  /// No description provided for @helloWorld.
  ///
  /// In en, this message translates to:
  /// **'Hello World!'**
  String get helloWorld;

  /// No description provided for @select_language.
  ///
  /// In en, this message translates to:
  /// **'SELECT LANGUAGE'**
  String get select_language;

  /// No description provided for @continuee.
  ///
  /// In en, this message translates to:
  /// **'continue'**
  String get continuee;

  /// No description provided for @by_continuing_you_agree_to.
  ///
  /// In en, this message translates to:
  /// **'By continuing, you agree to'**
  String get by_continuing_you_agree_to;

  /// No description provided for @terms_and_condition.
  ///
  /// In en, this message translates to:
  /// **'Terms and Condition'**
  String get terms_and_condition;

  /// No description provided for @enter_mobile_number.
  ///
  /// In en, this message translates to:
  /// **'Enter Mobile Number'**
  String get enter_mobile_number;

  /// No description provided for @verification.
  ///
  /// In en, this message translates to:
  /// **'Verification'**
  String get verification;

  /// No description provided for @please_enter_the_verification_code.
  ///
  /// In en, this message translates to:
  /// **'Please enter the verification code'**
  String get please_enter_the_verification_code;

  /// No description provided for @sent_to.
  ///
  /// In en, this message translates to:
  /// **' sent to '**
  String get sent_to;

  /// No description provided for @login_as.
  ///
  /// In en, this message translates to:
  /// **'Login As'**
  String get login_as;

  /// No description provided for @didnt_receive_code.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive code ? RE-SEND'**
  String get didnt_receive_code;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'VERIFY'**
  String get verify;

  /// No description provided for @my_vehicles.
  ///
  /// In en, this message translates to:
  /// **'MY VEHICLES'**
  String get my_vehicles;

  /// No description provided for @vehicle_number.
  ///
  /// In en, this message translates to:
  /// **'Vehicle Number'**
  String get vehicle_number;

  /// No description provided for @select_vehicle_type.
  ///
  /// In en, this message translates to:
  /// **'Select Vehicle Type'**
  String get select_vehicle_type;

  /// No description provided for @load_capacity.
  ///
  /// In en, this message translates to:
  /// **'Load Capacity'**
  String get load_capacity;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'no'**
  String get no;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'yes'**
  String get yes;

  /// No description provided for @sold.
  ///
  /// In en, this message translates to:
  /// **'Sold'**
  String get sold;

  /// No description provided for @loaded.
  ///
  /// In en, this message translates to:
  /// **'Loaded'**
  String get loaded;

  /// No description provided for @empty.
  ///
  /// In en, this message translates to:
  /// **'Empty'**
  String get empty;

  /// No description provided for @deal_price.
  ///
  /// In en, this message translates to:
  /// **'Deal Price'**
  String get deal_price;

  /// No description provided for @selling_price.
  ///
  /// In en, this message translates to:
  /// **'Selling Price'**
  String get selling_price;

  /// No description provided for @failed.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get failed;

  /// No description provided for @load_vehicle.
  ///
  /// In en, this message translates to:
  /// **'Load Vehicle'**
  String get load_vehicle;

  /// No description provided for @vehicle_type.
  ///
  /// In en, this message translates to:
  /// **'Vehicle Type'**
  String get vehicle_type;

  /// No description provided for @if_current_route_is_same_as_base_route.
  ///
  /// In en, this message translates to:
  /// **'If current route is same as base route'**
  String get if_current_route_is_same_as_base_route;

  /// No description provided for @ask_price.
  ///
  /// In en, this message translates to:
  /// **'Ask Price'**
  String get ask_price;

  /// No description provided for @load.
  ///
  /// In en, this message translates to:
  /// **'Load'**
  String get load;

  /// No description provided for @material.
  ///
  /// In en, this message translates to:
  /// **'Material'**
  String get material;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @truck_capacity.
  ///
  /// In en, this message translates to:
  /// **'Truck Capacity'**
  String get truck_capacity;

  /// No description provided for @load_material.
  ///
  /// In en, this message translates to:
  /// **'Load Material'**
  String get load_material;

  /// No description provided for @edit_load_material.
  ///
  /// In en, this message translates to:
  /// **'Edit Load Material'**
  String get edit_load_material;

  /// No description provided for @sold_vehicle.
  ///
  /// In en, this message translates to:
  /// **'SOLD VEHICLE'**
  String get sold_vehicle;

  /// No description provided for @bid_vehicle.
  ///
  /// In en, this message translates to:
  /// **'BID VEHICLE'**
  String get bid_vehicle;

  /// No description provided for @buyers_details.
  ///
  /// In en, this message translates to:
  /// **'Buyer\'s Details'**
  String get buyers_details;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @number.
  ///
  /// In en, this message translates to:
  /// **'Number'**
  String get number;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @see_location_on_map.
  ///
  /// In en, this message translates to:
  /// **'See Location on Map'**
  String get see_location_on_map;

  /// No description provided for @add_vehicle.
  ///
  /// In en, this message translates to:
  /// **'Add vehicle'**
  String get add_vehicle;

  /// No description provided for @enter_quantuty.
  ///
  /// In en, this message translates to:
  /// **'Enter Quantity'**
  String get enter_quantuty;

  /// No description provided for @edit_vehicle.
  ///
  /// In en, this message translates to:
  /// **'Edit vehicle'**
  String get edit_vehicle;

  /// No description provided for @enter_ask_price.
  ///
  /// In en, this message translates to:
  /// **'Enter Ask Price'**
  String get enter_ask_price;

  /// No description provided for @base_route_from.
  ///
  /// In en, this message translates to:
  /// **'Base Route from'**
  String get base_route_from;

  /// No description provided for @enter_base_route_from.
  ///
  /// In en, this message translates to:
  /// **'Enter Base Route from'**
  String get enter_base_route_from;

  /// No description provided for @base_route_to.
  ///
  /// In en, this message translates to:
  /// **'Base Route to'**
  String get base_route_to;

  /// No description provided for @enter_driver_name.
  ///
  /// In en, this message translates to:
  /// **'Enter Driver Name'**
  String get enter_driver_name;

  /// No description provided for @enter_driver_number.
  ///
  /// In en, this message translates to:
  /// **'Enter Driver Number'**
  String get enter_driver_number;

  /// No description provided for @enter_base_route_to.
  ///
  /// In en, this message translates to:
  /// **'Enter Base Route to'**
  String get enter_base_route_to;

  /// No description provided for @select_material_category.
  ///
  /// In en, this message translates to:
  /// **'Select Material Category'**
  String get select_material_category;

  /// No description provided for @select_material_subcategory.
  ///
  /// In en, this message translates to:
  /// **'Select Material Subcategory'**
  String get select_material_subcategory;

  /// No description provided for @enter_drivers_name.
  ///
  /// In en, this message translates to:
  /// **'Enter Driver\'s Name'**
  String get enter_drivers_name;

  /// No description provided for @enter_drivers_number.
  ///
  /// In en, this message translates to:
  /// **'Enter Driver\'s Number'**
  String get enter_drivers_number;

  /// No description provided for @the_driver_has_permission_to_sell_load.
  ///
  /// In en, this message translates to:
  /// **'The driver has permission to sell load'**
  String get the_driver_has_permission_to_sell_load;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'delete'**
  String get delete;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'save'**
  String get save;

  /// No description provided for @fill_all_the_details.
  ///
  /// In en, this message translates to:
  /// **'Fill all the details.'**
  String get fill_all_the_details;

  /// No description provided for @do_you_want_to_add_this_vehical.
  ///
  /// In en, this message translates to:
  /// **'Do you want to Add this Vehical ?'**
  String get do_you_want_to_add_this_vehical;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'hi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'hi': return AppLocalizationsHi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
