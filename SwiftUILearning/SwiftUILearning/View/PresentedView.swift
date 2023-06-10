//
//  PresentedView.swift
//  SwiftUILearning
//
//  Created by unkn0wn on 2/27/23.
//

import SwiftUI

struct PresentedView: View {
    
    @Binding var isShown: Bool
    @Binding var titleName: String
    @EnvironmentObject var user: UserInfo
    
    var body: some View {
        Button("Dismiss") {
            user.userName = "Objective C"
            UserDefaults.standard.set(25, forKey: "userID")
            isShown.toggle()
        }
        
        TextField("Name", text: $titleName).textFieldStyle(.roundedBorder).padding(30)
        
        Text(user.userName)
    }
}

struct PresentedView_Previews: PreviewProvider {
    static var previews: some View {
        PresentedView(isShown: .constant(false), titleName: .constant("SwiftUI"))
    }
}
