//
//  Results.swift
//  FilmAPITest
//
//  Created by Aurelien Waxin on 20/11/2023.
//

import Foundation

struct APIResults: Decodable {
    var results: [Movie]

}
struct Movie: Decodable, Identifiable {
    var adult: Bool
    var backdrop_path : String
    var genre_ids :[Int]
    var id : Int
    var original_language : String
    var original_title : String
    var overview : String
    var popularity : Double
    var poster_path : String
    var release_date : String
    var title : String
    var video : Bool
    var vote_average : Double
    var vote_count : Int
}
