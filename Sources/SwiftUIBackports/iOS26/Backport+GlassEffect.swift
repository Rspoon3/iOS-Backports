//
//  Backport+GlassEffect.swift
//  SwiftUIBackports
//
//  Created by Ricky Witherspoon on 7/2/25.
//

import SwiftUI

public enum BackportGlass: Equatable, Sendable {
    case regular
    case tinted(Color?)
    case interactive(isEnabled: Bool)
    case tintedAndInteractive(color: Color?, isEnabled: Bool)
    
    public static var regularInteractive: BackportGlass {
        .tintedAndInteractive(color: nil, isEnabled: true)
    }
}

@available(iOS 26, *)
extension BackportGlass {
    public var toGlass: Glass {
        switch self {
        case .regular:
            return .regular
        case .tinted(let color):
            return .regular.tint(color)
        case .interactive(let isEnabled):
            return .regular.interactive(isEnabled)
        case .tintedAndInteractive(let color, let isEnabled):
            return .regular.tint(color).interactive(isEnabled)
        }
    }
}

@MainActor
public extension Backport where Content: View {
    @ViewBuilder func glassEffect(
        _ backportGlass: BackportGlass = .regular,
        in shape: some Shape = Capsule(),
        isEnabled: Bool = true
    ) -> some View {
        if #available(iOS 26.0, *) {
            content.glassEffect(backportGlass.toGlass, in: shape, isEnabled: isEnabled)
        } else {
            content
        }
    }
    
    @ViewBuilder func glassEffect(
        _ backportGlass: BackportGlass = .regular,
        in shape: some Shape = Capsule(),
        isEnabled: Bool = true,
        fallbackBackground: some ShapeStyle) -> some View {
        if #available(iOS 26.0, *) {
            content.glassEffect(backportGlass.toGlass, in: shape, isEnabled: isEnabled)
        } else {
            content.background(fallbackBackground)
        }
    }
}