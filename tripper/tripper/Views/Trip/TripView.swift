//
//  TripView.swift
//  tripper
//
//  Created by Erick Barcelos on 03/10/24.
//

import SwiftUI
import MapKit
import ScalingHeaderScrollView

struct MapPoint: Identifiable {
    let id = UUID()
    let title: String
    let coordinate: CLLocationCoordinate2D
}

struct TripView: View {
    @State private var cameraPosition = MapCameraPosition.region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    ))
    @Namespace() var namespace
    
    // Lista de pontos no mapa
    @State private var points: [MapPoint] = [
        MapPoint(title: "Point 1", coordinate: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)),
        MapPoint(title: "Point 2", coordinate: CLLocationCoordinate2D(latitude: 34.0522, longitude: -118.2437)),
        MapPoint(title: "Point 3", coordinate: CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060)),
        MapPoint(title: "Point 3", coordinate: CLLocationCoordinate2D(latitude: 42.7128, longitude: -74.0060)),
        MapPoint(title: "Point 3", coordinate: CLLocationCoordinate2D(latitude: 43.7128, longitude: -74.0060)),
        MapPoint(title: "Point 3", coordinate: CLLocationCoordinate2D(latitude: 44.7128, longitude: -74.0060))
    ]
    
    // Índice do ponto atualmente visível
    @State private var currentIndex = 0
    
    // Variável para controlar o deslocamento horizontal
    @State private var dragOffset: CGFloat = 0.0
    @State private var collapseProgress: CGFloat = 0.0
    
    var body: some View {
        ScalingHeaderScrollView {
            
                NavigationLink {
                    MapView()
                        .navigationTransition(
                            .zoom(
                                sourceID: "map",
                                in: namespace
                            )
                        )
                } label: {
                    VStack{
                        Spacer()
                            .frame(height: collapseProgress * 220)
                        ZStack {
                            Map(position: $cameraPosition) {
                                ForEach(points) { point in
                                    Marker(coordinate: point.coordinate) {
                                        Image(systemName: "mappin")
                                    }
                                    .tag(point.id)
                                }
                            }
                            .frame(height: 200 + (1 - collapseProgress) * 200)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding()
                            .disabled(true)
                            
                            Color.clear
                                .contentShape(Rectangle())
                                .gesture(
                                    DragGesture()
                                        .onChanged { value in
                                            withAnimation {
                                                dragOffset = value.translation.width
                                            }
                                        }
                                        .onEnded { value in
                                            if dragOffset < -100 {
                                                if currentIndex < points.count - 1 {
                                                    currentIndex += 1
                                                    updateRegion(coordinate: points[currentIndex].coordinate)
                                                }
                                            } else if dragOffset > 100 {
                                                if currentIndex > 0 {
                                                    currentIndex -= 1
                                                    updateRegion(coordinate: points[currentIndex].coordinate)
                                                }
                                            }
                                            dragOffset = 0
                                        }
                                )
                        }
                        .frame(height: 200 + (1 - collapseProgress) * 200)
                        .padding(.vertical)
                        .matchedTransitionSource(id: "map", in: namespace)
                    }
                    .background(.white)
                }
        } content: {
            VStack{
                ForEach(points) { point in
                    Button(action: {
                        updateRegion(coordinate: point.coordinate)
                    }){
                        HStack{
                            VStack(alignment: .leading, spacing: 5) {
                                Text(point.title)
                                    .font(.headline)
                                    .foregroundColor(.primary)
                            }
                            Spacer()
                            VStack(spacing: 5) {
                                
                            }
                        }
                        .frame(height: 100)
                        .modifier(ButtonBlank())
                    }
                }
            }
            .padding()
            Spacer()
                .frame(minHeight: 100)
                .fixedSize()
        }
        .collapseProgress($collapseProgress)
        .height(min: 160, max: 400)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    // Atualizar a região do mapa quando o ponto muda
    private func updateRegion(coordinate: CLLocationCoordinate2D) {
        withAnimation{
            cameraPosition = MapCameraPosition.region(MKCoordinateRegion(
                center: coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            ))
        }
    }
}

#Preview {
    MainView()
        .environmentObject(LocationService(completer: .init()))
    
}
