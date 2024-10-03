//
//  Untitled.swift
//  tripper
//
//  Created by Erick Barcelos on 21/09/24.
//

import SwiftUI
import ScalingHeaderScrollView

import SwiftUI
import ScalingHeaderScrollView

struct ExploreView: View {
    @State private var searchText: String = ""
    @State private var isSheetPresented: Bool = false
    let bottomSpacer: CGFloat?
    @Environment(\.colorScheme) var colorScheme
    @State private var collapseProgress: CGFloat = 0.0
    @Namespace() var namespace
    
    var body: some View {
        
        let logoName: String = colorScheme == .dark ? "tripper-logo-light" : "tripper-logo-dark"
        let buttonContentColor: Color = colorScheme == .dark ? Color.white : Color.black
        let secondarColor: Color = colorScheme == .dark ? Color.black : Color.white
        
        ScalingHeaderScrollView {
            VStack {
                HStack {
                    Image(logoName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 50)
                    Spacer()
                    LocationButtonView(isSheetPresented: $isSheetPresented, buttonContentColor: buttonContentColor)
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
                    .modifier(ButtonBlank(cornerRadius: .infinity))
                }
                .padding(.horizontal)
                .padding(.vertical, 4)
                
                ToggleButtonsView()
                    .padding(.bottom)
            }
            .background(secondarColor)
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
            VStack { }
                .padding()
                .presentationDetents([.large])
                .presentationBackground(.ultraThinMaterial)
                .presentationBackgroundInteraction(.enabled(upThrough: .large))
        }
    }
}

#Preview {
    ExploreView(bottomSpacer: 100)
        .environmentObject(LocationService(completer: .init()))
}
