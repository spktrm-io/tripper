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
    @Environment(\.colorScheme) var colorScheme

    
    public var body: some View {
        let secondaryColor: Color = colorScheme == .dark ? Color.black : Color.white

        VStack(alignment: .leading) {
            Text("Email")
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(.primary)
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            // Email Field
            TextField("Enter your email", text: $email)
                .modifier(TextFieldGrayBackgroundColor(cornerRadius: 10))
                .padding(.horizontal)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            
            // Confirm Email Field
            TextField("Confirm your email", text: $confirmEmail)
                .modifier(TextFieldGrayBackgroundColor(cornerRadius: 10))
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
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.primary)
                    .foregroundColor(secondaryColor)
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
    EmailStepView(email: .constant(""), confirmEmail: .constant(""), nextAction: {}, previousAction: {})
}
