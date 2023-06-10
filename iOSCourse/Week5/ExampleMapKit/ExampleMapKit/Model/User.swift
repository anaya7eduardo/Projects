//
//  User.swift
//  ExampleMapKit
//
//  Created by Eduardo Anaya on 12/15/21.
//

import Foundation
/*
 SAMPLE OUTPUT:
 
 {"results":[{
    "gender":"female",
    "name": {
        "title":"Miss",
        "first":"Ellie",
        "last":"Brown"},
    "location":{
        "street":{
            "number":6004,
            "name":"Worcester Street"},
        "city":"Auckland",
        "state":"Canterbury",
        "country":"New Zealand",
        "postcode":16431,
        "coordinates":{
            "latitude":"62.8743",
            "longitude":"138.4403"},
        "timezone":{
            "offset":"+8:00",
            "description":"Beijing, Perth, Singapore, Hong Kong"}},
    "email":"ellie.brown@example.com",
    "login":{
        "uuid":"302d9f02-16fe-4d35-8d5f-cf5ebeaefd70",
        "username":"yellowpeacock948",
        "password":"fenris",
        "salt":"A84YptdZ",
        "md5":"5984388acce6fd81859c2a7409ac0aea",
        "sha1":"6977407c1ee77b9a2675c03082373a6809fbc8a5",
        "sha256":"0639767dedac995d5d0a5ece03ea95350802c37359a9eb1cac4cae75fd4f9605"},
    "dob":{
        "date":"1961-12-16T13:09:33.995Z",
        "age":60},
    "registered":{"date":"2017-11-15T01:51:15.666Z","age":4},
    "phone":"(968)-984-0775",
    "cell":"(834)-440-7757",
    "id":{"name":"","value":null},
    "picture":{
        "large":"https://randomuser.me/api/portraits/women/69.jpg",
        "medium":"https://randomuser.me/api/portraits/med/women/69.jpg",
        "thumbnail":"https://randomuser.me/api/portraits/thumb/women/69.jpg"},
    "nat":"NZ"}]
 */
/*
 NEEDED OUTPUT:
 {"results":[{
    "name": {
        "title":"Miss",
        "first":"Ellie",
        "last":"Brown"},
    "location":{
        "coordinates":{
            "latitude":"62.8743",
            "longitude":"138.4403"}
    "email":"ellie.brown@example.com"
    "picture":{
        "thumbnail":"https://randomuser.me/api/portraits/thumb/women/69.jpg"}
 */

struct Raw: Codable {
    let object: [User]
    
    enum CodingKeys: String, CodingKey {
        case object = "results"
    }
}

struct User: Codable {
    let name: FullName
    let location: Coordinates
    let email: String
    let picture: Pictures
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case location = "location"
        case email = "email"
        case picture = "picture"
    }
}

struct FullName: Codable {
    let title, first, last: String
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case first = "first"
        case last = "last"
    }
}

struct Coordinates: Codable {
    let coords: Coords
    enum CodingKeys: String, CodingKey {
        case coords = "coordinates"
    }
}

struct Coords: Codable {
    let latitude, longitude: String
    enum CodingKeys: String, CodingKey {
        case latitude = "latitude"
        case longitude = "longitude"
    }
}

struct Pictures: Codable {
    let large, medium, thumbnail: URL
    enum CodingKeys: String, CodingKey {
        case large = "large"
        case medium = "medium"
        case thumbnail = "thumbnail"
    }
}
