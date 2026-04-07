import SwiftUI

/// User-selectable theme identifier persisted by `MushafView`.
public enum ReadingTheme: String, CaseIterable {
    case comfortable
    case calm
    case night
    case white

    public var title: String {
        switch self {
        case .comfortable:
            String(localized: "Comfy")
        case .calm:
            String(localized: "Calm")
        case .night:
            String(localized: "Night")
        case .white:
            String(localized: "White")
        }
    }
}

/// Concrete colors used to render the reading surface and text.
public struct ReadingThemeColors {
    public let background: Color
    public let text: Color

    public init(background: Color, text: Color) {
        self.background = background
        self.text = text
    }
}

/// Package-level configuration for reading colors, independent from system appearance.
public struct ReadingThemeConfiguration {
    public let comfortable: ReadingThemeColors
    public let calm: ReadingThemeColors
    public let night: ReadingThemeColors
    public let white: ReadingThemeColors

    public init(
        comfortable: ReadingThemeColors = .init(background: Color(hex: "#E4EFD9"), text: Color(hex: "#1F1F1F")),
        calm: ReadingThemeColors = .init(background: Color(hex: "#E0F1EA"), text: Color(hex: "#1F1F1F")),
        night: ReadingThemeColors = .init(background: Color(hex: "#2F352F"), text: Color(hex: "#F5F5F5")),
        white: ReadingThemeColors = .init(background: Color(hex: "#FFFFFF"), text: Color(hex: "#1F1F1F"))
    ) {
        self.comfortable = comfortable
        self.calm = calm
        self.night = night
        self.white = white
    }

    public static let `default` = ReadingThemeConfiguration()

    public func colors(for theme: ReadingTheme) -> ReadingThemeColors {
        switch theme {
        case .comfortable:
            comfortable
        case .calm:
            calm
        case .night:
            night
        case .white:
            white
        }
    }
}
