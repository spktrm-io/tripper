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
    @Namespace private var namespace
    @State private var currentIndex = 3
    private let heightMap: CGFloat = UIScreen.main.bounds.height * 0.25
    @State private var multiSelection = Set<UUID>()
    @Environment(\.editMode) private var editMode
    @State private var points: [MapPoint] = [
        MapPoint(title: "Point 1", coordinate: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)),
        MapPoint(title: "Point 2", coordinate: CLLocationCoordinate2D(latitude: 34.0522, longitude: -118.2437)),
        MapPoint(title: "Point 3", coordinate: CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060)),
        MapPoint(title: "Point 4", coordinate: CLLocationCoordinate2D(latitude: 42.7128, longitude: -74.0060)),
        MapPoint(title: "Point 5", coordinate: CLLocationCoordinate2D(latitude: 43.7128, longitude: -74.0060)),
        MapPoint(title: "Point 6", coordinate: CLLocationCoordinate2D(latitude: 44.7128, longitude: -74.0060))
    ]
    @State private var showDeleteButton = false

    var body: some View {
        ZStack {
            VStack {
                MapAreaView(
                    cameraPosition: $cameraPosition,
                    namespace: namespace,
                    currentIndex: $currentIndex,
                    points: points,
                    heightMap: heightMap,
                    updateRegion: updateRegion
                )
                
                TripSummaryView()
                
                TripPointsListView(
                    points: $points,
                    currentIndex: $currentIndex,
                    namespace: namespace,
                    multiSelection: $multiSelection,
                    showDeleteButton: $showDeleteButton,
                    updateRegion: updateRegion,
                    removePoint: removePoint
                )
            }
            
            VStack {
                Spacer()
                
                ContinueTripButton(namespace: namespace)
                
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
    
    private func updateRegion(coordinate: CLLocationCoordinate2D) {
        withAnimation {
            cameraPosition = MapCameraPosition.region(MKCoordinateRegion(
                center: coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            ))
        }
    }
    
    private func removePoint(point: MapPoint) {
        if let index = points.firstIndex(where: { $0.id == point.id }) {
            points.remove(at: index)
        }
    }
}

struct MapAreaView: View {
    @Binding var cameraPosition: MapCameraPosition
    var namespace: Namespace.ID
    @Binding var currentIndex: Int
    var points: [MapPoint]
    let heightMap: CGFloat
    var updateRegion: (CLLocationCoordinate2D) -> Void
    @State private var dragOffset: CGFloat = 0.0
    
    var body: some View {
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
                            .onEnded { _ in
                                if dragOffset < -100 {
                                    if currentIndex < points.count - 1 {
                                        currentIndex += 1
                                        updateRegion(points[currentIndex].coordinate)
                                    }
                                } else if dragOffset > 100 {
                                    if currentIndex > 0 {
                                        currentIndex -= 1
                                        updateRegion(points[currentIndex].coordinate)
                                    }
                                }
                                dragOffset = 0
                            }
                    )
                
                VStack {
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
    }
}

struct TripSummaryView: View {
    var body: some View {
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
                Text("100.00 km")
                    .font(.footnote)
                    .bold()
            }
        }
        .padding(.horizontal)
        .padding(.top, 5)
    }
}

struct TripPointsListView: View {
    @Binding var points: [MapPoint]
    @Binding var currentIndex: Int
    var namespace: Namespace.ID
    @Binding var multiSelection: Set<UUID>
    @Binding var showDeleteButton: Bool
    var updateRegion: (CLLocationCoordinate2D) -> Void
    var removePoint: (MapPoint) -> Void
    @Environment(\.editMode) private var editMode
    
    var body: some View {
        NavigationView {
            List(selection: $multiSelection) {
                ForEach(Array(points.enumerated()), id: \.element.id) { index, point in
                    VStack {
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
                                if currentIndex == index {
                                    Image(systemName: "mappin")
                                        .frame(width: 5, height: 5)
                                        .padding()
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
                            .foregroundColor(index < 3 ? Color.blue : Color.primary.opacity(0.1)),
                        alignment: .leading
                    )
                    .swipeActions(edge: .leading) {
                        Button(action: {
                            currentIndex = index
                            updateRegion(point.coordinate)
                        }) {
                            Image(systemName: "mappin")
                                .frame(width: 5, height: 5)
                                .modifier(ButtonFill(cornerRadius: .infinity))
                        }
                    }
                    .swipeActions(edge: .trailing) {
                        Button(action: {
                            withAnimation {
                                removePoint(point)
                            }
                        }) {
                            Image(systemName: "trash.fill")
                                .frame(width: 5, height: 5)
                        }
                        .tint(.red)
                        
                        Button(action: {
                            // Edit action here
                        }) {
                            Image(systemName: "pencil")
                                .frame(width: 5, height: 5)
                        }
                        .tint(.blue)
                    }
                    .listRowSeparator(.hidden)
                }
                
                Button(action: {
                    // Add point action here
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .foregroundStyle(.primary)
                        Text("Add a point")
                            .font(.headline)
                            .fontWeight(.bold)
                    }
                    .frame(maxWidth: .infinity)
                    .modifier(ButtonFill(cornerRadius: .infinity))
                }
                .listRowSeparator(.hidden)
                
                Spacer()
                    .frame(minHeight: 200)
                    .fixedSize()
                    .padding([.horizontal, .bottom])
                    .listRowSeparator(.hidden)
            }
            .toolbar {
                if showDeleteButton {
                    Button(action: {
                        withAnimation {
                            points.removeAll { point in
                                multiSelection.contains(point.id)
                            }
                            multiSelection.removeAll()
                        }
                    }) {
                        Image(systemName: "trash")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 16)
                    }
                }
                EditButton()
            }
            .onChange(of: editMode?.wrappedValue) { _, value in
                showDeleteButton = value?.isEditing ?? false
            }
            .animation(.default, value: editMode?.wrappedValue)
            .listStyle(.plain)
        }
    }
}

struct ContinueTripButton: View {
    var namespace: Namespace.ID
    
    var body: some View {
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
                    blur: 0.8
                )
                .background(.blue)
                .cornerRadius(10)
            )
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
}

struct PointDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
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
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
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
