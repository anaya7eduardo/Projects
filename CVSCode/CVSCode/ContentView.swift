//
//  ContentView.swift
//  CVSCode
//
//  Created by unkn0wn on 3/10/23.
//

import SwiftUI

/*
https://www.hackingwithswift.com/samples/petitions-1.json
*/

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            
            if let response = viewModel.response {
                
                List(response.results) { node in
                    HStack {
                        VStack {
                            HStack {
                                Text(node.title ?? "Unkn0wn")
                                
                                Spacer()
                            }
                            if let issues = node.issues {
                                
                                VStack {
                                    ForEach(issues) { issue in
                                        HStack {
                                            
                                            Text(issue.name ?? "Unkn0wn")
                                                .padding(.all, 6.0)
                                            Spacer()
                                        }
                                        
                                        .background(RoundedRectangle(cornerRadius: 8.0).stroke(style: StrokeStyle(lineWidth: 2.0)).foregroundColor(.gray))
                                    }
                                }
                                
                            }
                        }
                        .padding(.all, 12.0)
                    }
                    .background(RoundedRectangle(cornerRadius: 8.0).stroke(style: StrokeStyle(lineWidth: 2.0)).foregroundColor(.gray))
                    .padding(.all, 12.0)
                }
                
            }
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
