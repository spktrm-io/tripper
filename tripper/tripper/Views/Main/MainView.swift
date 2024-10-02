import SwiftUI

struct MainView: View {
    @State private var selectedIndex: Int = 0
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        let primaryColor: Color = colorScheme == .dark ? Color.white : Color.black
        let secondaryColor: Color = colorScheme == .dark ? Color.black : Color.white
        let bottomTabMenuHeight: CGFloat = 95
        NavigationView{
            ZStack {
                MainContentView(selectedIndex: $selectedIndex, bottomTabMenuHeight: bottomTabMenuHeight)
                VStack {
                    Spacer()
                    BottomTabBarView(
                        selectedIndex: $selectedIndex,
                        primaryColor: primaryColor,
                        secondaryColor: secondaryColor,
                        bottomTabMenuHeight: bottomTabMenuHeight
                    )
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(LocationService(completer: .init()))
    }
}
