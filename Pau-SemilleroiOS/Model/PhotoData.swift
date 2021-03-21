//
//  PhotoData.swift
//  Pau-SemilleroiOS
//
//  Created by Paula Montero on 20/03/2021.
//

import Foundation

struct PhotoData: Decodable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
