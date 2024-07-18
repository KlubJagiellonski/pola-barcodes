/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 36 (18 per locale)
///
/// Built on 2024-07-17 at 12:49 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	en(languageCode: 'en', build: Translations.build),
	pl(languageCode: 'pl', build: _StringsPl.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	String get appTitle => 'Pola test codes';
	String get barcodeList => 'Barcode List';
	String get description => 'Description';
	String get code => 'Barcode';
	String get addCode => 'Add Barcode';
	late final _StringsErrorEn error = _StringsErrorEn._(_root);
	String get codeType => 'Code type';
	late final _StringsBarcodesDescriptionEn barcodesDescription = _StringsBarcodesDescriptionEn._(_root);
}

// Path: error
class _StringsErrorEn {
	_StringsErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get emptyDescription => 'Description cannot be empty';
	String get emptyCode => 'Barcode cannot be empty';
	String get invalidCode => 'Invalid barcode';
}

// Path: barcodesDescription
class _StringsBarcodesDescriptionEn {
	_StringsBarcodesDescriptionEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get companyNotVerified => 'Company not verified';
	String get companyVerifiedWithFullScores => 'Company verified with full scores';
	String get companyVerifiedWithIncompleteScores => 'Company verified with incomplete scores';
	String get internalCode => 'Internal Code';
	String get companyRegisteredOutsidePoland => 'Company registered outside Poland';
	String get companyRegisteredIn => 'Company registered in...';
	String get lidlOwnBrand => 'Lidl\'s own brand';
	String get polaFriend => 'Pola\'s Friend';
	String get extendedCompanyDescription => 'Extended company description';
}

// Path: <root>
class _StringsPl implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsPl.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.pl,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <pl>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsPl _root = this; // ignore: unused_field

	// Translations
	@override String get appTitle => 'Kody testowe poli';
	@override String get barcodeList => 'Lista Kodów Kreskowych';
	@override String get description => 'Opis';
	@override String get code => 'Kod kreskowy';
	@override String get addCode => 'Dodaj kod kreskowy';
	@override late final _StringsErrorPl error = _StringsErrorPl._(_root);
	@override String get codeType => 'Typ kodu';
	@override late final _StringsBarcodesDescriptionPl barcodesDescription = _StringsBarcodesDescriptionPl._(_root);
}

// Path: error
class _StringsErrorPl implements _StringsErrorEn {
	_StringsErrorPl._(this._root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get emptyDescription => 'Opis nie może być pusty';
	@override String get emptyCode => 'Kod kreskowy nie może być pusty';
	@override String get invalidCode => 'Nieprawidłowy kod kreskowy';
}

// Path: barcodesDescription
class _StringsBarcodesDescriptionPl implements _StringsBarcodesDescriptionEn {
	_StringsBarcodesDescriptionPl._(this._root);

	@override final _StringsPl _root; // ignore: unused_field

	// Translations
	@override String get companyNotVerified => 'Firma nie zweryfikowana';
	@override String get companyVerifiedWithFullScores => 'Firma zweryfikowana z pełną punktacją';
	@override String get companyVerifiedWithIncompleteScores => 'Firma zweryfikowana z niepełną punktacją';
	@override String get internalCode => 'Kod wewnętrzny';
	@override String get companyRegisteredOutsidePoland => 'Firma zarejestrowana poza Polską';
	@override String get companyRegisteredIn => 'Firma zarejerstrowana w ...';
	@override String get lidlOwnBrand => 'Marka własna Lidla';
	@override String get polaFriend => 'Przyjaciel Poli';
	@override String get extendedCompanyDescription => 'Rozszerzony opis firmy';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'appTitle': return 'Pola test codes';
			case 'barcodeList': return 'Barcode List';
			case 'description': return 'Description';
			case 'code': return 'Barcode';
			case 'addCode': return 'Add Barcode';
			case 'error.emptyDescription': return 'Description cannot be empty';
			case 'error.emptyCode': return 'Barcode cannot be empty';
			case 'error.invalidCode': return 'Invalid barcode';
			case 'codeType': return 'Code type';
			case 'barcodesDescription.companyNotVerified': return 'Company not verified';
			case 'barcodesDescription.companyVerifiedWithFullScores': return 'Company verified with full scores';
			case 'barcodesDescription.companyVerifiedWithIncompleteScores': return 'Company verified with incomplete scores';
			case 'barcodesDescription.internalCode': return 'Internal Code';
			case 'barcodesDescription.companyRegisteredOutsidePoland': return 'Company registered outside Poland';
			case 'barcodesDescription.companyRegisteredIn': return 'Company registered in...';
			case 'barcodesDescription.lidlOwnBrand': return 'Lidl\'s own brand';
			case 'barcodesDescription.polaFriend': return 'Pola\'s Friend';
			case 'barcodesDescription.extendedCompanyDescription': return 'Extended company description';
			default: return null;
		}
	}
}

extension on _StringsPl {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'appTitle': return 'Kody testowe poli';
			case 'barcodeList': return 'Lista Kodów Kreskowych';
			case 'description': return 'Opis';
			case 'code': return 'Kod kreskowy';
			case 'addCode': return 'Dodaj kod kreskowy';
			case 'error.emptyDescription': return 'Opis nie może być pusty';
			case 'error.emptyCode': return 'Kod kreskowy nie może być pusty';
			case 'error.invalidCode': return 'Nieprawidłowy kod kreskowy';
			case 'codeType': return 'Typ kodu';
			case 'barcodesDescription.companyNotVerified': return 'Firma nie zweryfikowana';
			case 'barcodesDescription.companyVerifiedWithFullScores': return 'Firma zweryfikowana z pełną punktacją';
			case 'barcodesDescription.companyVerifiedWithIncompleteScores': return 'Firma zweryfikowana z niepełną punktacją';
			case 'barcodesDescription.internalCode': return 'Kod wewnętrzny';
			case 'barcodesDescription.companyRegisteredOutsidePoland': return 'Firma zarejestrowana poza Polską';
			case 'barcodesDescription.companyRegisteredIn': return 'Firma zarejerstrowana w ...';
			case 'barcodesDescription.lidlOwnBrand': return 'Marka własna Lidla';
			case 'barcodesDescription.polaFriend': return 'Przyjaciel Poli';
			case 'barcodesDescription.extendedCompanyDescription': return 'Rozszerzony opis firmy';
			default: return null;
		}
	}
}
