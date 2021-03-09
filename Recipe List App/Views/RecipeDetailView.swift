//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Sam Burch on 01/03/2021.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe: Recipe
    
    @State var servingSize = 2
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading) {
                
                // MARK: Recipe image
                Image(recipe.image)
                    .resizable()
                    .scaledToFit()
                    .clipped(antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                
                // MARK: Recipe title
                Text(recipe.name)
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 20)
                    .padding(.leading)
                
                // MARK: Serving size picker
                VStack(alignment: .leading) {
                    
                    Text("Select serving size")
                    Picker("", selection: $servingSize) {
                        
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                        
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 160)
                
                }
                .padding()
                
                // MARK: Ingredients
                VStack(alignment: .leading) {
                
                    Text("Ingredients")
                        .font(.headline)
                    
                    // Get the ingredients
                    ForEach (recipe.ingredients) { direction in
                        
                        // Call the RecipeModel serving static method in order to calculate the serving sizes
                        Text("• \(RecipeModel.getServingSize(ingredient: direction, recipeServings: recipe.servings, targetServings: servingSize)) \(direction.name.lowercased())")
                        
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
            
        }
        
    }
    
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Create a dummy recipe view and pass it to the previwer so we can test
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
