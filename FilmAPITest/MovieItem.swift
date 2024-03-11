//
//  MovieItem.swift
//  FilmAPITest
//
//  Created by Aurelien Waxin on 20/11/2023.
//

import SwiftUI

struct MovieItem: View {
    @StateObject var imageDownloader = ImageDownloader()
    
    var movie : Movie
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text(movie.title)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                Spacer()
            } .padding()
            ZStack(alignment: .bottomTrailing) {
                if imageDownloader.image != nil {
                    imageDownloader.image!
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 225)
                        .clipped()
                }
                Text(String(format:"%.1f", movie.vote_average))
                    .bold()
                    .frame(width: 45, height: 45)
                    .foregroundColor(.white)
                    .background(.indigo)
                    .clipShape(Circle())
                    .offset(x: 20,y:20)
            }
            Rectangle()
                .frame(height: 10)
                .foregroundStyle(.clear)
        }.onAppear() {
            imageDownloader.getImage(path: movie.poster_path)
        }
        
    }
}
