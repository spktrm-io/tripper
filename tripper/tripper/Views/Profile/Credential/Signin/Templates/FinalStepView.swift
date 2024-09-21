//
//  FinalStepView.swift
//  tripper
//
//  Created by Erick Barcelos on 21/09/24.
//

import SwiftUI

public struct FinalStepView: View {
    var previousAction: () -> Void
    
    public var body: some View {
        VStack(alignment: .leading) {
            Text("Final Step")
                .font(.system(size: 30, weight: .black))
                .foregroundColor(.primary)
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("You have successfully completed your registration!")
                .font(.title2)
                .foregroundColor(.primary)
                .padding(.horizontal)
                .padding(.vertical, 20)
            
            // Finish or Go Back Button
            Button(action: previousAction) {
                HStack {
                    Text("Go Back")
                        .fontWeight(.bold)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.primary)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding([.horizontal, .top])
        }
        .padding(.top)
    }
}

#Preview {
    FinalStepView(previousAction: {})
}
