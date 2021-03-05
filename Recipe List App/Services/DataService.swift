//
//  DataService.swift
//  Recipe List App
//
//  Created by Sam Burch on 25/02/2021.
//

import Foundation

class DataService {
    
    // Data Service method to fetch the JSON data for the project and return the recipes
    // Seperating this method into a seperate file makes it more manageable
    static func getLocalData() -> [Recipe] {
        
        // Parse local JSON file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        // Check if pathstring is not nil otherwise return an empty recipe list
        guard pathString != nil else {
            return[Recipe]()
        }
        
        // Get a URL path to the json file
        let url = URL(fileURLWithPath: pathString!)
        
        do {

            // Create a data object
            let data = try Data(contentsOf: url)
            
            // Decode the data with a json decode
            let decoder = JSONDecoder()
            
            do {
                
                // Add the unique IDs
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // Loop through each of the recipes and set the ID to a UUID
                for r in recipeData {
                    
                    // Set an ID for the Recipe objects
                    r.id = UUID()
                    
                    for i in r.ingredients {
                        
                        //Set an ID for the Ingredients objects
                        i.id = UUID()
                        
                    }
                    
                }
                
                // Return the recipes
                return recipeData
                
            }
            
            catch {
                
                print(error)
                
            }
            
        }
        
        catch {
            
            // Error with getting data
            print(error)
            
        }
        
        
        return [Recipe]()
        
    }
    
}
