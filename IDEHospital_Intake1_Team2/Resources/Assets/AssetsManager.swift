// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal static let accentColor = ColorAsset(name: "AccentColor")
  internal static let groupHeart = ImageAsset(name: "GroupHeart")
  internal static let care = ImageAsset(name: "care")
  internal static let docClock = ImageAsset(name: "docClock")
  internal static let docFee = ImageAsset(name: "docFee")
  internal static let doclife = ImageAsset(name: "doclife")
  internal static let docpin = ImageAsset(name: "docpin")
  internal static let leftArrow = ImageAsset(name: "leftArrow")
  internal static let pinn = ImageAsset(name: "pinn")
  internal static let rightArrow = ImageAsset(name: "rightArrow")
  internal static let arrow = ImageAsset(name: "arrow")
  internal static let back2 = ImageAsset(name: "back2")
  internal static let barsToolbarIPhoneCompactLight5Glyphs = ImageAsset(name: "barsToolbarIPhoneCompactLight5Glyphs")
  internal static let calendar3 = ImageAsset(name: "calendar3")
  internal static let component411 = ImageAsset(name: "component411")
  internal static let doctor = ImageAsset(name: "doctor")
  internal static let group1 = ImageAsset(name: "group1")
  internal static let group177 = ImageAsset(name: "group177")
  internal static let group234 = ImageAsset(name: "group234")
  internal static let heart = ImageAsset(name: "heart")
  internal static let life = ImageAsset(name: "life")
  internal static let path21 = ImageAsset(name: "path21")
  internal static let path22 = ImageAsset(name: "path22")
  internal static let path29 = ImageAsset(name: "path29")
  internal static let pin = ImageAsset(name: "pin")
  internal static let settings = ImageAsset(name: "settings")
  internal static let about = ImageAsset(name: "about")
  internal static let blueBack = ImageAsset(name: "blueBack")
  internal static let blueheart = ImageAsset(name: "blueheart")
  internal static let calendar = ImageAsset(name: "calendar")
  internal static let contact = ImageAsset(name: "contact")
  internal static let login = ImageAsset(name: "login")
  internal static let share = ImageAsset(name: "share")
  internal static let sheet = ImageAsset(name: "sheet")
  internal static let user = ImageAsset(name: "user")
  internal static let component22 = ImageAsset(name: "Component 2 – 2")
  internal static let logo1 = ImageAsset(name: "Logo1")
  internal static let errorBook = ImageAsset(name: "ErrorBook")
  internal static let cancelVoucher = ImageAsset(name: "cancelVoucher")
  internal static let successAlert = ImageAsset(name: "successAlert")
  internal static let back2222 = ImageAsset(name: "back2222")
  internal static let clock = ImageAsset(name: "clock")
  internal static let component111 = ImageAsset(name: "component111")
  internal static let component141 = ImageAsset(name: "component141")
  internal static let component171 = ImageAsset(name: "component171")
  internal static let component181 = ImageAsset(name: "component181")
  internal static let component191 = ImageAsset(name: "component191")
  internal static let component64 = ImageAsset(name: "component64")
  internal static let component67 = ImageAsset(name: "component67")
  internal static let component71 = ImageAsset(name: "component71")
  internal static let deleteIcon = ImageAsset(name: "deleteIcon")
  internal static let heart2 = ImageAsset(name: "heart2")
  internal static let money3 = ImageAsset(name: "money-3")
  internal static let outputOnlinepngtools = ImageAsset(name: "output-onlinepngtools")
  internal static let path1416 = ImageAsset(name: "path1416")
  internal static let rate = ImageAsset(name: "rate")
  internal static let rectangle1798 = ImageAsset(name: "rectangle1798")
  internal static let unfill = ImageAsset(name: "unfill")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
}

internal extension ImageAsset.Image {
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
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
