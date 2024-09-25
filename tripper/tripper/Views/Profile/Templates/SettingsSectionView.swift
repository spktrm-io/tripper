import SwiftUI

struct SettingsSectionView: View {
    var primaryColor: Color
    
    var body: some View {
        VStack {
            Text("Personal")
                .font(.system(size: 20, weight: .black))
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            
            // Navegação para "Account Information"
            SettingOptionButton(iconName: "person", title: "Account information", primaryColor: primaryColor) {
                AccountInfoView()
            }
            
            SettingOptionButton(iconName: "lock.fill", title: "Password", primaryColor: primaryColor) {
                PasswordInfoView()
            }
            
            // Navegação para "Address Information"
            SettingOptionButton(iconName: "house.fill", title: "Address information", primaryColor: primaryColor) {
                AddressInfoView()
            }
            
            Text("General")
                .font(.system(size: 20, weight: .black))
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            
            // Navegação para "Appearance"
            SettingOptionButton(iconName: "circle.grid.3x3.fill", title: "Apparence", primaryColor: primaryColor) {
                AppearanceView()
            }
            // Navegação para "Notifications"
            SettingOptionButton(iconName: "bell.fill", title: "Notifications", primaryColor: primaryColor) {
                NotificationsView()
            }
            
            Text("Support")
                .font(.system(size: 20, weight: .black))
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            
            // Navegação para "Report a Error"
            SettingOptionButton(iconName: "exclamationmark.triangle.fill", title: "Report a error", primaryColor: primaryColor) {
                ReportErrorView()
            }
            /*
            // Navegação para "FAQ"
            SettingOptionButton(iconName: "questionmark.circle", title: "FAQ", primaryColor: primaryColor) {
                FAQView()
            }
            */
            Divider()
                .padding(.vertical)
            
            // Logout button (sem navegação)
            Button(action: {
                print("Logout")
            }) {
                HStack {
                    Text("Logout")
                        .fontWeight(.bold)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
    }
}

struct SettingOptionButton<Destination: View>: View {
    var iconName: String
    var title: String
    var primaryColor: Color
    var destination: () -> Destination // Closure para a view de destino

    var body: some View {
        NavigationLink(destination: destination()) {
            HStack(alignment: .center) {
                Image(systemName: iconName)
                    .foregroundStyle(primaryColor)
                Text(title)
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundStyle(primaryColor)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.primary.opacity(0.1), lineWidth: 1)
            )
        }
    }
}

#Preview {
    NavigationView {
        SettingsSectionView(primaryColor: .blue)
    }
}
