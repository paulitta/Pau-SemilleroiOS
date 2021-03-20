//
//  ViewController.swift
//  Pau-SemilleroiOS
//
//  Created by Paula Montero on 18/03/2021.
//

import UIKit

class PhotoListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var photos: [Photo] = [
        Photo(albumId: 1, id: 1, title: "album 1 con id 1", url: "jhfkjfhkfjhdksfj", thumbnailUrl: "djfhfjhdkjf"),
        Photo(albumId: 1, id: 2, title: "album 1 con id 2", url: "dkfhdfjdfhdkj", thumbnailUrl: "lkjlfkjd"),
        Photo(albumId: 6, id: 4, title: "album 6 con id 4", url: "kjlkgjldfkjlf", thumbnailUrl: "kjlkfjñdlkññsñsdj")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "PhotoCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        
    }

}

extension PhotoListViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! PhotoCell
        cell.idLabel.text = String(photos[indexPath.row].id)
        cell.titleLabel.text = photos[indexPath.row].title
        
        return cell
        
    }
    
}

extension PhotoListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}
