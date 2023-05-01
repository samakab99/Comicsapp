//
//  FavoritesView.swift
//  Comicsapp
//
//  Created by Samakab on 01/05/2023.
//

import SwiftUI
struct FavoriteView: View {
    @EnvironmentObject var comicsViewModel: ComicsViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(comicsViewModel.savedComics) { comic in
                    ComicRow(comic: comic)
                        .padding(.trailing, 16)
                }
                .onDelete(perform: deleteComic)
                .padding(.bottom, 50)
 
                
            }
            
        }
        
    }
    private func deleteComic(at offsets: IndexSet) {
        print("slettet")
    }
}




struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
