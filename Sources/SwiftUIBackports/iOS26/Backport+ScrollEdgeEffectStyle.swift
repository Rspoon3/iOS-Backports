//
//  Backport+ScrollEdgeEffectStyle.swift
//  SwiftUIBackports
//
//  Created by Ricky Witherspoon on 7/2/25.
//

import SwiftUI

public enum BackportScrollEdgeEffectStyle: Hashable, Sendable {
    case automatic
    case hard
    case soft
}

@available(iOS 26.0, *)
public extension BackportScrollEdgeEffectStyle {
    var toStyle: ScrollEdgeEffectStyle {
        switch self {
        case .automatic: return .automatic
        case .hard: return .hard
        case .soft: return .soft
        }
    }
}

@MainActor
public extension Backport where Content: View {
    @ViewBuilder func scrollEdgeEffectStyle(
        _ style: BackportScrollEdgeEffectStyle?,
        for edges: Edge.Set
    ) -> some View {
        if #available(iOS 26.0, *) {
            content.scrollEdgeEffectStyle(style?.toStyle, for: edges)
        } else {
            content
        }
    }
}