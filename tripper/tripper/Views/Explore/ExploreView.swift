//
//  Untitled.swift
//  tripper
//
//  Created by Erick Barcelos on 21/09/24.
//
import SwiftUI
import ScalingHeaderScrollView

struct ExploreView: View {
    let bottomSpacer: CGFloat?
    @Namespace() var namespace
    @State private var searchText: String = ""
    @State private var isSheetPresented: Bool = false
    @State private var collapseProgress: CGFloat = 0.0
    @State private var distanceValue: Double = 10.0
    @State private var costValue: Double = 10.0
    @State private var durationValue: Double = 0.0
    @State private var routeType: String = "Scenic"
    @State private var ratingValue: Double = 1.0
    @State private var includeRestaurants: Bool = false
    @State private var includeTouristAttractions: Bool = false
    @State private var includeHotels: Bool = false
    @State private var includeGasStations: Bool = false
    @State private var isPetFriendly: Bool = false
    @State private var isKidFriendly: Bool = false
    @State private var isBudgetFriendly: Bool = false
    @State private var includeHighways: Bool = false
    @State private var includeScenicRoads: Bool = false
    @State private var includeAlternativePaths: Bool = false
    @EnvironmentObject var colorSchemeManager: ColorSchemeManager
    @Environment(\.colorScheme) var colorScheme // Access the current color scheme

    var body: some View {
        let logoName: String = colorScheme == .dark ? "tripper-logo-light" : "tripper-logo-dark"
        ScalingHeaderScrollView {
            VStack {
                HStack {
                    Image(logoName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 50)
                    Spacer()
                    LocationButtonView(isSheetPresented: $isSheetPresented, buttonContentColor: colorSchemeManager.primaryColor)
                }
                .padding(.horizontal)
                .opacity(1.0 - collapseProgress * 2.0)
                HStack {
                    NavigationLink {
                        SearchTripView()
                            .navigationTransition(
                                .zoom(
                                    sourceID: "search",
                                    in: namespace
                                )
                            )
                    } label: {
                        HStack {
                            Group{
                                Image(systemName: "magnifyingglass")
                                Text("Where you want to go?")
                                    .foregroundStyle(.primary.opacity(0.3))
                                Spacer()
                            }
                        }
                        .modifier(TextFieldGrayBackgroundColor())
                        .matchedTransitionSource(id: "search", in: namespace)
                    }
                    
                    Button(action: { isSheetPresented.toggle() }) {
                        Image(systemName: "line.3.horizontal.decrease")
                    }
                    .modifier(BoxBlankStyle(cornerRadius: .infinity))
                }
                .padding(.horizontal)
                .padding(.vertical, 4)
                
                ToggleButtonsView()
                    .padding(.bottom)
            }
            .background(colorSchemeManager.secondaryColor)
            .overlay(
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.primary.opacity(0.1)),
                alignment: .bottom
            )
        } content: {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(0..<5) { index in
                    CardView(title: "Card \(index + 1)", description: "Descrição do card \(index + 1)")
                }
            }
            .padding(.vertical)
            Spacer()
                .frame(minHeight: bottomSpacer)
                .fixedSize()
        }
        .collapseProgress($collapseProgress)
        .height(min: 125, max: 200)
        .sheet(isPresented: $isSheetPresented) {
            Rectangle()
                   .frame(width: 40, height: 5)
                   .cornerRadius(2.5)
                   .foregroundColor(.gray)
                   .padding(.top, 8)
            VStack{
                ScrollView{
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
                            
                            Text(String(format: "$%.2f", costValue))
                                .font(.footnote)
                                .fontWeight(.bold)
                                .padding(.bottom)
                        }
                    }, title: "Cost Estimation")
                    
                    // Tipo de Rota (Route Type)
                    ToggleContainerView(content: {
                        VStack {
                            HStack {
                                Text("Route Type")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                Spacer()
                            }
                            
                            Picker(selection: $routeType, label: Text("Select Route Type")) {
                                Text("Scenic").tag("Scenic")
                                Text("Fast").tag("Fast")
                                Text("Adventure").tag("Adventure")
                                Text("Relaxation").tag("Relaxation")
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .padding(.vertical)
                        }
                    }, title: "Route Type")

                    // Pontuação de Avaliações (Ratings)
                    ToggleContainerView(content: {
                        VStack {
                            HStack {
                                Text("1 Star")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                
                                Slider(value: $ratingValue, in: 1...5, step: 1)
                                    .frame(maxWidth: .infinity)
                                
                                Text("5 Stars")
                                    .font(.caption)
                                    .fontWeight(.bold)
                            }
                            .padding(.vertical)
                            
                            Text("\(Int(ratingValue)) Stars")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .padding(.bottom)
                        }
                    }, title: "Ratings")

                    // Paradas (Stops)
                    ToggleContainerView(content: {
                        VStack {
                            HStack {
                                Text("Select Stops")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                Spacer()
                            }
                            
                            Toggle("Restaurants", isOn: $includeRestaurants)
                            Toggle("Tourist Attractions", isOn: $includeTouristAttractions)
                            Toggle("Hotels", isOn: $includeHotels)
                            Toggle("Gas Stations", isOn: $includeGasStations)
                        }
                        .padding(.vertical)
                    }, title: "Stops")

                    // Preferências de Viagem (Travel Preferences)
                    ToggleContainerView(content: {
                        VStack {
                            HStack {
                                Text("Travel Preferences")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                Spacer()
                            }
                            
                            Toggle("Pet-Friendly", isOn: $isPetFriendly)
                            Toggle("Kid-Friendly", isOn: $isKidFriendly)
                            Toggle("Budget-Friendly", isOn: $isBudgetFriendly)
                        }
                        .padding(.vertical)
                    }, title: "Travel Preferences")

                    // Condições de Estrada (Road Conditions)
                    ToggleContainerView(content: {
                        VStack {
                            HStack {
                                Text("Road Conditions")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                Spacer()
                            }
                            
                            Toggle("Highways", isOn: $includeHighways)
                            Toggle("Scenic Roads", isOn: $includeScenicRoads)
                            Toggle("Alternative Paths", isOn: $includeAlternativePaths)
                        }
                        .padding(.vertical)
                    }, title: "Road Conditions")
                    
                    Spacer()
                        .fixedSize()
                        .frame(height: 100)
                }
            }
            .padding(.top)
            .presentationDetents([.large])
            .presentationBackgroundInteraction(.enabled(upThrough: .large))
        }
    }
}

#Preview {
    ExploreView(bottomSpacer: 100)
        .environmentObject(LocationService(completer: .init()))
        .environmentObject(ColorSchemeManager())
}
