import SwiftUI

struct MainView: View {
    @State private var selectedIndex: Int = 0
    @EnvironmentObject private var colorSchemeManager: ColorSchemeManager

    var body: some View {
        let bottomTabMenuHeight: CGFloat = 95
        NavigationStack{
            ZStack {
                MainContentView(selectedIndex: $selectedIndex, bottomTabMenuHeight: bottomTabMenuHeight)
                VStack {
                    Spacer()
                    BottomTabBarView(
                        selectedIndex: $selectedIndex,
                        primaryColor: colorSchemeManager.primaryColor,
                        secondaryColor: colorSchemeManager.secondaryColor,
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
            .environmentObject(ColorSchemeManager())

    }
}
