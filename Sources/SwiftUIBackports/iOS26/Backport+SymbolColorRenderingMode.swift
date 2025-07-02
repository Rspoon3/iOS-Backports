//
//  Backport+SymbolColorRenderingMode.swift
//  SwiftUIBackports
//
//  Created by Ricky Witherspoon on 7/2/25.
//

import SwiftUI

public enum BackportSymbolColorRenderingMode: Equatable, Sendable {
    case flat
    case gradient
}

@available(iOS 26.0, *)
public extension BackportSymbolColorRenderingMode {
    var toMode: SymbolColorRenderingMode {
        switch self {
        case .flat: return .flat
        case .gradient: return .gradient
        }
    }
}

@MainActor
public extension Backport where Content: View {
    @ViewBuilder func symbolColorRenderingMode(_ mode: BackportSymbolColorRenderingMode?) -> some View {
        if #available(iOS 26.0, *) {
            content.symbolColorRenderingMode(mode?.toMode)
        } else {
            content
        }
    }
}