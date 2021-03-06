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
        Text("Hello Sam")
    }
}

struct RecipeFavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFavouritesView()
    }
}
