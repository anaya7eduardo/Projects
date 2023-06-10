//
//  SchoolInfo.swift
//  20230316-EduardoReyes-NYCSchools
//
//  Created by unkn0wn on 3/16/23.
//

import Foundation

struct SchoolInfo: Decodable {
    let dbn: String
    let schoolName: String
    let phoneNumber: String
    let overviewParagraph: String
    let website: String
    var satInfo: SATInfo?
    
    enum CodingKeys: String, CodingKey {
        case dbn, satInfo
        case schoolName = "school_name"
        case phoneNumber = "phone_number"
        case overviewParagraph = "overview_paragraph"
        case website = "website"
    }
}
