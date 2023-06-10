//
//  SchoolInformationModel.swift
//  20230215-EduardoReyes-NYCSchools
//
//  Created by unkn0wn on 2/15/23.
//

import Foundation

struct SchoolInformation: Decodable {
    let dbn: String
    let schoolName: String
    let phoneNumber: String
    let overviewParagraph: String
    let website: String
    var satInfo: SchoolSATInformation?
    
    enum CodingKeys: String, CodingKey {
        case dbn, satInfo
        case schoolName = "school_name"
        case phoneNumber = "phone_number"
        case overviewParagraph = "overview_paragraph"
        case website = "website"
    }
    
}
