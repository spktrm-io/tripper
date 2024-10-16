import SwiftUI

struct FloatingButtons: View {
    var leftAction: () -> Void
    var rightAction: () -> Void

    var body: some View {
        VStack {
            HStack {
                // Botão do lado esquerdo
                Button(action: {
                    leftAction()
                }) {
                    Image(systemName: "chevron.backward")
                        .frame(width: 40, height: 40)
                        .foregroundColor(.primary)
                        .padding(4)
                        .background(.ultraThinMaterial)
                        .cornerRadius(.infinity)
                        .shadow(color: .primary.opacity(0.1), radius: 10)
                        .overlay(
                            RoundedRectangle(cornerRadius: .infinity)
                                .stroke(Color.primary.opacity(0.1), lineWidth: 1) // Adicionar stroke
                        )

                       
                }
                Spacer()
                // Botão do lado direito
                Button(action: {
                    rightAction()
                }) {
                    Image(systemName: "ellipsis")
                        .frame(width: 40, height: 40)
                        .foregroundColor(.primary)
                        .padding(4)
                        .background(.ultraThinMaterial)
                        .cornerRadius(.infinity)
                        .shadow(color: .primary.opacity(0.1), radius: 10)
                        .overlay(
                            RoundedRectangle(cornerRadius: .infinity)
                                .stroke(Color.primary.opacity(0.1), lineWidth: 1) // Adicionar stroke
                        )

                }
            }
            .padding(.horizontal)
            .padding(.top, 20) // Coloca os botões mais abaixo da borda superior
            Spacer()
        }
    }
}

