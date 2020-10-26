//
//  ImageItem.swift
//  DasHalloProjekt
//
//  Created by Sharmin Khan on 26.10.20.
//

import Foundation
import UIKit

enum Section {
    case main
}

class ImageItem: Hashable {
    
    var image: UIImage!
    let url: URL!
    let identifier = UUID()
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    static func == (lhs: ImageItem, rhs: ImageItem) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    init(image: UIImage, url: URL) {
        self.image = image
        self.url = url
    }

}
