//
//  ContentView.swift
//  Recipe List App
//
//  Created by Sam Burch on 25/02/2021.
//

import SwiftUI

struct RecipeListView: View {
    
    // Add the envrionment object RecipeModel to the view
    @EnvironmentObject var model: RecipeModel
    
    var body: some View {
    
        NavigationView {
            List(model.recipes) { r in
        
                NavigationLink(
                    destination: RecipeDetailView(recipe: r),
                    label: {

                        // MARK: Row item
                        HStack(spacing: 20.0){
                            
                            Image(r.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .clipped()
                                .cornerRadius(16)
                            Text(r.name)
                            
                        }
                        
                    })
                
        
            }
            .navigationBarTitle("All recipes")
        }
        
    }
    
}


struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
