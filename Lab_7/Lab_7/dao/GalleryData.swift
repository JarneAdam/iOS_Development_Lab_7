//
//  GalleryData.swift
//  Lab_7
//
//  Created by Jarne Adam on 03/12/2025.
//

import Foundation

@Observable
class GalleryData {
    let galleries : [Gallery]
    
    init() {
        let galleriesData : Galleries = load("galleries.json")
        galleries = galleriesData.galleries
    }
}
