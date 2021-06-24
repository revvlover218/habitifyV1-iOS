//
//  HABBackgroundGradientView.swift
//  HabitifyV1
//
//  Created by Reshal Luchman on 2021/06/17.
//

import SwiftUI

struct HABBackgroundGradientView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("lightBlue"),
//                                                       .white,
                                                       Color("lightPurple")]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 20)
        }
    }
}

struct HABBackgroundGradientView_Previews: PreviewProvider {
    
    static var previews: some View {
        HABBackgroundGradientView()
    }
}

//Loading indicator background
//ZStack {
//    LinearGradient(gradient: Gradient(colors: [Color("lightBlue"),
//                                               .white,
//                                               Color("lightPurple")]),
//                   startPoint: .topLeading,
//                   endPoint: .bottomTrailing)
//        .edgesIgnoringSafeArea(.all)
//    Image(systemName: "seal")
//        .renderingMode(.original)
//        .resizable()
//        .aspectRatio(contentMode: .fit)
//        .frame(width: 100, height: 100)
//}
//}
