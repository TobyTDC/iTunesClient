//
//  ItunesError.swift
//  iTunesClient
//
//  Created by toby tang on 2017-12-15.
//  Copyright © 2017 Toby Tang. All rights reserved.
//

import Foundation


enum ItunesError: Error {
    case requestFailed
    case responseUnsuccessful
    case invalidData
    case jsonConversionFailure
    case jsonParsingFailure(message: String)
}

