//
//  QueryItemProvider.swift
//  iTunesClient
//
//  Created by toby tang on 2017-12-15.
//  Copyright © 2017 Toby Tang. All rights reserved.
//

import Foundation

protocol QueryItemProvider {
    var queryItem: URLQueryItem { get }
}

