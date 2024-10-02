import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct HomeView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var locationService: LocationService
    @State private var searchResults = [SearchResult]()
    @State private var isSheetPresented: Bool = false
    let bottomSpacer: CGFloat?
    @State private var selectedIndex: Int = 0
    
    var body: some View {
        VStack {
            
            ExploreView(bottomSpacer: bottomSpacer)
            
        }
        .onAppear {
            if locationService.currentCity == nil {
                locationService.startLocationUpdates()
            }
        }
        .sheet(isPresented: $isSheetPresented) {
            SheetSearchCityView(searchResults: $searchResults)
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
        .gesture(
            DragGesture().onChanged { _ in
                UIApplication.shared.endEditing()
            }
        )
        
    }
}

#Preview{
    MainView()
        .environmentObject(LocationService(completer: .init()))
}
