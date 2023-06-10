//
//  ExampleView.swift
//  UIKitAndSwiftUIBoth
//
//  Created by unkn0wn on 2/28/23.
//

import SwiftUI

struct ExampleView: View {
    
    weak var navigateController: UINavigationController?
    
    var body: some View {
        VStack {
            Text("Hello, SwiftUI")
                .padding()
            
            Button("Click Here") {
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let secondViewController = storyBoard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
                self.navigateController?.pushViewController(secondViewController, animated: true)
            }
        }.padding()
    }
}

struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}
