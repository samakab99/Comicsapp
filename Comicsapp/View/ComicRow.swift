//
//  ComicRow.swift
//  Comicsapp
//
//  Created by Samakab on 01/05/2023.
//

import SwiftUI

struct ComicRow: View {
    let comic: Welcome
    
    @EnvironmentObject var comicsViewModel: ComicsViewModel

    var body: some View {
        
        HStack {
            
            VStack{
                AsyncImage(url: URL(string: comic.img)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 320, height: 300)
                
                .cornerRadius(8)
                .padding(.leading, 20)
                
                Text(comic.title)
                
                    .font(.headline)
                    .lineLimit(nil)
             
                
                  
                HStack {
                    Spacer()
                    VStack(alignment: .center) {
                        Text(comic.alt)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .lineLimit(nil)
                        Button(action: {
                            comicsViewModel.toggleSave(comic: comic)
                        }) {
                            Image(systemName: comicsViewModel.isComicSaved(comic) ? "heart.fill" : "heart")
                                .font(.system(size: 36))
                                .foregroundColor(comicsViewModel.isComicSaved(comic) ? .red : .gray)
                                .padding(.bottom, 5)
                        }
                    }
                    Spacer()
                }
               
             
              
            }
            
        }
        .padding(.top, 50)
   
    }
}


struct ComicRow_Previews: PreviewProvider {
    static var previews: some View {
        ComicRow(comic: Welcome(month: "", num: 0, link: "", year: "", news: "", safeTitle: "", transcript: "", alt: "", img: "", title: "", day: ""))
    }
}

