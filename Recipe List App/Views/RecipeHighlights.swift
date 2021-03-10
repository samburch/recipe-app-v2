//
//  RecipeHighlights.swift
//  Recipe List App
//
//  Created by Sam Burch on 09/03/2021.
//

import SwiftUI

struct RecipeHighlights: View {
    
    var allHighlights = ""
    
    init(highlights: [String]) {
        
        // Loop through all the highlights in the array and add a comma
        for index in 0..<highlights.count {
            
            // If it's the last hightlight don't add a comma
            if index == highlights.count-1 {
                
                allHighlights += highlights[index]
                
            } else {
                
                allHighlights += "\(highlights[index]), "
            }
            
        }
        
    }
    
    var body: some View {
        
        Text(allHighlights)
            .font(Font.custom("Avenir", size: 15))
        
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: ["Test 1", "Test 2", "Test 3"])
    }
}
