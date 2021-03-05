//
//  Ingredients.swift
//  Recipe List App
//
//  Created by Sam Burch on 05/03/2021.
//

import Foundation

class Ingredients: Identifiable, Decodable {
    
    // Unwwrap all the ingreadients within a recipe
    // Set an ID for the ingredients too
    var id: UUID?
    var name: String
    var num: Int?
    var denom: Int?
    var unit: String?
    
}
