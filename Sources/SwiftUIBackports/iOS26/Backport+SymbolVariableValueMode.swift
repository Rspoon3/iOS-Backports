//
//  Backport+SymbolVariableValueMode.swift
//  SwiftUIBackports
//
//  Created by Ricky Witherspoon on 7/2/25.
//

import SwiftUI

public enum BackportSymbolVariableValueMode: Equatable, Sendable {
    case color
    case draw
}

@available(iOS 26.0, *)
public extension BackportSymbolVariableValueMode {
    var toMode: SymbolVariableValueMode {
        switch self {
        case .color: return .color
        case .draw: return .draw
        }
    }
}

@MainActor
public extension Backport where Content: View {
    @ViewBuilder func symbolVariableValueMode(_ mode: BackportSymbolVariableValueMode?) -> some View {
        if #available(iOS 26.0, *) {
            content.symbolVariableValueMode(mode?.toMode)
        } else {
            content
        }
    }
}
