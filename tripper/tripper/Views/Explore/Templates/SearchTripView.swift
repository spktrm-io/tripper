//
//  SearchTripView.swift
//  tripper
//
//  Created by Erick Barcelos on 02/10/24.
//

import SwiftUI

struct SearchTripView : View{
    @Environment(\.presentationMode) var presentationMode // Controla o estado de apresentação
    @State var searchText: String = ""
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        let backgroundColor: Color = colorScheme == .dark ? Color.black : Color.white
        
        VStack{
            HStack{
                Button(action: {
                    presentationMode.wrappedValue.dismiss() // Volta para a tela anterior
                }) {
                    HStack {
                        Image(systemName: "xmark") // Ícone personalizado
                    }
                    .modifier(ButtonBlank(cornerRadius: .infinity))
                }
                Spacer()
                Button(action: {
                    presentationMode.wrappedValue.dismiss() // Volta para a tela anterior
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill") // Ícone personalizado
                        Text("Create trip")
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }
                    .modifier(ButtonFill())
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            
            ScrollView{
                ToggleContainerView(content:{
                    HStack {
                        Group{
                            Image(systemName: "mappin.and.ellipse")
                            TextField("from", text: $searchText)
                            Spacer()
                        }
                    }
                    .modifier(TextFieldGrayBackgroundColor())
                    .padding(.top)
                    
                    HStack {
                        Group{
                            Image(systemName: "location.fill")
                            TextField("to", text: $searchText)
                            Spacer()
                        }
                    }
                    .modifier(TextFieldGrayBackgroundColor())
                }, title: "Search")
                
                ToggleContainerView(content:{
                    VStack{}
                }, title: "Distance")
                
                ToggleContainerView(content:{
                    VStack{}
                }, title: "Cost Estimation")
                
                ToggleContainerView(content:{
                    VStack{}
                }, title: "Duration")
                
                ToggleContainerView(content:{
                    VStack{}
                }, title: "Route type")
                
                ToggleContainerView(content:{
                    VStack{}
                }, title: "Points of interest")
                
                ToggleContainerView(content:{
                    VStack{}
                }, title: "Stop type")
                
                ToggleContainerView(content:{
                    VStack{}
                }, title: "Trip purpose")
                
                ToggleContainerView(content:{
                    VStack{}
                }, title: "Preferences")
            }
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true) // Oculta o botão de voltar padrão
        
    }
}

struct ToggleContainerView<Content: View>: View {
    @Environment(\.presentationMode) var presentationMode // Controla o estado de apresentação
    @Environment(\.colorScheme) var colorScheme

    @State private var searchText: String = ""
    
    @ViewBuilder let content: Content
    var title: String = ""

    var body: some View {
        let backgroundColor: Color = colorScheme == .dark ? Color.black : Color.white
        VStack{
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            content
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(backgroundColor)
        .cornerRadius(10)
        .shadow(color: .primary.opacity(0.1), radius: 10, x: 5, y: 5)
        .padding(.horizontal)
    }
}

#Preview {
    SearchTripView()
}
