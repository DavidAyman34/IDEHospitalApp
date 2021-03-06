// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSColor
  internal typealias Color = NSColor
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIColor
  internal typealias Color = UIColor
#endif

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Colors

// swiftlint:disable identifier_name line_length type_body_length
internal struct ColorName {
  internal let rgbaValue: UInt32
  internal var color: Color { return Color(named: self) }

  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#aa0033"></span>
  /// Alpha: 100% <br/> (0xaa0033ff)
  internal static let cannary = ColorName(rgbaValue: 0xaa0033ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#001867"></span>
  /// Alpha: 100% <br/> (0x001867ff)
  internal static let commonButton = ColorName(rgbaValue: 0x001867ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#001867"></span>
  /// Alpha: 100% <br/> (0x001867ff)
  internal static let darkRoyalBlue = ColorName(rgbaValue: 0x001867ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#908c8c"></span>
  /// Alpha: 100% <br/> (0x908c8cff)
  internal static let disBook = ColorName(rgbaValue: 0x908c8cff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#b2b1b1"></span>
  /// Alpha: 100% <br/> (0xb2b1b1ff)
  internal static let disBookLabel = ColorName(rgbaValue: 0xb2b1b1ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#b7b7b7"></span>
  /// Alpha: 100% <br/> (0xb7b7b7ff)
  internal static let dotorGray = ColorName(rgbaValue: 0xb7b7b7ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#0f85b9"></span>
  /// Alpha: 100% <br/> (0x0f85b9ff)
  internal static let niceBlue = ColorName(rgbaValue: 0x0f85b9ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#6f0466"></span>
  /// Alpha: 100% <br/> (0x6f0466ff)
  internal static let purble = ColorName(rgbaValue: 0x6f0466ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#848585"></span>
  /// Alpha: 100% <br/> (0x848585ff)
  internal static let steelGrey = ColorName(rgbaValue: 0x848585ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#cccccc"></span>
  /// Alpha: 100% <br/> (0xccccccff)
  internal static let veryLightPink = ColorName(rgbaValue: 0xccccccff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ffffff"></span>
  /// Alpha: 100% <br/> (0xffffffff)
  internal static let white = ColorName(rgbaValue: 0xffffffff)
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

internal extension Color {
  convenience init(rgbaValue: UInt32) {
    let components = RGBAComponents(rgbaValue: rgbaValue).normalized
    self.init(red: components[0], green: components[1], blue: components[2], alpha: components[3])
  }
}

private struct RGBAComponents {
  let rgbaValue: UInt32

  private var shifts: [UInt32] {
    [
      rgbaValue >> 24, // red
      rgbaValue >> 16, // green
      rgbaValue >> 8,  // blue
      rgbaValue        // alpha
    ]
  }

  private var components: [CGFloat] {
    shifts.map {
      CGFloat($0 & 0xff)
    }
  }

  var normalized: [CGFloat] {
    components.map { $0 / 255.0 }
  }
}

internal extension Color {
  convenience init(named color: ColorName) {
    self.init(rgbaValue: color.rgbaValue)
  }
}
