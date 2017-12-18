//
//  AlbumDetailViewModel.swift
//  iTunesClient
//
//  Created by toby tang on 2017-12-13.
//  Copyright © 2017 Toby Tang. All rights reserved.
//

import Foundation

struct AlbumDetailViewModel {
    let title: String
    let releaseDate: String
    let genre: String
    
}

extension AlbumDetailViewModel {
    init(album: Album) {
        self.title = album.censoredName
        self.genre = album.primaryGenre.name
        
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        
        formatter.dateFormat = "MMM dd, yyyy"
        self.releaseDate = formatter.string(from: album.releaseDate)
    }
}
