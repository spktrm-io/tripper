//
//  TripView.swift
//  tripper
//
//  Created by Erick Barcelos on 03/10/24.
//

import SwiftUI
import MapKit

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
    
    // Lista de pontos no mapa
    @State private var points: [MapPoint] = [
        MapPoint(title: "Point 1", coordinate: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)),
        MapPoint(title: "Point 2", coordinate: CLLocationCoordinate2D(latitude: 34.0522, longitude: -118.2437)),
        MapPoint(title: "Point 3", coordinate: CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060))
    ]
    
    // Índice do ponto atualmente visível
    @State private var currentIndex = 0
    
    // Variável para controlar o deslocamento horizontal
    @State private var dragOffset: CGFloat = 0.0
    
    var body: some View {
        ZStack {
            Map (position: $cameraPosition){
                ForEach(points) { point in
                    Marker(coordinate: point.coordinate) {
                        Image(systemName: "mappin")
                    }
                    .tag(point.id)
                }
            }
            .frame(height: 400)
            .background(Color.white) // Adiciona um fundo ao mapa
            .clipShape(RoundedRectangle(cornerRadius: 10)) // Arredonda os cantos
            .shadow(radius: 10)
            .padding()
            
            Color.clear
                .contentShape(Rectangle()) // Permite que toda a área seja tocada
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            // Atualiza o deslocamento durante o gesto de arrastar
                            dragOffset = value.translation.width
                        }
                        .onEnded { value in
                            // Lógica de troca de pontos
                            if dragOffset < -100 {
                                // Deslizando para a esquerda, próximo ponto
                                if currentIndex < points.count - 1 {
                                    currentIndex += 1
                                    updateRegion()
                                }
                            } else if dragOffset > 100 {
                                // Deslizando para a direita, ponto anterior
                                if currentIndex > 0 {
                                    currentIndex -= 1
                                    updateRegion()
                                }
                            }
                            // Reseta o deslocamento
                            dragOffset = 0
                        }
                )
        }
        .overlay(
            // Informação do ponto atual
            Text(points[currentIndex].title)
                .padding()
                .background(Color.white.opacity(0.7))
                .cornerRadius(8)
                .padding(),
            alignment: .bottom
        )
    }
    
    // Atualizar a região do mapa quando o ponto muda
    private func updateRegion() {
        cameraPosition = MapCameraPosition.region(MKCoordinateRegion(
            center: points[currentIndex].coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        ))
    }
}

#Preview {
    TripView()
}
