//
//  StatisticsGridView.swift
//  tripper
//
//  Created by Erick Barcelos on 21/09/24.
//

import SwiftUI


struct StatisticsGridView: View {
    var primaryColor: Color
    
    let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            StatisticCardView(iconName: "car.fill", title: "100.000 KM", subtitle: "kilometers", primaryColor: primaryColor)
            StatisticCardView(iconName: "road.lanes", title: "100 routes", subtitle: "routes made", primaryColor: primaryColor)
            StatisticCardView(iconName: "medal.fill", title: "Gold", subtitle: "your ranking", primaryColor: primaryColor)
            StatisticCardView(iconName: "text.book.closed.fill", title: "10 saveds", subtitle: "routes saved", primaryColor: primaryColor)
        }
    }
}

struct StatisticCardView: View {
    var iconName: String
    var title: String
    var subtitle: String
    var primaryColor: Color
    
    var body: some View {
        Button(action: {}) {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: iconName)
                        .foregroundStyle(primaryColor)
                    Text(title)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Text(subtitle)
                    .foregroundColor(.primary)
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.primary.opacity(0.1), lineWidth: 1)
            )
        }
    }
}

struct StatisticCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(bottomSpacer: 100)
    }
}
