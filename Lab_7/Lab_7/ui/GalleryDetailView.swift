//
//  GalleryDetailView.swift
//  Lab_7
//
//  Created by Jarne Adam on 03/12/2025.
//

import SwiftUI

struct GalleryDetailView: View {
    @Environment(AppData.self) private var appData
    
    var body: some View {
        @Bindable var appData = appData
        if appData.selectedGallery == nil {
            Text("No gallery selected")
        } else {
            NavigationStack(path: $appData.path) {
                VStack {
                    Text(appData.selectedGallery!.name).font(.title).fontWeight(.bold).foregroundStyle(.brown)
                    Divider().overlay(.brown)
                    Text(appData.selectedGallery!.location).font(.subheadline)
                    Text(appData.selectedGallery!.description).font(.footnote).foregroundStyle(.gray)
                    Divider().overlay(.brown)
                    Text("List of artists").foregroundStyle(.brown)
                    List(appData.selectedGallery!.artists) { artist in
                        VStack {
                            Text(artist.name).fontWeight(.bold).foregroundStyle(.brown)
                            Text(artist.nationality).foregroundStyle(.gray)
                        }.onTapGesture {
                            appData.path.append(Route.artist(artist))
                        }
                    }
                }.navigationDestination(for: Route.self) { route in
                    switch route {
                    case let .artist(artist): ArtistView(artist: artist)
                    case let .artwork(artwork): ArtworkView(artwork: artwork)
                    }
                }
            }
        }
    }
}
