//
//  ContentView.swift
//  SwiftUILearning
//
//  Created by unkn0wn on 2/21/23.
//

import SwiftUI

struct ContentView: View {
    
    @Binding var emailID: String
    @Binding var password: String
    @Environment(\.colorScheme) var colorScheme
    @State var path = [Root]()
    
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
//        NavigationStack(path: $path) {
            VStack {
                Image(systemName: "globe")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.green)
                
                Text("Welcome")
                    .foregroundColor(.brown)
                    .font(.title)
                
                TextField("EmailID", text: $emailID)
                    .textFieldStyle(.roundedBorder)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .padding(.bottom, 10)
                
                if colorScheme == .light {
                    Text("Current Scheme").foregroundColor(.red)
                } else {
                    Text("Current Scheme").foregroundColor(.green)
                }
                
//                NavigationLink {
                Button {
//                    ListScreen(viewModel: EmployeeViewModel(networkable: NetworkManager()))
                    coordinator.navigateToListScreen()
                } label: {
                    Text("Navigate")
                }
                .padding()
                
//                NavigationLink(value: "NewValue") {
                    Button("Log In") {
                        print("Button Tapped")
                        print("UserID - " + emailID)
                        print("Password - " + password)
//                        path.append(.grid)
                        coordinator.navigateToGridView()
                    }.buttonStyle(.bordered)
                    .padding()
//                }.navigationDestination(for: String.self) { view in
//                    ListScreen(viewModel: EmployeeViewModel(networkable: NetworkManager()))
//                }.padding(10)
                
                Button("Navigate on Button Click") {
                    coordinator.navigateToListScreen()
                }
                .buttonStyle(.borderedProminent)
                .padding()
                .tint(.indigo)
            }
            .padding()
//            .navigationDestination(for: Root.self) { navigate in
//                switch navigate {
//                case .list:
//                    ListScreen(viewModel: EmployeeViewModel(networkable: NetworkManager()))
//                case .grid:
//                    GridView()
//                case .details:
//                    DetailsScreen(detailTitle: "SwiftUI")
//                default:
//                    GridView()
//                }
//            }
//        }
        .padding()
    }
    
    enum Root {
        case list
        case grid
        case details
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    @State static var emailID = ""
    @State static var password = ""
    
    static var previews: some View {
        ContentView(emailID: $emailID, password: $password)
    }
    
}
