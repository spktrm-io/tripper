//
//  SplashView.swift
//  tripper
//
//  Created by Erick Barcelos on 20/09/24.
//

import SwiftUI

struct SplashView: View {
    
    @State var isActive: Bool = false
    
    var body: some View {
        ZStack {
            if self.isActive {
                MainView()
            } else {
                VStack(alignment: .leading) {
                    Text("developed by")
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .padding(.bottom, 10) // Ajuste o espaçamento entre o texto e a imagem
                    
                    Image("spktrm-transparent")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300) // Defina um tamanho fixo adequado para a imagem
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
        
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
            .environmentObject(LocationService(completer: .init()))

    }
}
