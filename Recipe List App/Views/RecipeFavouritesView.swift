//
//  RecipeFavouritesView.swift
//  Recipe List App
//
//  Created by Sam Burch on 06/03/2021.
//

import SwiftUI

struct RecipeFavouritesView: View {

    // Add the envrionment object RecipeModel to the view
    @EnvironmentObject var model: RecipeModel
    
    var body: some View {
        
        VStack (alignment: .leading, spacing: 0) {
        
            Text("Featured recipes")
                .font(.title)
                .bold()
                .padding(.leading)
            
            GeometryReader { geo in
                
                TabView {
                    
                    // Loop through each of the Recipes in the data object
                    ForEach(0..<model.recipes.count) { index in
                        
                        // Filter just the feautred recipes to display
                        if (model.recipes[index].featured) {
                            
                            ZStack {
                                
                                Rectangle()
                                    .foregroundColor(.white)
                                
                                VStack (spacing: 0) {
                                    
                                    Image(model.recipes[index].image)
                                        .resizable()
                                        .clipped()
                                        .aspectRatio(contentMode: .fill)
                                    
                                    Text(model.recipes[index].name)
                                        .padding()
                                    
                                }
                                
                                
                            }.frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                            .cornerRadius(20)
                            .shadow(radius: 20)
                            
                        }
                        
                    }
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                
            }
            
            VStack(alignment: .leading, spacing: 5) {
                
                Text("Preperation time")
                    .font(.headline)
                Text("1 hour")
                Text("Highlights")
                    .font(.headline)
                Text("Healthy, light, vegetarian")
                
                
            }.padding([.leading, .bottom])
            
            
        }
        
    }
}

struct RecipeFavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFavouritesView()
            .environmentObject(RecipeModel())
    }
}
