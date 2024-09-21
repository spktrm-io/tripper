//
//  Number.swift
//  tripper
//
//  Created by Erick Barcelos on 21/09/24.
//

import SwiftUI

public struct EmailStepView: View {
    @Binding var email: String
    @Binding var confirmEmail: String
    var nextAction: () -> Void
    var previousAction: () -> Void
    
    public var body: some View {
        VStack(alignment: .leading) {
            Text("Email")
                .font(.system(size: 30, weight: .black))
                .foregroundColor(.primary)
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            // Email Field
            TextField("Enter your email", text: $email)
                .modifier(TextFieldGrayBackgroundColor())
                .padding(.horizontal)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            
            // Confirm Email Field
            TextField("Confirm your email", text: $confirmEmail)
                .modifier(TextFieldGrayBackgroundColor())
                .padding(.horizontal)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            
            Divider().padding()
            
            // Botões de navegação
            HStack {
                Button(action: previousAction) {
                    HStack {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.primary)
                        Text("Previous")
                            .fontWeight(.bold)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.primary)
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
    EmailStepView(email: .constant(""), confirmEmail: .constant(""), nextAction: {}, previousAction: {})
}
