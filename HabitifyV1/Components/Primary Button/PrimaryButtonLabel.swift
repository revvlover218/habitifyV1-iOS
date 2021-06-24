//
//  PrimaryButtonLabel.swift
//  HabitifyV1
//
//  Created by Reshal Luchman on 2021/06/17.
//

import SwiftUI

struct PrimaryButtonLabel: View {
    
    private var buttonName = ""
    
    var body: some View {
        Text(buttonName)
            .fontWeight(.semibold)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 50, alignment: .center)
            .background(Color("lightBlue").colorScheme(.dark))
            .foregroundColor(.white)
            .cornerRadius(10)
            .shadow(radius: 10)
            .padding([.leading, .trailing, .bottom])
    }
    
    init(with name: String = "Button") {
        self.buttonName = name
    }
}

struct PrimaryButtonLabel_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButtonLabel(with: "Add new habit")
    }
}
