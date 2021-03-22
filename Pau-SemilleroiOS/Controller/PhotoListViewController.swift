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
    
    var evenIdPhotoArray: [PhotoData] = []
    var position: Int = 0
    
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
        
        for item in 0..<photos.count {
            if (photos[item].id % 2 == 0) {
                evenIdPhotoArray.append(photos[item])
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
        return evenIdPhotoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! PhotoCell
        
        cell.idLabel.text = String(evenIdPhotoArray[indexPath.row].id)
        cell.titleLabel.text = evenIdPhotoArray[indexPath.row].title
        
        return cell
        
    }
    
}

//MARK: - TableView Delegate Methods

extension PhotoListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        position = indexPath.row
        performSegue(withIdentifier: "goToDetail", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetail" {
            let destinationVC = segue.destination as! DetailViewController
            destinationVC.photo = String(evenIdPhotoArray[position].id)
            destinationVC.album = String(evenIdPhotoArray[position].albumId)
            destinationVC.titlee = evenIdPhotoArray[position].title
            destinationVC.urlString = evenIdPhotoArray[position].url
            destinationVC.thumbnail = evenIdPhotoArray[position].thumbnailUrl
            destinationVC.urlK = URL(string: evenIdPhotoArray[position].url)
            
        }
    }
    
}
