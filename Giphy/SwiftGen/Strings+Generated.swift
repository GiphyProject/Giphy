// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Str {
  /// ?api_key=BYE4QVgVRnoWvrhBi9WuBya9RazSH4yT
  internal static let apiKey = Str.tr("Localizable", "apiKey", fallback: "?api_key=BYE4QVgVRnoWvrhBi9WuBya9RazSH4yT")
  /// https://api.giphy.com/v1/gifs/trending
  internal static let baseAPIRUL = Str.tr("Localizable", "baseAPIRUL", fallback: "https://api.giphy.com/v1/gifs/trending")
  /// heart.fill
  internal static let likeButton = Str.tr("Localizable", "likeButton", fallback: "heart.fill")
  /// &limit=
  internal static let limit = Str.tr("Localizable", "limit", fallback: "&limit=")
  /// 10
  internal static let requestNumber = Str.tr("Localizable", "requestNumber", fallback: "10")
  /// paperplane.fill
  internal static let shareButton = Str.tr("Localizable", "shareButton", fallback: "paperplane.fill")
  /// Localizable.strings
  ///   Giphy
  /// 
  ///   Created by Адель Ахметшин on 24.04.2023.
  internal static let titleMainViewController = Str.tr("Localizable", "titleMainViewController", fallback: "Popular GIFs")
  /// Profile
  internal static let titleProfileViewController = Str.tr("Localizable", "titleProfileViewController", fallback: "Profile")
  /// Search for GIFs
  internal static let titleSearchViewController = Str.tr("Localizable", "titleSearchViewController", fallback: "Search for GIFs")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Str {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
