//
//  DetailsView.swift
//  CombineExample
//
//  Created by unkn0wn on 3/8/23.
//

import SwiftUI

struct DetailsView: View {
    
    let user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            let id = "\(user.id)"
            let address = "\(user.address.street) \(user.address.suite)"
            let city = "\(user.address.city) Zip: \(user.address.zipcode)"
            let geo = "\(user.address.geo.lat), \(user.address.geo.lng)"
            
            Text("ID: " + id)
            Text("Name: " + user.name)
            Text("Username: " + user.username)
            Text("Email: " + user.email)
            Text("Address: " + address)
            Text("City: " + city)
            Text("Geo: " + geo)
            Text("Phone: " + user.phone)
        }.padding()
    }
}

//struct DetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailsView()
//    }
//}
