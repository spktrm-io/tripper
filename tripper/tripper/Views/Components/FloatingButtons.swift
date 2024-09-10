import SwiftUI

struct FloatingButtons: View {
    var leftAction: () -> Void
    var rightAction: () -> Void
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack {
            HStack {
                // Botão do lado esquerdo
                Button(action: {
                    leftAction()
                }) {
                    Image(systemName: "car.rear.road.lane")
                        .frame(width: 40, height: 40)
                        .foregroundColor(.gray).padding(4)
                        .background(.thinMaterial)
                        .cornerRadius(5)
                        .shadow(color: .gray.opacity(0.5), radius: 5, x: 1, y: 3)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray.opacity(0.1), lineWidth: 1) // Adicionar stroke
                        )

                       
                }
                Spacer()
                // Botão do lado direito
                Button(action: {
                    rightAction()
                }) {
                    Image(systemName: "ellipsis")
                        .frame(width: 40, height: 40)
                        .foregroundColor(.gray).padding(4)
                        .background(.thinMaterial)
                        .cornerRadius(5)
                        .shadow(color: .gray.opacity(0.5), radius: 5, x: 1, y: 3)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray.opacity(0.1), lineWidth: 1) // Adicionar stroke
                        )

                }
            }
            .padding(.horizontal)
            .padding(.top, 20) // Coloca os botões mais abaixo da borda superior
            Spacer()
        }
    }
}
