//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Sam Burch on 01/03/2021.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe: Recipe
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading) {
                
                // MARK: Recipe image
                Image(recipe.image)
                    .resizable()
                    .scaledToFit()
                    .clipped(antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                
                // MARK: Ingredients
                VStack(alignment: .leading) {
                
                    Text("Ingredients")
                        .font(.headline)
                    
                    // Get the ingredients
                    ForEach (recipe.ingredients) { direction in
                                                
                        Text("• \(direction.name)")
                        
                    }
                    
                }
                .padding(.horizontal, 10)
                    
                    Divider()

                    // MARK: Directions
                    VStack(alignment: .leading) {
                        
                        Text("Directions")
                            .font(.headline)
                            .padding([.top, .bottom], 5)
                        
                        ForEach (0..<recipe.directions.count, id: \.self) {
                            index in
                            Text("\(String(index+1)). \(recipe.directions[index])")
                                .padding([.top, .bottom], 1)
                            
                        }
                        
                    }
                    .padding(.horizontal, 10)
                                    
            }
            
        }.navigationBarTitle(recipe.name)
        
    }
    
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Create a dummy recipe view and pass it to the previwer so we can test
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
