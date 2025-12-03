//
//  GalleriesView.swift
//  Lab_7
//
//  Created by Jarne Adam on 03/12/2025.
//

import SwiftUI

struct GalleriesView: View {
    @Environment(AppData.self) private var appData
    var body: some View {
        @Bindable var appData = appData
        
        List(appData.galleries, id: \.self, selection: $appData.selectedGallery) { gallery in
            VStack {
                Text(gallery.name).font(.title).fontWeight(.bold).foregroundStyle(.brown)
                Text(gallery.location).font(.subheadline)
                Text(gallery.description).font(.footnote).foregroundStyle(.gray).lineLimit(1)
            }
        }.padding()
    }
}
