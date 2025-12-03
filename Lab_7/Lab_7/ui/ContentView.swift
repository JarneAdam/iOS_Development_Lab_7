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
            GalleriesView().tabItem {
                Label("Galleries", systemImage: "building.columns")
            }
            GalleryDetailView().tabItem {
                Label(appData.selectedGallery?.name ?? "No gallery", systemImage: "paintpalette")
            }
        }
    }
}
