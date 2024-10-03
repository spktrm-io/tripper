//
//  Personal.swift
//  tripper
//
//  Created by Erick Barcelos on 21/09/24.
//

import SwiftUI

public struct FullNameStepView: View {
    @Binding var fullName: String
    var nextAction: () -> Void
    @Binding var selectedIndex: Int // Controle da navegação
    @Environment(\.colorScheme) var colorScheme

    
    public var body: some View {
        let secondaryColor: Color = colorScheme == .dark ? Color.black : Color.white

        VStack(alignment: .leading) {
            Text("Full Name")
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(.primary)
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("Enter your full name", text: $fullName)
                .modifier(TextFieldGrayBackgroundColor(cornerRadius: 10))
                .padding(.horizontal)
                .autocapitalization(.words)
            
            TextField("Enter your username", text: $fullName)
                .modifier(TextFieldGrayBackgroundColor(cornerRadius: 10))
                .padding(.horizontal)
                .autocapitalization(.words)
            
            Divider().padding()
            
            HStack {
                Button(action: {selectedIndex = 0} ) {
                    HStack {
                        Image(systemName: "x.circle")
                            .foregroundStyle(.primary)
                        Text("Cancel")
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding([.leading, .top])
                
                Button(action: nextAction) {
                    HStack {
                        Text("Next")
                            .fontWeight(.bold)
                            .font(.subheadline)
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.primary)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.primary)
                    .foregroundColor(secondaryColor)
                    .cornerRadius(10)
                }
                .padding([.trailing, .top])
            }
        }
        .padding(.top)
    }
}

#Preview {
    FullNameStepView(fullName: .constant(""), nextAction: {}, selectedIndex: .constant(0))
}
