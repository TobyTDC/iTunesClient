//
//  SearchResultsViewController.swift
//  iTunesClient
//
//  Created by toby tang on 2017-12-11.
//  Copyright © 2017 Toby Tang. All rights reserved.
//

import UIKit

class SearchResultsViewController: UITableViewController {
    
    let searchController = UISearchController (searchResultsController: nil)
    let dataSource = SearchResultsDataSource()
    let client = ItunesAPIClient()

    override func viewDidLoad() {
        super.viewDidLoad()


        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel,target:self, action: #selector(SearchResultsViewController.dismissSearchResultsController))
        
        tableView.tableHeaderView = searchController.searchBar
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        
        tableView.dataSource = dataSource
        definesPresentationContext = true
    }

    @objc func dismissSearchResultsController() {
        self.dismiss(animated: true, completion: nil)
    }
    
    // Mark: -- Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAlbums"{
            if let indexPath = tableView.indexPathForSelectedRow {
                let artist = dataSource.artist(at: indexPath)
                let albumListController = segue.destination as! AlbumListController
                
                client.lookupArtist(withId: artist.id) { artist, error in
                    albumListController.artist = artist
                    albumListController.tableView.reloadData()
                    
                }
            }
        }
    }

}

extension SearchResultsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        client.searchForArtists(withTerm: searchController.searchBar.text!) {
            [weak self] artists, error in
            self?.dataSource.update(with: artists)
            self?.tableView.reloadData()
        }
    }
}
