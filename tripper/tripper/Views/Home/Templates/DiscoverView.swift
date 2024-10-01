//
//  DiscoverView.swift
//  tripper
//
//  Created by Erick Barcelos on 21/09/24.
//

import SwiftUI

struct DiscoverView: View {
    let bottomSpacer: CGFloat?

    var body: some View {
        GeometryReader { geometry in
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    let availableHeight = geometry.size.height - 100
                    
                    VStack(spacing: 0){
                        HorizontalCardListView(title: "Recommended")
                        Spacer()
                        Divider()
                    }.frame(height: availableHeight)
                    
                    VStack(spacing: 0) {
                        HorizontalCardListView(title: "Recommended")
                        Spacer()
                        Divider()
                    }.frame(height: availableHeight)
                    
                    VStack(spacing: 0) {
                        HorizontalCardListView(title: "Recommended")
                        Spacer()
                        Divider()
                    }.frame(height: availableHeight)
                }
                
                
                Spacer()
                    .frame(minHeight: bottomSpacer)
                    .fixedSize()
            }
        }
    }
}
