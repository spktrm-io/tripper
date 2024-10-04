//
//  TripView.swift
//  tripper
//
//  Created by Erick Barcelos on 03/10/24.
//

import SwiftUI
import MapKit
import ScalingHeaderScrollView
import ProgressIndicatorView
import FluidGradient

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
    @State private var currentIndex = 0
    @State private var colorStateBar =  Color.gray
    @State private var dragOffset: CGFloat = 0.0
    private let heightMap: CGFloat = UIScreen.main.bounds.height * 0.25
    
    // Lista de pontos no mapa
    @State private var points: [MapPoint] = [
        MapPoint(title: "Point 1", coordinate: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)),
        MapPoint(title: "Point 2", coordinate: CLLocationCoordinate2D(latitude: 34.0522, longitude: -118.2437)),
        MapPoint(title: "Point 3", coordinate: CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060)),
        MapPoint(title: "Point 3", coordinate: CLLocationCoordinate2D(latitude: 42.7128, longitude: -74.0060)),
        MapPoint(title: "Point 3", coordinate: CLLocationCoordinate2D(latitude: 43.7128, longitude: -74.0060)),
        MapPoint(title: "Point 3", coordinate: CLLocationCoordinate2D(latitude: 44.7128, longitude: -74.0060))
    ]
    
    var body: some View {
        ZStack{
            VStack{
                NavigationLink {
                    MapView()
                        .navigationTransition(
                            .zoom(
                                sourceID: "map",
                                in: namespace
                            )
                        )
                } label: {
                    ZStack {
                        Map(position: $cameraPosition) {
                            ForEach(points) { point in
                                Marker(coordinate: point.coordinate) {
                                    Image(systemName: "mappin")
                                }
                                .tag(point.id)
                            }
                        }
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
                        VStack{
                            Spacer()
                            HStack {
                                ForEach(0..<points.count, id: \.self) { index in
                                    Rectangle()
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 3)
                                        .foregroundColor(index <= currentIndex ? Color.primary.opacity(0.5) : Color.primary.opacity(0.2))
                                }
                            }
                            .frame(width: 120)
                        }
                        .padding(.bottom, 10)
                    }
                    .frame(height: heightMap)
                    .matchedTransitionSource(id: "map", in: namespace)
                }
                
                
                ScrollView(showsIndicators: false){
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Resume")
                            .font(.title2)
                            .bold()
                        
                        HStack {
                            Text("Visited points:")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Spacer()
                            Text("5 / 8")
                                .font(.subheadline)
                                .bold()
                        }
                        
                        HStack {
                            Text("Total distance:")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Spacer()
                            Text("100,00 km")
                                .font(.subheadline)
                                .bold()
                        }
                    }
                    .modifier(ButtonBlank())
                    .padding(.top)
                    ForEach(Array(points.enumerated()), id: \.element.id) { index, point in
                        VStack{
                            Button(action: {
                                currentIndex = index
                                updateRegion(coordinate: point.coordinate)
                            }){
                                HStack {
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text(point.title) // Nome do ponto
                                            .font(.headline)
                                            .foregroundColor(.primary)
                                        
                                        // Campos mockados
                                        Text("Descrição: Lugar interessante para visitar") // Descrição do ponto
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                        
                                        Text("Horário Estimado: 14:30") // Horário estimado de chegada
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                        
                                        Text("Duração: 30 minutos") // Duração estimada da parada
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                        
                                        Text("Notas: Trazer câmera e água.") // Notas adicionais
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                    }
                                    Spacer()
                                }
                                .frame(height: 150) // Aumentei a altura para acomodar mais informações
                                .modifier(ButtonBlank())
                            }
                        }
                        .padding(.leading)
                        .overlay(
                            Rectangle()
                                .frame(width: 3)
                                .foregroundColor(index < 3 ? Color.blue : Color.primary.opacity(0.1))
                            ,
                            alignment: .leading
                        )
                    }
                    
                    Spacer()
                        .frame(minHeight: 150)
                        .fixedSize()
                }
                .padding([.horizontal, .bottom])
            }
            VStack{
                Spacer()
                NavigationLink {
                    MapView()
                        .navigationTransition(
                            .zoom(
                                sourceID: "map",
                                in: namespace
                            )
                        )
                } label: {
                    HStack {
                        Text("Continue trip")
                            .font(.subheadline)
                            .fontWeight(.black)
                            .foregroundStyle(.white)
                    }
                    .frame(maxWidth: .infinity)
                    .modifier(ButtonBlank())
                    .background(
                        FluidGradient(
                            blobs: [.pink, .cyan, .purple],
                            speed: 1.0,
                            blur: 0.8)
                        .background(.blue)
                        .cornerRadius(10)
                    )
                }
                Spacer()
                    .frame(minHeight: 90)
                    .fixedSize()
            }
            
            .padding()
        }
        .ignoresSafeArea()
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
