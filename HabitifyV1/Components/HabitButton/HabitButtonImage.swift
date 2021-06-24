//
//  HabitButtonImage.swift
//  HabitifyV1
//
//  Created by Reshal Luchman on 2021/06/18.
//

import SwiftUI

struct HabitButtonImage: View {
    private var imageName: String?
    private var colorName: String?
    
    var body: some View {
        Image(systemName: imageName ?? "")
            .renderingMode(.original)
            .aspectRatio(contentMode: .fit)
            .frame(width: 30, height: 30)
            .background(Color(colorName ?? ""))
            .clipShape(Circle())
    }
    
    init(with imageName: String, colorName: String) {
        self.imageName = imageName
        self.colorName = colorName
    }
}
