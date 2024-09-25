//
//  PasswordStepView.swift
//  tripper
//
//  Created by Erick Barcelos on 21/09/24.
//

import SwiftUI

public struct PasswordStepView: View {
    @Binding var password: String
    @Binding var confirmPassword: String
    var nextAction: () -> Void
    var previousAction: () -> Void
    
    public var body: some View {
        VStack(alignment: .leading) {
            Text("Password")
                .font(.system(size: 30, weight: .black))
                .foregroundColor(.primary)
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            // Password Field
            SecureField("Enter your password", text: $password)
                .modifier(TextFieldGrayBackgroundColor())
                .padding(.horizontal)
            
            // Confirm Password Field
            SecureField("Confirm your password", text: $confirmPassword)
                .modifier(TextFieldGrayBackgroundColor())
                .padding(.horizontal)
            
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
    PasswordStepView(password: .constant(""), confirmPassword: .constant(""), nextAction: {}, previousAction: {})
}
