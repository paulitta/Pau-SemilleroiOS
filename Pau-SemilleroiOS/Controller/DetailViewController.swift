//
//  DetailViewController.swift
//  Pau-SemilleroiOS
//
//  Created by Paula Montero on 19/03/2021.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {

    @IBOutlet weak var photoIdLabel: UILabel!
    @IBOutlet weak var albumIdLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var thumbnailUrlLabel: UILabel!
    @IBOutlet weak var urlImageView: UIImageView!
    
    var photo: String?
    var album: String?
    var titlee: String?
    var urlString: String?
    var thumbnail: String?
    var urlK: URL?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        photoIdLabel.text = photo
        albumIdLabel.text = album
        titleLabel.text = titlee
        urlLabel.text = urlString
        thumbnailUrlLabel.text = thumbnail
        urlImageView.kf.setImage(with: urlK)
        
    }


}
