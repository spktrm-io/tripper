//
//  AddressInfoView.swift
//  tripper
//
//  Created by Erick Barcelos on 22/09/24.
//

import SwiftUI

struct AddressInfoView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var searchText: String = ""

    init() {
       // Personaliza a aparência da UINavigationBar para torná-la transparente
       let appearance = UINavigationBarAppearance()
       appearance.configureWithTransparentBackground() // Deixa a barra transparente
       appearance.backgroundColor = .clear // Define o fundo como transparente
       
       UINavigationBar.appearance().standardAppearance = appearance
       UINavigationBar.appearance().scrollEdgeAppearance = appearance
   }
    
    var body: some View {
        
        ScrollView (showsIndicators: false){
            VStack {
                Text("Address information")
                .font(.system(size: 30, weight: .black))
                .foregroundColor(.primary)
                .padding(.horizontal)
                .padding(.top, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                TextField("Zip code", text: $searchText)
                .modifier(TextFieldGrayBackgroundColor())
                .padding(.horizontal)
                
                Divider().padding()
                
                TextField("Country", text: $searchText)
                .modifier(TextFieldGrayBackgroundColor())
                .padding(.horizontal)
                
                TextField("State", text: $searchText)
                .modifier(TextFieldGrayBackgroundColor())
                .padding(.horizontal)
                
                TextField("City", text: $searchText)
                .modifier(TextFieldGrayBackgroundColor())
                .padding(.horizontal)
                
                Divider().padding()
                
                TextField("Street", text: $searchText)
                .modifier(TextFieldGrayBackgroundColor())
                .padding(.horizontal)
                
                TextField("Number", text: $searchText)
                .modifier(TextFieldGrayBackgroundColor())
                .padding(.horizontal)
                
                TextField("Complemetion", text: $searchText)
                .modifier(TextFieldGrayBackgroundColor())
                .padding(.horizontal)
                
                TextField("Additional", text: $searchText)
                .modifier(TextFieldGrayBackgroundColor())
                .padding(.horizontal)
                
                Button(action: {
                    print("Logout")
                }) {
                    HStack {
                        Text("Save")
                            .fontWeight(.bold)
                    }
                    .modifier(ButtonFill())
                }
                .padding([.horizontal, .top])
                Spacer()
                    .frame(minHeight: 100)
                    .fixedSize()
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Back")
                                .fontWeight(.bold)
                        }
                        .modifier(ButtonFill())
                    }
                }
            }
        }
    }
}

#Preview {
    AddressInfoView()
}
