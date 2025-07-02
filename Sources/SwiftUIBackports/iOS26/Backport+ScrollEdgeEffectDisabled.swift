//
//  Backport+ScrollEdgeEffectDisabled.swift
//  SwiftUIBackports
//
//  Created by Ricky Witherspoon on 7/2/25.
//

import SwiftUI

@MainActor
public extension Backport where Content: View {
    @ViewBuilder func scrollEdgeEffectDisabled(
        _ disabled: Bool = true,
        for edges: Edge.Set = .all
    ) -> some View {
        if #available(iOS 26.0, *) {
            content.scrollEdgeEffectDisabled(disabled, for: edges)
        } else {
            content
        }
    }
}