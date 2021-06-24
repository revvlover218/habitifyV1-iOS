//
//  HABPrimaryButtonLabel.swift
//  HabitifyV1
//
//  Created by Reshal Luchman on 2021/06/17.
//

import SwiftUI

struct HABPrimaryButtonLabel: View {
    
    private var buttonName = ""
    
    init(with name: String = "Button") {
        self.buttonName = name
    }
    
    #warning("SwiftUI 3.0: Creating a 'Primary button' is easily done using a modifier.")
    
    var body: some View {
        Text(buttonName)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, minHeight: 50, alignment: .center)
            .background(Color("lightBlue").colorScheme(.dark))
            .foregroundColor(.white)
            .cornerRadius(10)
            .shadow(radius: 10)
            .padding([.leading, .trailing, .bottom])
    }
}

struct HABPrimaryButtonLabel_Previews: PreviewProvider {
    
    static var previews: some View {
        HABPrimaryButtonLabel(with: "Add new habit")
    }
}
