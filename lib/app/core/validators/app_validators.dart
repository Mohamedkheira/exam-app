import 'package:easy_localization/easy_localization.dart';
import 'package:exam_app/app/core/validators/app_regex.dart';
import 'package:exam_app/generated/locale_keys.g.dart';

class AppValidators {
  /// Validate email field
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return LocaleKeys.emailRequired.tr();
    } else if (!AppRegex.isEmailValid(value.trim())) {
      return LocaleKeys.emailInvalid;
    }
    return null;
  }

  /// Validate password field
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.passwordRequired;
    } else if (!AppRegex.hasMinLength(value)) {
      return LocaleKeys.passwordMinLength;
    } else if (!AppRegex.hasUpperCase(value)) {
      return LocaleKeys.passwordUpperCase;
    } else if (!AppRegex.hasLowerCase(value)) {
      return LocaleKeys.passwordLowerCase;
    } else if (!AppRegex.hasNumber(value)) {
      return LocaleKeys.passwordNumber;
    } else if (!AppRegex.hasSpecialCharacter(value)) {
      return LocaleKeys.passwordSpecialChar;
    }
    return null;
  }

  /// Validate confirm password field
  static String? validateConfirmPassword(
    String? value,
    String? originalPassword,
  ) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.confirmPasswordRequired;
    } else if (value != originalPassword) {
      return LocaleKeys.passwordNotMatch;
    }
    return null;
  }
}
