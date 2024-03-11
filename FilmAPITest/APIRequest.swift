//
//  APIRequest.swift
//  FilmAPITest
//
//  Created by Aurelien Waxin on 20/11/2023.
//

import Foundation

class APIRequest : ObservableObject {
    
    @Published var results: [Movie]  = []
    
    
    //    APPEL
    //    BASE
    let base = "https://api.themoviedb.org/3/discover/movie"
    //    KEY
    let key = "api_key=" + API_KEY
    // Langue
    let language = "language=fr"
    //    Sort
    let sort = "sort_by=desc"
    
    func callAPI() {
        let urlString = base + "?" + language + "&" + key
        
        if let url: URL = URL(string: urlString) {
            print(url)

            URLSession.shared.dataTask(with: url) { data, response, error in
                print("coucoucou")
                DispatchQueue.main.async {
//                                        
                    if let data = data {
                        //                        utiliser le JSONDecoder pour convertir les données
                        do {
                            let res = try JSONDecoder().decode(APIResults.self, from: data)
                            self.results = res.results
                        } catch {
                            self.results = []
                            print(error.localizedDescription)
                        }
                    }
                }
                
            }.resume()
            
        } else {
            results = []
        }
    }
    
}
