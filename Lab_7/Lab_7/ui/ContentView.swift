//
//  ContentView.swift
//  Lab_7
//
//  Created by Jarne Adam on 03/12/2025.
//

import SwiftUI

struct ContentView: View {
    @Environment(AppData.self) private var appData
    var body: some View {
        TabView {
            Tab("Galleries", systemImage: "building.columns"){
                GalleriesView()
            }
            Tab(appData.selectedGallery?.name ?? "No gallery", systemImage: "paintpalette"){
                GalleryDetailView()
            }
        }
    }
}
