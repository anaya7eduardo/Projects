//
//  Movie.swift
//  Movies
//
//  Created by Eduardo Anaya on 12/1/21.
//

import Foundation

struct Root: Codable {
    private enum CodingKeys:String, CodingKey {
        case results = "results"
    }
    let results: [Movie]
}

struct Movie: Codable {
    let title: String
    let releaseDate: String
    let voteAverage: Double
    let overview: String
    let image: String
    
    enum CodingKeys:String, CodingKey {
        case title = "title"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case overview = "overview"
        case image = "poster_path"
    }
}

/*
 MARK: -Needed Info
 {
   "backdrop_path": "/hZkgoQYus5vegHoetLkCJzb17zJ.jpg",
   "genres": [
     {
       "id": 18,
       "name": "Drama"
     }
   ],
   "original_title": "Fight Club",
   "overview": "A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.",
   "poster_path": "/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg",
   "release_date": "1999-10-15",
   "title": "Fight Club",
   "vote_average": 8.4,
}
 */
