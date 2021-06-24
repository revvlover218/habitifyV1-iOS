//
//  DestructiveButtonLabel.swift
//  HabitifyV1
//
//  Created by Reshal Luchman on 2021/06/21.
//

import SwiftUI

struct DestructiveButtonLabel: View {
    
    private var buttonName = ""
    
    var body: some View {
        Text(buttonName)
            .fontWeight(.semibold)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 50, alignment: .center)
            .background(Color("lightRed").colorScheme(.dark))
            .foregroundColor(.white)
            .cornerRadius(10)
            .shadow(radius: 10)
            .padding([.leading, .trailing, .bottom])
    }
    
    init(with name: String = "Button") {
        self.buttonName = name
    }
}

struct DestructiveButtonLabel_Previews: PreviewProvider {
    static var previews: some View {
        DestructiveButtonLabel()
    }
}
