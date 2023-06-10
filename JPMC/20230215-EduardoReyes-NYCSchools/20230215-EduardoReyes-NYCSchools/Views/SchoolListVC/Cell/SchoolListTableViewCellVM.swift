//
//  SchoolListTableViewCellVM.swift
//  20230215-EduardoReyes-NYCSchools
//
//  Created by unkn0wn on 2/15/23.
//

import Foundation

struct SchoolTableViewCellViewModel {
    let dbn: String?
    let schoolName: String?
    let overviewParagraph: String?
    let numOfSatTestTakers: String?
    let satCriticalReadingAvgScore: String?
    let satMathAvgScore: String?
    let satWritingAvgScore: String?
    let phoneNumber: String?
    let website: String?
    
    enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
        case overviewParagraph = "overview_paragraph"
        case numOfSatTestTakers = "num_of_sat_test_takers"
        case satCriticalReadingAvgScore = "sat_critical_reading_avg_score"
        case satMathAvgScore = "sat_math_avg_score"
        case satWritingAvgScore = "sat_writing_avg_score"
        case phoneNumber = "phone_number"
        case website = "website"
        
    }
}
