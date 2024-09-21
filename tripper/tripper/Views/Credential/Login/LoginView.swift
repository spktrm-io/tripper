//
//  LoginView.swift
//  tripper
//
//  Created by Erick Barcelos on 21/09/24.
//

import SwiftUI

public struct LoginView: View {
    @State var searchText: String = ""

    public var body: some View {
        Text("Login")
            .font(.system(size: 30, weight: .black))
            .foregroundColor(.primary)
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
    
        TextField("username", text: $searchText)
        .modifier(TextFieldGrayBackgroundColor())
        .padding(.horizontal)
    
        TextField("password", text: $searchText)
        .modifier(TextFieldGrayBackgroundColor())
        .padding(.horizontal)
        
        Button(action: {
            print("Logout")
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
        .padding([.horizontal])
        
        Divider().padding()
        
        Button(action: {
            print("Sigin")
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
            print("Sigin")
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
            print("Sigin")
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

#Preview {
    LoginView()
}
