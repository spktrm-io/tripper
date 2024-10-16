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
        VStack {
            HStack(){
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                    }
                    .frame(width: 40, height: 40)
                    .modifier(BoxBlankStyle(cornerRadius: .infinity, padding: 4))
                }
                Spacer()
            }
            Text("Report a error")
            .font(.title)
            .fontWeight(.black)
            .foregroundColor(.primary)
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
            .modifier(TextFieldGrayBackgroundColor(cornerRadius: 10))
            .padding(.top)
            
            Button(action: {
                print("Logout")
            }) {
                HStack {
                    Text("Send")
                        .fontWeight(.bold)
                        .font(.subheadline)
                }
                .frame(maxWidth: .infinity)
                .modifier(BoxFillStyle())
            }
            .padding(.top)
            
            Spacer()
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ReportErrorView()
}
