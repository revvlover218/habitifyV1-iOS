//
//  HABBackgroundGradientView.swift
//  HabitifyV1
//
//  Created by Reshal Luchman on 2021/06/17.
//

import SwiftUI

struct HABBackgroundGradientView: View {
    
    var body: some View {
            LinearGradient(gradient: Gradient(colors: [Color("lightBlue"),
                                                       Color("lightPurple")]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 20)
    }
}

struct HABBackgroundGradientView_Previews: PreviewProvider {
    
    static var previews: some View {
        HABBackgroundGradientView()
    }
}
