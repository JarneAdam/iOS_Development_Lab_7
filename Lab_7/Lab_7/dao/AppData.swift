//
//  AppData.swift
//  Lab_7
//
//  Created by Jarne Adam on 03/12/2025.
//

import Foundation

@Observable
class AppData {
    let galleries : [Gallery]
    private var _selectedGallery : Gallery? = nil
    var selectedGallery : Gallery? {
        get {
            return _selectedGallery
        }
        set {
            path = [Route]()
            _selectedGallery = newValue
        }
    }
    
    var path = [Route]()
    init() {
        let galleriesData = GalleryData()
        galleries = galleriesData.galleries
    }
    
    func getArtWorkSelectedGallery() -> [Artwork] {
        var artworks = [Artwork]()
        if selectedGallery != nil {
            for artist in selectedGallery!.artists {
                artworks.append(contentsOf: artist.artworks)
            }
        }
        return artworks
    }
    
    func getArtist(artwork: Artwork) -> Artist? {
        var artist : Artist? = nil
        for gallery in galleries {
            for galleryArtist in gallery.artists {
                for artistArtwork in galleryArtist.artworks {
                    if artistArtwork.id == artwork.id {
                        artist = galleryArtist
                    }
                }
            }
        }
        return artist
    }
}

enum Route: Hashable, Equatable{
    case artist(Artist)
    case artwork(Artwork)
}
