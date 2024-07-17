import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_tk.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'app_localizations/app_localizations.dart';
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
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
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

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
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
    Locale('ru'),
    Locale('tk')
  ];

  /// No description provided for @networkError.
  ///
  /// In tk, this message translates to:
  /// **'Internet birikmesi ýok.'**
  String get networkError;

  /// No description provided for @networkErrorDescription.
  ///
  /// In tk, this message translates to:
  /// **'Birnäçe wagtdan soň synanyşmagyňyzy Sizden haýyş edýäris.'**
  String get networkErrorDescription;

  /// No description provided for @networkErrorButton.
  ///
  /// In tk, this message translates to:
  /// **'Gaýtadan synanyşyň'**
  String get networkErrorButton;

  /// No description provided for @services.
  ///
  /// In tk, this message translates to:
  /// **'Bölümler'**
  String get services;

  /// No description provided for @entryPage.
  ///
  /// In tk, this message translates to:
  /// **'Baş sahypa'**
  String get entryPage;

  /// No description provided for @main.
  ///
  /// In tk, this message translates to:
  /// **'Esasy'**
  String get main;

  /// No description provided for @profile.
  ///
  /// In tk, this message translates to:
  /// **'Profil'**
  String get profile;

  /// No description provided for @profileEdit.
  ///
  /// In tk, this message translates to:
  /// **'Profili sazlamak'**
  String get profileEdit;

  /// No description provided for @phoneNumber.
  ///
  /// In tk, this message translates to:
  /// **'Telefon nomeri'**
  String get phoneNumber;

  /// No description provided for @firstname.
  ///
  /// In tk, this message translates to:
  /// **'Ady'**
  String get firstname;

  /// No description provided for @lastname.
  ///
  /// In tk, this message translates to:
  /// **'Familiýasy'**
  String get lastname;

  /// No description provided for @email.
  ///
  /// In tk, this message translates to:
  /// **'Elektron poçtasy'**
  String get email;

  /// No description provided for @technicalSupportTitle.
  ///
  /// In tk, this message translates to:
  /// **'Tehniki kömek'**
  String get technicalSupportTitle;

  /// No description provided for @technicalSupportDescription.
  ///
  /// In tk, this message translates to:
  /// **'Soraglaryňyz boýunça habarlaşmak'**
  String get technicalSupportDescription;

  /// No description provided for @manageAddressesTitle.
  ///
  /// In tk, this message translates to:
  /// **'Salgylarym'**
  String get manageAddressesTitle;

  /// No description provided for @manageAddressesDescription.
  ///
  /// In tk, this message translates to:
  /// **'Salgylaryňyzy dolandyryň'**
  String get manageAddressesDescription;

  /// No description provided for @settings.
  ///
  /// In tk, this message translates to:
  /// **'Sazlamalar'**
  String get settings;

  /// No description provided for @language.
  ///
  /// In tk, this message translates to:
  /// **'Dil'**
  String get language;

  /// No description provided for @languageSelectTitle.
  ///
  /// In tk, this message translates to:
  /// **'Dil'**
  String get languageSelectTitle;

  /// No description provided for @languageSelectDescription.
  ///
  /// In tk, this message translates to:
  /// **'Programmanyň dilini saýlaň'**
  String get languageSelectDescription;

  /// No description provided for @startShopping.
  ///
  /// In tk, this message translates to:
  /// **'Söwda başla'**
  String get startShopping;

  /// No description provided for @order.
  ///
  /// In tk, this message translates to:
  /// **'Sargyt'**
  String get order;

  /// No description provided for @orderTotal.
  ///
  /// In tk, this message translates to:
  /// **'Sargyt hasabyňyz'**
  String get orderTotal;

  /// No description provided for @orders.
  ///
  /// In tk, this message translates to:
  /// **'Sargytlarym'**
  String get orders;

  /// No description provided for @ordersEmptyTitle.
  ///
  /// In tk, this message translates to:
  /// **'Sargyt ýok'**
  String get ordersEmptyTitle;

  /// No description provided for @ordersEmptyDescription.
  ///
  /// In tk, this message translates to:
  /// **'Sargytlaryňyzyň sanawy şu ýerde görkeziler'**
  String get ordersEmptyDescription;

  /// No description provided for @favoritesEmptyTitle.
  ///
  /// In tk, this message translates to:
  /// **'Halanlarym ýok'**
  String get favoritesEmptyTitle;

  /// No description provided for @favoritesEmptyDescription.
  ///
  /// In tk, this message translates to:
  /// **'Halanlaryňyzyň sanawy şu ýerde görkeziler'**
  String get favoritesEmptyDescription;

  /// No description provided for @productSize.
  ///
  /// In tk, this message translates to:
  /// **'Ölçegi'**
  String get productSize;

  /// No description provided for @productColor.
  ///
  /// In tk, this message translates to:
  /// **'Reňki'**
  String get productColor;

  /// No description provided for @productPrice.
  ///
  /// In tk, this message translates to:
  /// **'Bahasy'**
  String get productPrice;

  /// No description provided for @addresses.
  ///
  /// In tk, this message translates to:
  /// **'Salgylarym'**
  String get addresses;

  /// No description provided for @addressesCreate.
  ///
  /// In tk, this message translates to:
  /// **'Salgy goş'**
  String get addressesCreate;

  /// No description provided for @checkOutCompleteTitle.
  ///
  /// In tk, this message translates to:
  /// **'Sargydyňyz ýerleşdirildi'**
  String get checkOutCompleteTitle;

  /// No description provided for @checkOutCompleteContent.
  ///
  /// In tk, this message translates to:
  /// **'Operator Size jaň eder sargydyňyzy tassyklamak üçin jaň eder!'**
  String get checkOutCompleteContent;

  /// No description provided for @deliveryTariffTitle.
  ///
  /// In tk, this message translates to:
  /// **'Eltip berme görnüşi'**
  String get deliveryTariffTitle;

  /// No description provided for @trackOrder.
  ///
  /// In tk, this message translates to:
  /// **'Sargydy yzarla'**
  String get trackOrder;

  /// No description provided for @complete.
  ///
  /// In tk, this message translates to:
  /// **'Tamamla'**
  String get complete;

  /// No description provided for @confirm.
  ///
  /// In tk, this message translates to:
  /// **'Tassykla'**
  String get confirm;

  /// No description provided for @goToTheCart.
  ///
  /// In tk, this message translates to:
  /// **'Sebede git'**
  String get goToTheCart;

  /// No description provided for @totalCost.
  ///
  /// In tk, this message translates to:
  /// **'Umumy baha'**
  String get totalCost;

  /// No description provided for @paymentMethod.
  ///
  /// In tk, this message translates to:
  /// **'Töleg usuly'**
  String get paymentMethod;

  /// No description provided for @paymentMethodCash.
  ///
  /// In tk, this message translates to:
  /// **'Nagt'**
  String get paymentMethodCash;

  /// No description provided for @paymentMethodTerminal.
  ///
  /// In tk, this message translates to:
  /// **'Terminal'**
  String get paymentMethodTerminal;

  /// No description provided for @orderType.
  ///
  /// In tk, this message translates to:
  /// **'Sargyt görnüşi'**
  String get orderType;

  /// No description provided for @orderConfirmation.
  ///
  /// In tk, this message translates to:
  /// **'Sargydy tassyklamak'**
  String get orderConfirmation;

  /// No description provided for @orderNotes.
  ///
  /// In tk, this message translates to:
  /// **'Sargyt üçin bellik'**
  String get orderNotes;

  /// No description provided for @orderNotesDescription.
  ///
  /// In tk, this message translates to:
  /// **'Ýörite haýyşlar, ýa-da eltip berme üçin bellikler'**
  String get orderNotesDescription;

  /// No description provided for @orderNotesDescription2.
  ///
  /// In tk, this message translates to:
  /// **'Ýörite haýyşlar, allergiýa, iýmitleniş çäklendirmeleri'**
  String get orderNotesDescription2;

  /// No description provided for @selectAddress.
  ///
  /// In tk, this message translates to:
  /// **'Salgyňyzy saýlan'**
  String get selectAddress;

  /// No description provided for @selectAddressEmpty.
  ///
  /// In tk, this message translates to:
  /// **'Saýlanmadyk'**
  String get selectAddressEmpty;

  /// No description provided for @cart.
  ///
  /// In tk, this message translates to:
  /// **'Sebet'**
  String get cart;

  /// No description provided for @cartAddSuccess.
  ///
  /// In tk, this message translates to:
  /// **'Haryt üstünlikli sebede goşyldy'**
  String get cartAddSuccess;

  /// No description provided for @cartClearTitle.
  ///
  /// In tk, this message translates to:
  /// **'Pozmagy tassyklaň'**
  String get cartClearTitle;

  /// No description provided for @cartClearContent.
  ///
  /// In tk, this message translates to:
  /// **'Tassyklamak düwmesine basylanyndan soňra sebediňizdäki harytlary gaýtadan dikeltmek mümkin däldir.'**
  String get cartClearContent;

  /// No description provided for @cartEmptyTitle.
  ///
  /// In tk, this message translates to:
  /// **'Sebet boş'**
  String get cartEmptyTitle;

  /// No description provided for @cartEmptyDescription.
  ///
  /// In tk, this message translates to:
  /// **'Sebetiň sanawy şu ýerde görkeziler'**
  String get cartEmptyDescription;

  /// No description provided for @placeAnOrder.
  ///
  /// In tk, this message translates to:
  /// **'Sargyt et'**
  String get placeAnOrder;

  /// No description provided for @success.
  ///
  /// In tk, this message translates to:
  /// **'Üstünlik'**
  String get success;

  /// No description provided for @cancel.
  ///
  /// In tk, this message translates to:
  /// **'Ýatyr'**
  String get cancel;

  /// No description provided for @close.
  ///
  /// In tk, this message translates to:
  /// **'Ýap'**
  String get close;

  /// No description provided for @clear.
  ///
  /// In tk, this message translates to:
  /// **'Pozmak'**
  String get clear;

  /// No description provided for @productsEmptyTitle.
  ///
  /// In tk, this message translates to:
  /// **'Harytlar Tapylmady'**
  String get productsEmptyTitle;

  /// No description provided for @productsEmptyDescription.
  ///
  /// In tk, this message translates to:
  /// **'Häzirki wagtda harytlar ýok.'**
  String get productsEmptyDescription;

  /// No description provided for @home.
  ///
  /// In tk, this message translates to:
  /// **'Baş sahypa'**
  String get home;

  /// No description provided for @category.
  ///
  /// In tk, this message translates to:
  /// **'Kategoriýa'**
  String get category;

  /// No description provided for @favorites.
  ///
  /// In tk, this message translates to:
  /// **'Halanlarym'**
  String get favorites;

  /// No description provided for @authenticationPage.
  ///
  /// In tk, this message translates to:
  /// **'Agza bolmak sahypasy'**
  String get authenticationPage;

  /// No description provided for @login.
  ///
  /// In tk, this message translates to:
  /// **'Agza bolmak'**
  String get login;

  /// No description provided for @register.
  ///
  /// In tk, this message translates to:
  /// **'Hasap döretmek'**
  String get register;

  /// No description provided for @submit.
  ///
  /// In tk, this message translates to:
  /// **'Tassykla'**
  String get submit;

  /// No description provided for @continueT.
  ///
  /// In tk, this message translates to:
  /// **'Dowam et'**
  String get continueT;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ru', 'tk'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'ru': return AppLocalizationsRu();
    case 'tk': return AppLocalizationsTk();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
