//
//  Backport+GlassEffectTransition.swift
//  SwiftUIBackports
//
//  Created by Ricky Witherspoon on 7/2/25.
//

import SwiftUI

public enum BackportGlassEffectTransition: Equatable, Sendable {
    case identity
    case matchedGeometry(properties: MatchedGeometryProperties = .frame, anchor: UnitPoint = .center)
}

@available(iOS 26, *)
public extension BackportGlassEffectTransition {
    var toTransition: GlassEffectTransition {
        switch self {
        case .identity:
            return .identity
        case .matchedGeometry(let properties, let anchor):
            return .matchedGeometry(properties: properties, anchor: anchor)
        }
    }
}

@MainActor
public extension Backport where Content: View {
    @ViewBuilder func glassEffectTransition(
        _ transition: BackportGlassEffectTransition,
        isEnabled: Bool = true
    ) -> some View {
        if #available(iOS 26.0, *) {
            content.glassEffectTransition(transition.toTransition, isEnabled: isEnabled)
        } else {
            content
        }
    }
}