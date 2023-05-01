//
//  ContentView.swift
//  Comicsapp
//
//  Created by Samakab on 30/04/2023.
//

import SwiftUI
struct ContentView: View {
    @ObservedObject var comicsViewModel = ComicsViewModel()
    @State private var searchText = ""
    @State private var username: String = ""
    
    var body: some View {
        TabView {
            VStack {
                Text("Search for your comics:")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                
                TextField("Search here", text: $searchText)
                    .padding()
                    .border(Color.white, width: 1)
                    .background(Color.white)
                    .frame(width: 320, height: 42)
                    .cornerRadius(10)
                
                List {
                          ForEach(Array(Set(comicsViewModel.comics.filter { comic in
                              searchText.isEmpty || comic.title.localizedStandardContains(searchText)
                          })), id: \.num) { comic in
                              ComicRow(comic: comic)
                                  .frame(width: 320, height: 360)
                                  .padding(.bottom, 30)
         
                          }
                      }
           
                .listStyle(PlainListStyle())
              
            }
       
            .padding(.top,50)
            .padding(.bottom, 86)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Backgroundyellow"))
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                comicsViewModel.fetchComics()
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            
            NavigationView {
                   FavoriteView()
                       .navigationBarTitle("Favorites")
               }
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favorites")
                    
                }
        }
        .environmentObject(comicsViewModel)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

