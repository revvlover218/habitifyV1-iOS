//
//  HabitButtonStyle.swift
//  HabitifyV1
//
//  Created by Reshal Luchman on 2021/05/30.
//

import SwiftUI

struct HabitButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .shadow(radius: 10)
            .padding(.horizontal)
            .padding(.vertical, 5.0)
    }
}
