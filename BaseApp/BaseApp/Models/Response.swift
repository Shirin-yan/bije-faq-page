//
//  Response.swift
//  BaseApp
//
//  Created by Shirin on 3/24/23.
//

import Foundation

struct BaseResponse<T: Codable>: Codable {
    var next: Int?
    var previous: Int?
    var total: Int?
    var results: T?
}

struct Faq: Codable {
    var id: Int
    var owner: User
    var category: Category
    var question: String
    var up_vote: Int
    var down_vote: Int
    var answer_count: Int
    var vote: Int
    var is_bookmarked: Bool
    var verified_answer: Bool
    var price: Int
    var created_at: String
}

struct User: Codable {
    var id: Int
    var name: String
    var avatar: String
}

struct Category: Codable {
    var id: Int
    var name: String
    var icon: String
}

struct Empty: Codable { } 
