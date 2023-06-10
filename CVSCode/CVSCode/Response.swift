//
//  Response.swift
//  CVSCode
//
//  Created by unkn0wn on 3/10/23.
//

import Foundation

struct Response: Decodable {
    struct Item: Decodable, Identifiable {
        
        struct Issue: Decodable, Identifiable {
            let id: Int
            let name: String?
        }
        
        let id: String
        let title: String?
        let body: String?
        let issues: [Issue]?
        
    }
    let results: [Item]
}

/*
"title"

"body"

"issues"
 */

/*
{
 
   "results":[
      {
         "id":"2722358",
         "type":"petition",
         "title":"Remove Chuck Schumer and Nancy Pelosi from office",
         "body":"Schumer and Pelosi's hatred and refusing to work with President Donald J. Trump is holding America hostage. We the people know securing our southern border is a priority which will not happen with these two in office. Lets build the wall NOW!",
         "petition_type":[
            {
               "id":291,
               "name":"Call on Congress to act on an issue"
            }
         ],
         "issues":[
            {
               "id":306,
               "name":"Budget &amp; Taxes"
            },
            {
               "id":326,
               "name":"Homeland Security &amp; Defense"
            },
            {
               "id":29,
               "name":"Immigration"
            }
         ],
         "signatureThreshold":100000,
         "signatureCount":149,
         "signaturesNeeded":99851,
         "url":"https://petitions.whitehouse.gov/petition/remove-chuck-schumer-and-nancy-pelosi-office",
         "deadline":1549642064,
         "status":"closed",
         "response":[

         ],
         "created":1547050064,
         "isSignable":false,
         "isPublic":true,
         "reachedPublic":0
      },
*/
