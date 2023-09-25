import SwiftUI

public struct ColorSystem {
  
  public var textPrimary = color(hex: 0x222222)
  public var textSecondary = color(hex: 0x949595)
  
  public var surfacePrimary: Color = color(hex: 0xFFFFFF)
  public var surfaceSecondary: Color = color(hex: 0xEEEEF0)
}

private func color(hex: UInt, alpha: Double = 1) -> Color {
  Color(
    red: Double((hex >> 16) & 0xff) / 255,
    green: Double((hex >> 08) & 0xff) / 255,
    blue: Double((hex >> 00) & 0xff) / 255,
    opacity: alpha
  )
}

extension ColorSystem: EnvironmentKey {
  public static var defaultValue: ColorSystem = .init()
}

extension EnvironmentValues {
  public var colorSystem: ColorSystem {
    get { self[ColorSystem.self] }
    set { self[ColorSystem.self] = newValue }
  }
}
