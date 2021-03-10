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
    
    @State var isDetailViewShowing = false
    @State var tabIndex = 0
    
    // MARK: Find the first index of the featured recipes
    func findFirstFeaturedIndex() {
        
        // Find the first index
        let index = model.recipes.firstIndex { (recipe) -> Bool in
            return recipe.featured
        }
        tabIndex = index ?? 0
        
    }
    
    var body: some View {
        
        VStack (alignment: .leading, spacing: 0) {
        
            Text("Featured recipes")
                .font(Font.custom("Avenir Heavy", size: 24))
                .bold()
                .padding(.leading)
            
            GeometryReader { geo in
                
                TabView (selection: $tabIndex) {
                    
                    // Loop through each of the Recipes in the data object
                    ForEach(0..<model.recipes.count) { index in
                        
                        // Filter just the feautred recipes to display
                        if (model.recipes[index].featured) {
                           
                            Button(action: {
                                
                                // Show the recipe detail sheet
                                self.isDetailViewShowing = true
                                
                            }, label: {
                                
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
                                            .font(Font.custom("Avenir", size: 15))
                                        
                                    }
                                    
                                }
                                
                            })
                            .tag(index)
                            .sheet(isPresented: $isDetailViewShowing){
                                // Show the Recipe Detail View
                                RecipeDetailView(recipe: model.recipes[index])
                            }
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                            .cornerRadius(20)
                            .shadow(radius: 20)
                            
                        }
                        
                    }
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                
            }
            
            VStack(alignment: .leading, spacing: 5) {
                
                Text("Preperation time:")
                    .font(Font.custom("Avenir Heavy", size: 16))
                Text(model.recipes[tabIndex].prepTime)
                    .font(Font.custom("Avenir", size: 15))
                Text("Highlights")
                    .font(Font.custom("Avenir Heavy", size: 16))
                RecipeHighlights(highlights: model.recipes[tabIndex].highlights)
                
            }.padding([.leading, .bottom])
            
            
        }.onAppear(perform: {
            findFirstFeaturedIndex()
        })
        
    }
}

struct RecipeFavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFavouritesView()
            .environmentObject(RecipeModel())
    }
}
