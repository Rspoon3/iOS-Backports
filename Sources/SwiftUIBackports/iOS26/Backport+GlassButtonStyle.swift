//
//  Backport+GlassButtonStyle.swift
//  SwiftUIBackports
//
//  Created by Ricky Witherspoon on 7/2/25.
//

import SwiftUI

@MainActor
public extension Backport where Content: View {
    @ViewBuilder func glassButtonStyle() -> some View {
        if #available(iOS 26.0, *) {
            content.buttonStyle(.glass)
        } else {
            content
        }
    }
}