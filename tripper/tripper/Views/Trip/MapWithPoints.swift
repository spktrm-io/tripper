//
//  MapWithPoints.swift
//  tripper
//
//  Created by Erick Barcelos on 06/10/24.
//

import SwiftUI
import MapKit
import FluidGradient

struct MapWithPointsView: View {
    @StateObject private var locationService = LocationService(completer: MKLocalSearchCompleter())
    @State private var searchResults = [SearchResult]()
    @State private var selectedLocation: SearchResult?
    @State private var isSheetPresented: Bool = false
    @State private var scene: MKLookAroundScene?
    @State private var route: MKRoute?
    @State private var fetchTask: Task<Void, Never>?
    @Binding var position: MapCameraPosition
    @Environment(\.presentationMode) var presentationMode // Controla o estado de apresentação
    @Binding var points: [MapPoint]
    @Namespace private var namespace
    @Binding var currentIndex: Int
    var updateRegion: (CLLocationCoordinate2D) -> Void

    
    var body: some View {
        ZStack {
            Map(position: $position, selection: $selectedLocation) {
                ForEach(searchResults) { result in
                    Marker(coordinate: result.location) {
                        Image(systemName: "mappin")
                    }
                    .tag(result)
                }
                
                // Marcador da localização atual do usuário
                if let userLocation = locationService.currentLocation {
                    Marker(coordinate: userLocation) {
                        Image(systemName: "location.fill")
                            .foregroundColor(.blue)
                    }
                }
                
                // Exibição da rota
                if let route {
                    MapPolyline(route.polyline)
                        .stroke(Color.blue, lineWidth: 5)
                }
            }
            .ignoresSafeArea()
            
            VStack {
                HStack {
                    // Botão do lado esquerdo
                    Button(action: {
                        presentationMode.wrappedValue.dismiss() // Volta para a tela anterior
                    }) {
                        Image(systemName: "chevron.backward")
                            .frame(width: 40, height: 40)
                            .foregroundColor(.primary)
                            .padding(4)
                            .background(.ultraThinMaterial)
                            .cornerRadius(.infinity)
                            .shadow(color: .primary.opacity(0.1), radius: 10)
                            .overlay(
                                RoundedRectangle(cornerRadius: .infinity)
                                    .stroke(Color.primary.opacity(0.1), lineWidth: 1) // Adicionar stroke
                            )
                    }
                    Spacer()
                    
                }
                .padding(.horizontal)
                Spacer()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) { // Adicionei um HStack para organizar os elementos na horizontal
                        ForEach(Array(points.enumerated()), id: \.element.id) { index, point in
                            NavigationLink {
                                PointDetailView()
                                    .navigationTransition(
                                        .zoom(
                                            sourceID: index,
                                            in: namespace
                                        )
                                    )
                            } label: {
                                HStack{
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text(point.title)
                                            .font(.headline)
                                            .foregroundColor(.primary)
                                        
                                        Text("Estimated Time: 14:30")
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                        
                                        Text("Duration: 30 minutes")
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                        
                                    }
                                    Spacer()
                                    VStack{
                                        Button(action: {
                                            currentIndex = index
                                            updateRegion(point.coordinate)
                                        }){
                                            if currentIndex == index {
                                                Image(systemName: "mappin")
                                                    .frame(width: 10, height: 10)
                                                    .modifier(BoxFillStyle(cornerRadius: .infinity))
                                            }else{
                                                Image(systemName: "mappin")
                                                    .frame(width: 10, height: 10)
                                                    .modifier(BoxBlankStyle(cornerRadius: .infinity))
                                            }
                                        }
                                            
                                    }
                                }
                                .padding()
                                .overlay(
                                    Rectangle()
                                        .frame(width: 3)
                                        .foregroundColor(index < 3 ? Color.blue : Color.primary.opacity(0.1)),
                                    alignment: .leading
                                )
                                .frame(width: UIScreen.main.bounds.width * 0.85)
                                .background(.ultraThinMaterial)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.primary.opacity(0.1), lineWidth: 1)
                                )
                                .cornerRadius(10)
                                .matchedTransitionSource(id: index, in: namespace)
                            }
                        }
                    }
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.viewAligned)
                .safeAreaPadding(.horizontal, 16)
                
                NavigationLink {
                    MapView(position: $position)
                        .navigationTransition(
                            .zoom(
                                sourceID: "map",
                                in: namespace
                            )
                        )
                } label: {
                    HStack {
                        Image(systemName: "location.north.fill")
                            .foregroundStyle(.white)
                        Text("Continue trip")
                            .font(.subheadline)
                            .fontWeight(.black)
                            .foregroundStyle(.white)
                    }
                    .frame(maxWidth: .infinity)
                    .modifier(BoxBlankStyle())
                    .background(
                        FluidGradient(
                            blobs: [.pink, .cyan, .purple],
                            speed: 1.0,
                            blur: 0.8
                        )
                        .background(.blue)
                        .cornerRadius(10)
                    )
                    .padding(.horizontal)
                }
                
                Spacer()
                    .fixedSize()
                    .frame(height: 20)

            }
        }
        .navigationBarHidden(true) // Oculta a barra de navegação
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MapWithPointsView(
        position: .constant(MapCameraPosition.region(MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        ))),
        points: .constant([
            MapPoint(title: "Point 1", coordinate: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)),
            MapPoint(title: "Point 2", coordinate: CLLocationCoordinate2D(latitude: 37.7849, longitude: -122.4294))
        ]),
        currentIndex: .constant(0),
        updateRegion: { newCoordinate in
                   print("Updated region to: \(newCoordinate.latitude), \(newCoordinate.longitude)")
               }
    )
    .environmentObject(ColorSchemeManager())
}
