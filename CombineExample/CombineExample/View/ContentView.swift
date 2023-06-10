//
//  ContentView.swift
//  CombineExample
//
//  Created by unkn0wn on 3/8/23.
//

/*
 Framework by Apple for Reactive Programming
 Introduced in iOS 13.0
 Works well in terms of SwiftUI and Apple Ecosystem
 It is used for doing asynchronous tasks
 
 Model - Publisher : Subscriber
 
 1. Netflix/Spotify or any digital subscription app
 2. Newspaper/Magazines
 3. Radio Broadcaster
 
 Components/How it works:
 Publisher - Data sender - Some Protocol
 Subscriber - Data receiver - Some Protocol
 Operator - Takes data from Publisher, process and gives it to Subscriber - Methods/Functions which work on Publisher
 
 Before it was RxSwift - general purpose framework for doing asynchronous tasks
 */

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel: UserViewModel = UserViewModel(networkManager: NetworkManager())
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.usersList) { user in
                    NavigationLink {
                        DetailsView(user: user)
                    } label: {
                        ListCell(cellTitle: user.name)
                    }
                }
            }.onAppear {
                viewModel.getUsersList(urlString: APIEndpoints.UsersListEndpoint)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/*
 {
 "id":1,
 "name":"Leanne Graham",
 "username":"Bret",
 "email":"Sincere@april.biz",
 "address":{
 "street":"Kulas Light",
 "suite":"Apt. 556",
 "city":"Gwenborough",
 "zipcode":"92998-3874",
 "geo":{
 "lat":"-37.3159",
 "lng":"81.1496"
 }
 },
 "phone":"1-770-736-8031 x56442",
 "website":"hildegard.org",
 "company":{
 "name":"Romaguera-Crona",
 "catchPhrase":"Multi-layered client-server neural-net",
 "bs":"harness real-time e-markets"
 }
 */
