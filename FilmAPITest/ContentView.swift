//
//  ContentView.swift
//  FilmAPITest
//
//  Created by Aurelien Waxin on 20/11/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var request = APIRequest()
    
    var body: some View {
        NavigationStack {
            List(request.results) { movie in
                NavigationLink {
                    DetailView(movie: movie)
                } label: {
                    MovieItem(movie: movie)
                }
            }
            .listStyle(.plain)
            .navigationTitle("A l'affiche")
            
        } 
        .onAppear() {
            request.callAPI()
        }
    }
}

#Preview {
    ContentView()
}
