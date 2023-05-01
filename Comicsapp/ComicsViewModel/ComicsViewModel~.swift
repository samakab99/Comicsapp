//
//  ComicsViewModel.swift
//  Comicsapp
//
//  Created by Samakab on 30/04/2023.
//

import Foundation
import Combine
import SwiftUI

class ComicsViewModel: ObservableObject {
    @Published var comics: [Welcome] = []
    @Published var savedComics: [Welcome] = []

    private let baseURL = "https://xkcd.com"
    private let infoEndpoint = "/info.0.json"

    init() {
        fetchComics()
    }

    func addComicToFavorites(_ comic: Welcome) {
        DispatchQueue.main.async {
            self.savedComics.append(comic)
        }
    }

    func removeComic(_ comic: Welcome) {
        DispatchQueue.main.async {
            if let index = savedComics.firstIndex(where: { $0.id == comic.id }) {
                savedComics.remove(at: index)
            }
        }
        
    }

    func saveComic(_ comic: Welcome) {
        if !isComicSaved(comic) {
            savedComics.append(comic)
        } else {
            if let index = savedComics.firstIndex(where: { $0.num == comic.num }) {
                savedComics.remove(at: index)
            }
        }
    }

    func isComicSaved(_ comic: Welcome) -> Bool {
        savedComics.contains(where: { $0.num == comic.num })
    }

    func getComicIndex(_ comic: Welcome) -> Int? {
        comics.firstIndex(where: { $0.num == comic.num })
    }

    func toggleSave(comic: Welcome) {
        if isComicSaved(comic) {
            removeComic(comic)
        } else {
            saveComic(comic)
        }
    }

    func fetchComics() {
        
        
        
        for index in 1...5 {
            let urlString = "\(baseURL)/\(index)\(infoEndpoint)"
            guard let url = URL(string: urlString) else { return }

            URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                guard let self = self, let data = data, error == nil else {
                    print("Error: \(error?.localizedDescription ?? "Unknown error")")
                    return
                }
                do {
                    let comic = try JSONDecoder().decode(Welcome.self, from: data)
                    DispatchQueue.main.async {
                        self.comics.append(comic)
                    }
                } catch {
                    print("Error: \(error.localizedDescription)")
                }
            }.resume()
        }
    }
  
}
