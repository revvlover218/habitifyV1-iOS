//
//  HABProfileHeaderContentView.swift
//  HabitifyV1
//
//  Created by Reshal Luchman on 2021/06/17.
//

import SwiftUI

struct HABProfileHeaderContentView: View {
    
    private var profileName: String?
    private var profileDescription: String?
    
    init(with name: String, description: String) {
        self.profileName = name
        self.profileDescription = description
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: 50, height: 50)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.primary)
            HStack(spacing: 0) {
                Text("Hi, ")
                    .font(.largeTitle)
                Text(profileName ?? "")
                    .font(.largeTitle)
                    .bold()
            }
            Text(profileDescription ?? "")
                .font(.subheadline)
                .fontWeight(.light)
        }.padding()
    }
}


struct HABProfileHeaderContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        HABProfileHeaderContentView(with: "Reshal", description: "You have 3 habits \nto practice")
    }
}
