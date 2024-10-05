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
    @State private var currentIndex = 3
    @State private var colorStateBar =  Color.gray
    @State private var dragOffset: CGFloat = 0.0
    private let heightMap: CGFloat = UIScreen.main.bounds.height * 0.25
    
    // Lista de pontos no mapa
    @State private var points: [MapPoint] = [
        MapPoint(title: "Point 1", coordinate: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)),
        MapPoint(title: "Point 2", coordinate: CLLocationCoordinate2D(latitude: 34.0522, longitude: -118.2437)),
        MapPoint(title: "Point 3", coordinate: CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060)),
        MapPoint(title: "Point 4", coordinate: CLLocationCoordinate2D(latitude: 42.7128, longitude: -74.0060)),
        MapPoint(title: "Point 5", coordinate: CLLocationCoordinate2D(latitude: 43.7128, longitude: -74.0060)),
        MapPoint(title: "Point 6", coordinate: CLLocationCoordinate2D(latitude: 44.7128, longitude: -74.0060))
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
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Summary")
                        .font(.headline)
                        .bold()
                    
                    HStack {
                        Text("Visited points:")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Spacer()
                        Text("5 / 8")
                            .font(.footnote)
                            .bold()
                    }
                    
                    HStack {
                        Text("Total distance:")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Spacer()
                        Text("100,00 km")
                            .font(.footnote)
                            .bold()
                    }
                }
                .padding([.horizontal, .bottom])
                .padding(.top, 5)
                .overlay(
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor( Color.primary.opacity(0.1)),
                    alignment: .bottom
                )
                
                ScrollView(.vertical, showsIndicators: false){

                    ForEach(Array(points.enumerated()), id: \.element.id) { index, point in
                        VStack{
                            NavigationLink {
                                PointDetailView()
                                    .navigationTransition(
                                        .zoom(
                                            sourceID: index,
                                            in: namespace
                                        )
                                    )
                            } label: {
                                HStack {
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text(point.title) // Nome do ponto
                                            .font(.headline)
                                            .foregroundColor(.primary)
                                        
                                        Text("Horário Estimado: 14:30") // Horário estimado de chegada
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                        
                                        Text("Duração: 30 minutos") // Duração estimada da parada
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                    }
                                    
                                    Spacer()
                                    VStack(alignment: .leading) {
                                        Button(action: {
                                            currentIndex = index
                                            updateRegion(coordinate: point.coordinate)
                                        }){
                                            if  currentIndex == index{
                                                VStack{
                                                    Image(systemName: "mappin")
                                                        .frame(width: 5, height: 5)
                                                }
                                                .modifier(ButtonFill(cornerRadius: .infinity))
                                            } else {
                                                VStack{
                                                    Image(systemName: "mappin")
                                                        .frame(width: 5, height: 5)
                                                }
                                                .modifier(ButtonBlank(cornerRadius: .infinity))
                                            }
                                        }
                                        Spacer()
                                    }
                                }
                                .modifier(ButtonBlank())
                                .matchedTransitionSource(id: index, in: namespace)
                                
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
                    
                    NavigationLink {
                        CreatePointView()
                            .navigationTransition(
                                .zoom(
                                    sourceID: "create-point",
                                    in: namespace
                                )
                            )
                    } label: {
                        HStack {
                            Image(systemName: "mappin.circle.fill")
                                .foregroundStyle(.white)
                            Text("Add point")
                                .font(.subheadline)
                                .fontWeight(.bold)
                        }
                        .frame(maxWidth: .infinity)
                        .modifier(ButtonFill(cornerRadius: .infinity))
                    }
                    .matchedTransitionSource(id: "create-point", in: namespace)

                    
                    Spacer()
                        .frame(minHeight: 200)
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
                        Image(systemName: "location.north.fill")
                            .foregroundStyle(.white)
                        Text("Continue trip")
                            .font(.subheadline)
                            .fontWeight(.black)
                            .foregroundStyle(.white)
                    }
                    .modifier(ButtonBlank())
                    .background(
                        FluidGradient(
                            blobs: [.pink, .cyan, .purple],
                            speed: 1.0,
                            blur: 0.8)
                        .background(.blue)
                        .cornerRadius(10)
                    )
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                Spacer()
                    .frame(minHeight: 86)
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

struct PointDetailView: View {
    @Environment(\.presentationMode) var presentationMode // Controla o estado de apresentação
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            HStack(){
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "xmark")
                    }
                    .frame(width: 40, height: 40)
                    .modifier(ButtonBlank(cornerRadius: .infinity, padding: 4))
                }
                Spacer()
            }
            .frame(maxWidth: .infinity)
            
            Spacer()
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden(true)
    }
}

struct CreatePointView: View {
    @Environment(\.presentationMode) var presentationMode // Controla o estado de apresentação
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            HStack(){
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "xmark")
                    }
                    .frame(width: 40, height: 40)
                    .modifier(ButtonBlank(cornerRadius: .infinity, padding: 4))
                }
                Spacer()
            }
            .frame(maxWidth: .infinity)
            
            Spacer()
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MainView()
        .environmentObject(LocationService(completer: .init()))
    
}
