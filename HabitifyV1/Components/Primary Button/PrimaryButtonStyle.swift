//
//  PrimaryButtonStyle.swift
//  HabitifyV1
//
//  Created by Reshal Luchman on 2021/06/17.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.spring())
    }
}
