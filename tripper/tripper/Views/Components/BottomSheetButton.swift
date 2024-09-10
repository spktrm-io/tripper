import SwiftUI

struct BottomSheetButton: View {
    @Binding var showBottomSheet: Bool
    
    var body: some View {
        VStack {
            Spacer()
            Button(action: {
                showBottomSheet.toggle() // Mostrar ou esconder o Bottom Sheet
            }) {
                Text("Show Bottom Sheet")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
    }
}
