import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct HomeView: View {
    @State private var searchText: String = ""
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var locationService: LocationService
    @State private var searchResults = [SearchResult]()
    @State private var isSheetPresented: Bool = false
    let bottomSpacer: CGFloat?
    @State private var selectedIndex: Int = 0
    
    var body: some View {
        let logoName: String = colorScheme == .dark ? "tripper-logo-light" : "tripper-logo-dark"
        let buttonContentColor: Color = colorScheme == .dark ? Color.white : Color.black
        let primaryColor: Color = colorScheme == .dark ? Color.white : Color.black
        let secondaryColor: Color = colorScheme == .dark ? Color.black : Color.white
        
        VStack {
            HStack {
                Image(logoName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 60)
                Spacer()
                LocationButtonView(isSheetPresented: $isSheetPresented, buttonContentColor: buttonContentColor)
            }
            .padding(.horizontal)
            
            TabButtonView(selectedIndex: $selectedIndex, primaryColor: primaryColor, secondaryColor: secondaryColor)
            
            Divider()
                .padding(.top, 7)
                .padding(.bottom, -10)
            
            if selectedIndex == 0 {
                DiscoverView()
            } else {
                SearchView(searchText: $searchText)
            }
            
            Spacer()
                .frame(minHeight: bottomSpacer)
                .fixedSize()
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(LocationService(completer: .init()))
    }
}
