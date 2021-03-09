//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Sam Burch on 25/02/2021.
//

import Foundation

class RecipeModel: ObservableObject {
    
    // A variable to store the recipe data which will be reused in different views
    @Published var recipes = [Recipe]()
    
    init() {
    
        // Create an instance of data service and get data
        self.recipes = DataService.getLocalData()
    
    }
    
    // A method to calculate the Recipe portion size based on the users input on the Recipe Detail View
    static func getServingSize(ingredient: Ingredients, recipeServings: Int, targetServings: Int) -> String {
        
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
        
            // Get a single serving size by multipling demoniator by the recipe servings
            denominator *= recipeServings
            
            // Get target serving size by multipling numerator by target serving size
            numerator *= targetServings
            
            // Reduce fraction down by the greatest common divisor
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            // Get the whole portion size if numerator > than divisor
            if numerator >= denominator {
                
                // Calculated whole portions
                wholePortions = numerator / denominator
                
                // Calculate the remainder
                numerator = numerator % denominator
                
                // Assign portion string
                portion += String(wholePortions)
                
            }
            
            // Express the remainder as a fraction
            if numerator > 0 {
                
                // Assign remaindeer as a fraction to the portion string
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
                
            }
                
        }
        
        if var unit = ingredient.unit {
            
            // If we need to pluralise
            if wholePortions > 1 {
            
                // Calculate appropriate suffix
                if unit.suffix(2) == "ch" {
                    
                    unit = unit + "es"
                    
                } else if unit.suffix(1) == "f" {
                    
                    unit = String(unit.dropLast())
                    unit += "ves"
                    
                } else {
                    
                    unit += "s"
                    
                }
            
            }
            
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            
            return portion + unit
            
        }
        
        return portion
    }
    
}
