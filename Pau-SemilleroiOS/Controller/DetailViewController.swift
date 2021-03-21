//
//  DetailViewController.swift
//  Pau-SemilleroiOS
//
//  Created by Paula Montero on 19/03/2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var photoIdLabel: UILabel!
    @IBOutlet weak var albumIdLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var thumbnailUrlLabel: UILabel!
    
    var photo: String?
    var album: String?
    var titlee: String?
    var url: String?
    var thumbnail: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        photoIdLabel.text = photo
        albumIdLabel.text = album
        titleLabel.text = titlee
        urlLabel.text = url
        thumbnailUrlLabel.text = thumbnail
        
    }


}
