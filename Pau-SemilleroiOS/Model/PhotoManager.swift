//
//  PhotoManager.swift
//  Pau-SemilleroiOS
//
//  Created by Paula Montero on 20/03/2021.
//

import Foundation

protocol PhotoManagerDelegate {
    func takeAllPhotos(photos: [PhotoData])
    }


struct PhotoManager {
    let photoURL = "https://jsonplaceholder.typicode.com/photos"

    var delegate: PhotoManagerDelegate?
        
     func performRequest() {
        
        if let url = URL(string: photoURL) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    if let photos = parseJSON(photoData: safeData) {
                        
                        delegate?.takeAllPhotos(photos: photos)
                        
                    }
                }
                
            }
            
            task.resume()
            
        }
        
    }
    
    func parseJSON(photoData: Data) -> [PhotoData]? {
        
        let decoder = JSONDecoder()
        
        do{
            let decodedData = try decoder.decode([PhotoData].self, from: photoData)
            return decodedData
            
        } catch {
            print(error)
            return nil
        }
        
    }
    
}
