//
//  LoginView.swift
//  tripper
//
//  Created by Erick Barcelos on 21/09/24.
//

import SwiftUI

public struct LoginView: View {
    @State var username: String = ""
    @State var password: String = ""
    @Binding var selectedIndex: Int
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false // Estado de login

    public var body: some View {
        VStack(){
            Text("Login")
                .font(.system(size: 30, weight: .black))
                .foregroundColor(.primary)
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("username", text: $username)
                .modifier(TextFieldGrayBackgroundColor())
                .padding(.horizontal)
            
            SecureField("password", text: $password)
                .modifier(TextFieldGrayBackgroundColor())
                .padding(.horizontal)
            
            Button(action: {
                if username == "" && password == "" {
                    isLoggedIn = true // Definir como logado e ir para ProfileView
                }
            }) {
                HStack {
                    Text("Enter")
                        .fontWeight(.bold)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.primary)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding([.horizontal, .top])
            
            Divider().padding()
            
            Button(action: {
                if username == "" && password == "" {
                    isLoggedIn = true // Definir como logado e ir para ProfileView
                }
            }) {
                HStack {
                    Image("google-brands-solid")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(.white)
                        .frame(width: 20, height: 20)
                    Text("Enter with Google")
                        .fontWeight(.bold)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color(red: 219 / 255, green: 68 / 255, blue: 55 / 255))
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding([.horizontal])
            
            Button(action: {
                if username == "" && password == "" {
                    isLoggedIn = true // Definir como logado e ir para ProfileView
                }
            }) {
                HStack {
                    Image("facebook-brands-solid")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(.white)
                        .frame(width: 20, height: 20)
                    Text("Enter with Facebook")
                        .fontWeight(.bold)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color(red: 24 / 255, green: 119 / 255, blue: 242 / 255))
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding([.horizontal])
            
            Divider().padding()
            
            Button(action: {
                selectedIndex = 1
            }) {
                HStack {
                    Text("Sigin")
                        .fontWeight(.bold)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.primary)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding([.horizontal])
        }
    }
}

#Preview{
    LoginView(selectedIndex: .constant(1))
}
