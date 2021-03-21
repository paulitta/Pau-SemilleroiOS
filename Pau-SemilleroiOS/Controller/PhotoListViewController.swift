//
//  ViewController.swift
//  Pau-SemilleroiOS
//
//  Created by Paula Montero on 18/03/2021.
//

import UIKit

class PhotoListViewController: UIViewController, PhotoManagerDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var photoManager = PhotoManager()
    
    var photoPairArray: [PhotoData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoManager.delegate = self
        photoManager.performRequest()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "PhotoCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")

    }

    //MARK: - Data Manipulation Method
    
    func takeAllPhotos(photos: [PhotoData]) {
        
        for item in 0..<50 {
            if (photos[item].id % 2 == 0) {
                photoPairArray.append(photos[item])
            }
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }

}

//MARK: - TableView Datasource Methods

extension PhotoListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photoPairArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! PhotoCell
        
        cell.idLabel.text = String(photoPairArray[indexPath.row].id)
        cell.titleLabel.text = photoPairArray[indexPath.row].title
        
        return cell
        
    }
    
}

//MARK: - TableView Delegate Methods

extension PhotoListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
