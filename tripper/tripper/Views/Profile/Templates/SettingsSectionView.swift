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
            // Navegação para "FAQ"
            SettingOptionButton(iconName: "questionmark.circle", title: "FAQ", primaryColor: primaryColor) {
                FAQView()
            }
            
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

// Exemplos de Views para navegação (placeholders)
struct AccountInfoView: View {
    @Environment(\.presentationMode) var presentationMode // Controla o estado de apresentação
    @State var searchText: String = ""

    var body: some View {
        VStack{
            Text("Account information")
            .font(.system(size: 30, weight: .black))
            .foregroundColor(.primary)
            .padding(.horizontal)
            .padding(.top, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
    
            TextField("full name", text: $searchText)
            .modifier(TextFieldGrayBackgroundColor())
            .padding(.horizontal)
        
            TextField("username", text: $searchText)
            .modifier(TextFieldGrayBackgroundColor())
            .padding(.horizontal)
            
            Divider().padding()
            
            TextField("email", text: $searchText)
            .modifier(TextFieldGrayBackgroundColor())
            .padding(.horizontal)
            
            TextField("confirm email", text: $searchText)
            .modifier(TextFieldGrayBackgroundColor())
            .padding(.horizontal)
            
            Button(action: {
                print("Logout")
            }) {
                HStack {
                    Text("Save")
                        .fontWeight(.bold)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.primary)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding([.horizontal, .top])
            Spacer()
        }
        .navigationBarBackButtonHidden(true) // Oculta o botão de voltar padrão
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss() // Volta para a tela anterior
                }) {
                    HStack {
                        Image(systemName: "chevron.left") // Ícone personalizado
                        Text("Back")
                            .fontWeight(.bold)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.primary)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
        }
    }
}

// Exemplos de Views para navegação (placeholders)
struct PasswordInfoView: View {
    @Environment(\.presentationMode) var presentationMode // Controla o estado de apresentação
    @State var searchText: String = ""

    var body: some View {
        VStack{
            Text("Password")
            .font(.system(size: 30, weight: .black))
            .foregroundColor(.primary)
            .padding(.horizontal)
            .padding(.top, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("password", text: $searchText)
            .modifier(TextFieldGrayBackgroundColor())
            .padding(.horizontal)
            
            TextField("confirm password", text: $searchText)
            .modifier(TextFieldGrayBackgroundColor())
            .padding(.horizontal)
            
            Button(action: {
                print("Logout")
            }) {
                HStack {
                    Text("Save")
                        .fontWeight(.bold)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.primary)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding([.horizontal, .top])
            Spacer()

        }
        .navigationBarBackButtonHidden(true) // Oculta o botão de voltar padrão
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss() // Volta para a tela anterior
                }) {
                    HStack {
                        Image(systemName: "chevron.left") // Ícone personalizado
                        Text("Back")
                            .fontWeight(.bold)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.primary)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
        }
    }
}

struct AddressInfoView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var searchText: String = ""
    
    var body: some View {
        ScrollView (showsIndicators: false){
            VStack {
                Text("Address information")
                .font(.system(size: 30, weight: .black))
                .foregroundColor(.primary)
                .padding(.horizontal)
                .padding(.top, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                TextField("Zip code", text: $searchText)
                .modifier(TextFieldGrayBackgroundColor())
                .padding(.horizontal)
                
                Divider().padding()
                
                TextField("Country", text: $searchText)
                .modifier(TextFieldGrayBackgroundColor())
                .padding(.horizontal)
                
                TextField("State", text: $searchText)
                .modifier(TextFieldGrayBackgroundColor())
                .padding(.horizontal)
                
                TextField("City", text: $searchText)
                .modifier(TextFieldGrayBackgroundColor())
                .padding(.horizontal)
                
                Divider().padding()
                
                TextField("Street", text: $searchText)
                .modifier(TextFieldGrayBackgroundColor())
                .padding(.horizontal)
                
                TextField("Number", text: $searchText)
                .modifier(TextFieldGrayBackgroundColor())
                .padding(.horizontal)
                
                TextField("Complemetion", text: $searchText)
                .modifier(TextFieldGrayBackgroundColor())
                .padding(.horizontal)
                
                TextField("Additional", text: $searchText)
                .modifier(TextFieldGrayBackgroundColor())
                .padding(.horizontal)
                
                Button(action: {
                    print("Logout")
                }) {
                    HStack {
                        Text("Save")
                            .fontWeight(.bold)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.primary)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding([.horizontal, .top])
                Spacer()
                    .frame(minHeight: 100)
                    .fixedSize()
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Back")
                                .fontWeight(.bold)
                        }
                        .padding()
                        .background(Color.primary)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                }
            }
        }
    }
}

struct AppearanceView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Appearance Settings Screen")
                .font(.largeTitle)
                .padding()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Back")
                            .fontWeight(.bold)
                    }
                    .padding()
                    .background(Color.primary)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
        }
    }
}

struct NotificationsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Notifications Settings Screen")
                .font(.largeTitle)
                .padding()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Back")
                            .fontWeight(.bold)
                    }
                    .padding()
                    .background(Color.primary)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
        }
    }
}

struct ReportErrorView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Report Error Screen")
                .font(.largeTitle)
                .padding()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Back")
                            .fontWeight(.bold)
                    }
                    .padding()
                    .background(Color.primary)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
        }
    }
}

struct FAQView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("FAQ Screen")
                .font(.largeTitle)
                .padding()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Back")
                            .fontWeight(.bold)
                    }
                    .padding()
                    .background(Color.primary)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        SettingsSectionView(primaryColor: .blue)
    }
}
