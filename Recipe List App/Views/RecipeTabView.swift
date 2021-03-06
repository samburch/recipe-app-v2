//
//  RecipeTabView.swift
//  Recipe List App
//
//  Created by Sam Burch on 05/03/2021.
//

import SwiftUI

struct RecipeTabView: View {
    
    @State var tabIndex: Int = 2
    
    var body: some View {

        TabView (selection: $tabIndex) {
            
            RecipeFavouritesView()
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Favourites")
                    }
                }
                .tag(1)
            
            RecipeListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("All recipes")
                    }
                }
                .tag(2)
            
        }
        .environmentObject(RecipeModel())
        
    }

}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
