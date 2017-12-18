//
//  SearchResultsDataSource.swift
//  iTunesClient
//
//  Created by toby tang on 2017-12-11.
//  Copyright © 2017 Toby Tang. All rights reserved.
//

import UIKit

class SearchResultsDataSource: NSObject, UITableViewDataSource{
    
    private var data = [Artist]()

    override init(){
        super.init()
    }
    
    func update(with artists: [Artist]) {
        data = artists
    }
    
    //Mark: --Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath)
        let artist = data[indexPath.row]
        cell.textLabel?.text = artist.name
        
        return cell
    }
    
    // Mark: Helper
    
    func artist(at indexPath: IndexPath) -> Artist {
        return data[indexPath.row]
    }
}
