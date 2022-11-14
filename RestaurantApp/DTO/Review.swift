//
//  Review.swift
//  RestaurantApp
//
//  Created by Christian Malki on 2022-11-10.
//

import Foundation

struct Review: Codable, Identifiable {
    var id: String
    var name: String
    var message: String
}
