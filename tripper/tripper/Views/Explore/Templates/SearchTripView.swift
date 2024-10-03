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
    @State private var distanceValue: Double = 10.0
    @State private var costValue: Double = 10.0
    @State private var durationValue: Double = 0.0

    var body: some View {
      
        
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
                    VStack{
                        HStack{
                            Text("10 km")
                                .font(.caption)
                                .fontWeight(.bold)
                            
                            Slider(value: $distanceValue, in: 10...100000, step: 1)
                                .frame(maxWidth: .infinity)
                            
                            Text("100.000 km")
                                .font(.caption)
                                .fontWeight(.bold)
                        }
                        .padding(.vertical)
                        Text("\(Int(distanceValue)) km")                            .font(.footnote)
                            .fontWeight(.bold)
                            .padding(.bottom)
                    }
                }, title: "Distance")
                
                ToggleContainerView(content:{
                    VStack{
                        HStack{
                            Text("$10,00")
                                .font(.caption)
                                .fontWeight(.bold)
                            
                            Slider(value: $costValue, in: 10.00...100000.00, step: 5.5)
                                .frame(maxWidth: .infinity)
                            
                            Text("$100.000,00")
                                .font(.caption)
                                .fontWeight(.bold)
                        }
                        .padding(.vertical)
                        
                        Text(String(format: "$%.2f", costValue))                      .font(.footnote)
                            .fontWeight(.bold)
                            .padding(.bottom)
                    }
                }, title: "Cost Estimation")
                
                ToggleContainerView(content:{
                    VStack{
                        HStack{
                            Text("1 day")
                                .font(.caption)
                                .fontWeight(.bold)
                            
                            Slider(value: $durationValue, in: 0...10, step: 1)
                                .frame(maxWidth: .infinity)
                            
                            Text("10 Days")
                                .font(.caption)
                                .fontWeight(.bold)
                        }
                        .padding(.vertical)
                        
                        Text("\(Int(durationValue)) days")                            .font(.footnote)
                            .fontWeight(.bold)
                            .padding(.bottom)
                    }
                }, title: "Duration")
                
                ToggleContainerView(content:{
                    VStack{}
                }, title: "Route type")
                
                ToggleContainerView(content:{
                    VStack{}
                }, title: "Points of interest")
                
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
        VStack{
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            content
        }
        .padding()
        .frame(maxWidth: .infinity)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.primary.opacity(0.1), lineWidth: 1)
        )
        .padding(.horizontal)
        
    }
}

#Preview {
    SearchTripView()
}
