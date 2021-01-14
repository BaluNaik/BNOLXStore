//
//  ImageCollectionViewCell.swift
//  BNOLXSTORE
//
//  Created by Balu Naik on 1/14/21.
//

import UIKit
import BTCacheManager

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        productImageView.layer.masksToBounds = false
        productImageView.layer.cornerRadius = 1.0
        productImageView.clipsToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.productImageView.image = UIImage(named: "dubizzle_logo")
    }
    
    func configCell(imageKey: String, url:URL) {
        loader.startAnimating()
        let key = imageKey as NSString
        if let cachedImage = BTCacheManager.shared.getCachedImage(for: key) {
            self.productImageView.image = cachedImage
            loader.stopAnimating()
        } else {
            BTCacheManager.shared.loadImage(key: key as String, imageUrl: url, saveInCache: true) {[weak self] (image) in
                if let image = image {
                    self?.productImageView.image = image
                }
                self?.loader.stopAnimating()
            }
        }
    }
    
}
