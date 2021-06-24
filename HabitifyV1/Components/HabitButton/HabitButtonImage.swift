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
    
    init(with imageName: String, colorName: String = "lightBlue") {
        self.imageName = imageName
        self.colorName = colorName
    }
    
    var body: some View {
        Image(systemName: imageName ?? "")
            .renderingMode(.original)
            .aspectRatio(contentMode: .fit)
            .frame(width: 30, height: 30)
            .background(Color(colorName ?? ""))
            .clipShape(Circle())
    }
}

struct HabitButtonImage_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack(spacing: 10) {
            HabitButtonImage(with: "plus", colorName: "lightGreen")
            HabitButtonImage(with: "minus", colorName: "lightRed")
        }
    }
}
