//
//  ArtistView.swift
//  Lab_7
//
//  Created by Jarne Adam on 03/12/2025.
//

import SwiftUI

struct ArtistView: View {
    var artist: Artist
    @Environment(AppData.self) private var appData
    
    var body: some View {
        VStack {
            Text(artist.name).font(.title).fontWeight(.bold).foregroundStyle(.brown)
            Divider().overlay(.brown)
            Text(artist.nationality).font(.subheadline)
            Text(artist.style)
            Text(artist.description).font(.footnote).foregroundStyle(.gray)
            Divider()
            Text("List of art").foregroundStyle(.brown)
            List(artist.artworks) { artwork in
                VStack {
                    Text(artwork.title).foregroundStyle(.brown).fontWeight(.bold)
                    Text(artwork.description).foregroundStyle(.gray).lineLimit(1)
                }.onTapGesture {
                    appData.path.append(.artwork(artwork))
                }
            }
        }
    }
}
