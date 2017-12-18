//
//  AlbumCellViewModel.swift
//  iTunesClient
//
//  Created by toby tang on 2017-12-11.
//  Copyright © 2017 Toby Tang. All rights reserved.
//

import Foundation
import UIKit


struct AlbumCellViewModel {
    let artwork: UIImage
    let title: String
    let releaseDate: String
    let genre: String
    
}

extension AlbumCellViewModel {
    init(album: Album) {
        self.artwork = album.artworkState == .downloaded ? album.artwork! : #imageLiteral(resourceName: "AlbumPlaceholder")
        self.title = album.censoredName
        self.genre = album.primaryGenre.name
        
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        
        formatter.dateFormat = "MMM dd, yyyy"
        self.releaseDate = formatter.string(from: album.releaseDate)
    }
}

