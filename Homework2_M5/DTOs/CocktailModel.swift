//
//  CocktailModel.swift
//  Homework2_M5
//
//  Created by Aziza A on 25/3/23.
//

import Foundation

struct Drinks: Codable {
    var drinks: [CocktailModel]?
}

struct CocktailModel: Codable {
    var strDrink: String
    var strDrinkThumb: String
    var strInstructions: String
    var strIngredient1: String
    var strIngredient2: String
}
