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
    var previousAction: () -> Void
    
    public var body: some View {
        VStack(alignment: .leading) {
            Text("Full Name")
                .font(.system(size: 30, weight: .black))
                .foregroundColor(.primary)
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("Enter your full name", text: $fullName)
                .modifier(TextFieldGrayBackgroundColor())
                .padding(.horizontal)
                .autocapitalization(.words)
            
            TextField("Enter your username", text: $fullName)
                .modifier(TextFieldGrayBackgroundColor())
                .padding(.horizontal)
                .autocapitalization(.words)
            
            Divider().padding()
            
            HStack {
                Button(action: previousAction) {
                    HStack {
                        Image(systemName: "x.circle")
                            .foregroundStyle(.primary)
                        Text("Cancel")
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
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.primary)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.primary)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding([.trailing, .top])
            }
        }
        .padding(.top)
    }
}

#Preview {
    FullNameStepView(fullName: .constant(""), nextAction: {}, previousAction: {})
}
