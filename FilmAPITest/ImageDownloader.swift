//
//  ImageDownloader.swift
//  FilmAPITest
//
//  Created by Aurelien Waxin on 20/11/2023.
//

import SwiftUI

class ImageDownloader: ObservableObject {
    @Published var image: Image?
    
    
    func getImage(path: String) {
        if let url = URL(string: "https://image.tmdb.org/t/p/w500/" + path) {
            URLSession.shared.dataTask(with: url) { d, _, e in
                DispatchQueue.main.async {
                    if let error = e {
                        self.image = nil
                        print(error.localizedDescription)
                    }
                    if let data = d {
                        if let ui = UIImage(data: data) {
                            self.image = Image(uiImage: ui)
                        } else {
                            self.image = nil
                        }
                    }
                    
                }
            }.resume()
        } else {
            self.image = nil
        }
    }
}
