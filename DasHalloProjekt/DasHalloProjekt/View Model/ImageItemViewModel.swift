//
//  ImageItemViewModel.swift
//  DasHalloProjekt
//
//  Created by Sharmin Khan on 26.10.20.
//

import Foundation
import UIKit

class ImageItemViewModel: ObservableObject {
    
    @Published var image: UIImage = UIImage()
    
    func getImage(url: NSURL, item: ImageItem) {
        ImageCache.publicCache.load(url: url, item: item) { (fetchedItem, image) in
            if let img = image, img != fetchedItem.image {
                self.image = img
            }
        }
    }
}
