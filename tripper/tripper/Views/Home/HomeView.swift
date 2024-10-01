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
        let logoName: String = colorScheme == .dark ? "tripper-logo-light" : "tripper-logo-dark"
        let buttonContentColor: Color = colorScheme == .dark ? Color.white : Color.black
       
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
            
            ToggleButtonsView()
            Divider()
                .padding(.top, 7)
                .padding(.bottom, -10)
            
            
            DiscoverView(bottomSpacer: bottomSpacer)
            
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
