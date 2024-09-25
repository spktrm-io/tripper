//
//  FinalStepView.swift
//  tripper
//
//  Created by Erick Barcelos on 21/09/24.
//

import SwiftUI

import SwiftUI

public struct FinalStepView: View {
    @Binding var selectedIndex: Int // Adicionando o Binding para o controle de navegação
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false // Estado de login
    @Environment(\.colorScheme) var colorScheme
    
    public var body: some View {
        let secondaryColor: Color = colorScheme == .dark ? Color.black : Color.white

        VStack(alignment: .leading) {
            Text("Final Step")
                .font(.system(size: 30, weight: .black))
                .foregroundColor(.primary)
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("You have successfully completed your registration!")
                .foregroundColor(.primary)
                .fontWeight(.bold)
                .padding(.horizontal)
                .padding(.vertical, 20)
            
            Button(action: {
                // Quando o cadastro é finalizado, definir como logado e navegar para o ProfileView
                isLoggedIn = true
                selectedIndex = 0 // Retorna ao fluxo principal (que vai direto para ProfileView se logado)
            }) {
                HStack {
                    Text("Go to Profile")
                        .fontWeight(.bold)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.primary)
                .foregroundColor(secondaryColor)
                .cornerRadius(10)
            }
            .padding([.horizontal, .top])
        }
        .padding(.top)
    }
}

#Preview {
    FinalStepView(selectedIndex: .constant(0))
}
