//
//  ProfileView.swift
//  tripper
//
//  Created by Erick Barcelos on 15/09/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack{
            Text("Welcome!")
                .font(.system(size: 36, weight: .black))
                .foregroundColor(.primary)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
