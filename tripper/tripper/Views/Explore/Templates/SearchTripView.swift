//
//  SearchTripView.swift
//  tripper
//
//  Created by Erick Barcelos on 02/10/24.
//

import SwiftUI
import FluidGradient

struct SearchTripView : View{
    @Environment(\.presentationMode) var presentationMode // Controla o estado de apresentação
    @EnvironmentObject var locationService: LocationService
    @State private var distanceValue: Double = 10.0
    @State private var costValue: Double = 10.0
    @State private var durationValue: Double = 0.0
    @State var searchText: String = ""
    @State private var fromText: String = "Loading..."
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Button(action: {
                        presentationMode.wrappedValue.dismiss() // Volta para a tela anterior
                    }) {
                        HStack {
                            Image(systemName: "xmark") // Ícone personalizado
                        }
                        .modifier(BoxBlankStyle(cornerRadius: .infinity))
                    }
                    Spacer()
                    Button(action: {
                    }) {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                                .foregroundStyle(.white)
                            Text("Create trip")
                                .font(.subheadline)
                                .fontWeight(.black)
                                .foregroundStyle(.white)
                        }
                        .modifier(BoxBlankStyle())
                        .background(
                            FluidGradient(
                                blobs: [.pink, .cyan, .purple],
                                speed: 1.0,
                                blur: 0.8)
                            .background(.blue)
                            .cornerRadius(10)
                        )
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                
                ScrollView{
                    ToggleContainerView(content:{
                        HStack {
                            Group{
                                Image(systemName: "mappin.and.ellipse")
                                TextField("from", text: $fromText)
                                Spacer()
                            }
                        }
                        .modifier(TextFieldGrayBackgroundColor())
                        .padding(.top)
                        .onAppear {
                            if let city = locationService.currentCity {
                                fromText = city
                            }
                        }
                        
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
                            Text("\(Int(distanceValue)) km")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .padding(.bottom)
                        }
                    }, title: "Distance")
                    
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
                            
                            Text("\(Int(durationValue)) days")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .padding(.bottom)
                        }
                    }, title: "Duration")
                    
                    Spacer()
                        .fixedSize()
                        .frame(height: 100)
                }
            }
            VStack{
                Spacer()
                Button(action: {
                }) {
                    HStack {
                        Text("Find")
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }
                    .frame(maxWidth: .infinity)
                    .modifier(BoxFillStyle(buttonColor: Color.blue))
                }
            }
            .padding()
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
        .environmentObject(LocationService(completer: .init()))
        .environmentObject(ColorSchemeManager())
    
}
