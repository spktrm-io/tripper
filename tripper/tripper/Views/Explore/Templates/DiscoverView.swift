//
//  DiscoverView.swift
//  tripper
//
//  Created by Erick Barcelos on 21/09/24.
//

import SwiftUI

struct DiscoverView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            HorizontalCardListView(title: "Recommended")
            Divider().padding(.vertical)
            HorizontalCardListView(title: "Top rated")
            Divider().padding(.vertical)
            HorizontalCardListView(title: "Fastest")
        }
    }
}
