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
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(.primary)
                .padding(.top, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Zip code")
                    .font(.caption2)
                    .padding(.top)
                    .foregroundColor(.primary.opacity(0.4))
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField("Zip code", text: $searchText)
                    .modifier(TextFieldGrayBackgroundColor(cornerRadius: 10))

                Divider().padding(.vertical)
                
                Text("Country")
                    .font(.caption2)
                    .foregroundColor(.primary.opacity(0.4))
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField("Country", text: $searchText)
                    .modifier(TextFieldGrayBackgroundColor(cornerRadius: 10))

                Text("zip code")
                    .font(.caption2)
                    .padding(.top)
                    .foregroundColor(.primary.opacity(0.4))
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField("State", text: $searchText)
                    .modifier(TextFieldGrayBackgroundColor(cornerRadius: 10))

                Text("City")
                    .font(.caption2)
                    .padding(.top)
                    .foregroundColor(.primary.opacity(0.4))
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField("City", text: $searchText)
                    .modifier(TextFieldGrayBackgroundColor(cornerRadius: 10))

                Divider().padding(.vertical)
                
                Text("Street")
                    .font(.caption2)
                    .foregroundColor(.primary.opacity(0.4))
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField("Street", text: $searchText)
                    .modifier(TextFieldGrayBackgroundColor(cornerRadius: 10))

                Text("Number")
                    .font(.caption2)
                    .padding(.top)
                    .foregroundColor(.primary.opacity(0.4))
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField("Number", text: $searchText)
                    .modifier(TextFieldGrayBackgroundColor(cornerRadius: 10))

                Text("Complemetion")
                    .font(.caption2)
                    .padding(.top)
                    .foregroundColor(.primary.opacity(0.4))
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField("Complemetion", text: $searchText)
                    .modifier(TextFieldGrayBackgroundColor(cornerRadius: 10))

                Text("Additional")
                    .font(.caption2)
                    .padding(.top)
                    .foregroundColor(.primary.opacity(0.4))
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField("Additional", text: $searchText)
                    .modifier(TextFieldGrayBackgroundColor(cornerRadius: 10))

                Button(action: {
                    print("Logout")
                }) {
                    HStack {
                        Text("Save")
                            .fontWeight(.bold)
                            .font(.subheadline)
                    }
                    .frame(maxWidth: .infinity)
                    .modifier(ButtonFill())
                }
                .padding( .top)
                Spacer()
                    .frame(minHeight: 100)
                    .fixedSize()
                Spacer()
            }
            .padding(.horizontal)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Back")
                                .font(.footnote)
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
