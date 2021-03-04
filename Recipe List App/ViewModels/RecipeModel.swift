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
    
}
