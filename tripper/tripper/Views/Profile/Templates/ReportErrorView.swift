//
//  ReportErrorView.swift
//  tripper
//
//  Created by Erick Barcelos on 22/09/24.
//

import SwiftUI

struct ReportErrorView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    @State private var largeText: String = ""
    
    var body: some View {
        let secondaryColor: Color = colorScheme == .dark ? Color.black : Color.white
        VStack {
            Text("Report a error")
            .font(.system(size: 30, weight: .black))
            .foregroundColor(.primary)
            .padding(.horizontal)
            .padding(.top, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            ZStack(alignment: .top){
                if largeText.isEmpty {
                    HStack {
                        Text("Write here")
                            .foregroundStyle(.secondary)
                        Spacer()
                    }
                    .padding(10)
                }
                TextEditor(text: $largeText)
                    .scrollContentBackground(.hidden)
            }
            .foregroundColor(.primary)
            .frame(height: 200)
            .modifier(TextFieldGrayBackgroundColor())
            .padding()
            
            Button(action: {
                print("Logout")
            }) {
                HStack {
                    Text("Send")
                        .fontWeight(.bold)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.primary)
                .foregroundColor(secondaryColor)
                .cornerRadius(10)
            }
            .padding([.horizontal, .top])
            
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
                    .foregroundColor(secondaryColor)
                    .cornerRadius(10)
                }
            }
        }
    }
}

#Preview {
    ReportErrorView()
}
