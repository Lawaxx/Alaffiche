//
//  DetailView.swift
//  FilmAPITest
//
//  Created by Aurelien Waxin on 20/11/2023.
//

import SwiftUI

struct DetailView: View {
    @StateObject var poster = ImageDownloader()
    @StateObject var cover = ImageDownloader()
    var movie : Movie
    var body: some View {
        VStack {
            if cover.image != nil {
                cover.image!
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipped()
            }
            HStack(alignment:.bottom) {
                if poster.image != nil {
                    poster.image!
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 100)
                }
            }
            Text(movie.title)
                .bold()
                .font(.largeTitle)
                .foregroundStyle(.indigo)
            Divider()
                .foregroundStyle(.indigo)
            Text(movie.overview)
                .italic()
                Spacer()
        }
        .edgesIgnoringSafeArea(.top)
        .onAppear() {
            cover.getImage(path: movie.backdrop_path)
        }
    }
}
