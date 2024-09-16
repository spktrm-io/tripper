//
//  SheetSearchCityView.swift
//  tripper
//
//  Created by Erick Barcelos on 15/09/24.
//

import Foundation
import SwiftUI
import MapKit

struct SheetSearchCityView: View {
    @State private var locationService = LocationService(completer: .init())
    @State private var search: String = ""
    @Binding var searchResults: [SearchResult]

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search for a location", text: $search)
                    .autocorrectionDisabled()
                    .onSubmit {
                        print("SheetView: Search submitted with text '\(search)'")
                        Task {
                            searchResults = (try? await locationService.search(with: search)) ?? []
                            print("SheetView: Search results updated with \(searchResults.count) items")
                        }
                    }
            }
            .modifier(TextFieldGrayBackgroundColor())

            Spacer()

            List {
                ForEach(locationService.completions) { completion in
                    Button(action: { didTapOnCompletion(completion) }) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(completion.title)
                                .font(.headline)
                                .fontDesign(.rounded)
                            Text(completion.subTitle)
                            if let url = completion.url {
                                Link(url.absoluteString, destination: url)
                                    .lineLimit(1)
                            }
                        }
                    }
                    .listRowBackground(Color.clear)
                }
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
        }
        .onChange(of: search) { _, newValue in
            print("SheetView: Search text changed to '\(newValue)'")
            locationService.update(queryFragment: search)
        }
        .padding()
        .presentationDetents([.large])
        .presentationBackground(.ultraThinMaterial)
        .presentationBackgroundInteraction(.enabled(upThrough: .large))
    }

    private func didTapOnCompletion(_ completion: SearchCompletions) {
        print("SheetView.didTapOnCompletion: Tapped on completion with title '\(completion.title)' and subtitle '\(completion.subTitle)'")
        Task {
            if let singleLocation = try? await locationService.search(with: "\(completion.title) \(completion.subTitle)").first {
                searchResults = [singleLocation]
                print("SheetView.didTapOnCompletion: Search results updated with the selected location")
            } else {
                print("SheetView.didTapOnCompletion: Failed to find location for the selected completion")
            }
        }
    }
}
