//
//  ArtworkDownloader.swift
//  iTunesClient
//
//  Created by toby tang on 2017-12-15.
//  Copyright © 2017 Toby Tang. All rights reserved.
//

import Foundation
import UIKit

class ArtworkDownloader: Operation {
    let album: Album
    
    init(album: Album) {
        self.album = album
        super.init()
    }
    
    override func main() {
        if self.isCancelled {
            return
        }
        
        guard let url = URL(string: album.artworkUrl) else {
            return
        }
        
        let imageData = try! Data(contentsOf: url)
        
        if self.isCancelled{
            return
        }
        
        if imageData.count > 0 {
            album.artwork = UIImage(data: imageData)
            album.artworkState = .downloaded
        } else {
            album.artworkState = .failed
        }
    }
}












