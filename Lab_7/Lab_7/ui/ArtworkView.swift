//
//  ArtworkView.swift
//  Lab_7
//
//  Created by Jarne Adam on 03/12/2025.
//

import SwiftUI

struct ArtworkView: View {
    var artwork: Artwork
    @Environment(AppData.self) private var appData
    var body: some View {
        VStack {
            Text(artwork.title).font(.title).fontWeight(.bold).foregroundStyle(.brown)
            Divider().overlay(.brown)
            Text(artwork.medium).font(.subheadline)
            Text(artwork.dimensions)
            Text(artwork.description).font(.footnote).foregroundStyle(.gray)
            VStack(alignment: .leading) {
                Divider().overlay(.brown)
                Text("artist: \(appData.getArtist(artwork: artwork)?.name ?? "Unknown") ").foregroundStyle(.brown).onTapGesture {
                    let artist = appData.getArtist(artwork: artwork)
                    if artist != nil {
                        appData.path.append(.artist(artist!))
                    }
                }
            }
            Divider().overlay(.brown)
            Text("List of other art").foregroundStyle(.brown)
            List(appData.getArtWorkSelectedGallery()) { artworkInList in
                if artwork.artworkID != artworkInList.artworkID {
                    VStack {
                        Text(artworkInList.title).foregroundStyle(.brown).fontWeight(.bold)
                        Text(artworkInList.description).foregroundStyle(.gray).lineLimit(1)
                    }.onTapGesture {
                        appData.path.append(.artwork(artworkInList))
                    }
                }
            }
        }
    }
}
