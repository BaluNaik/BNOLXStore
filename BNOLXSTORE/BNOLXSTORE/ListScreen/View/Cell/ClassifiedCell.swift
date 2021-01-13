//
//  ClassifiedCell.swift
//  BNOLXSTORE
//
//  Created by Balu Naik on 1/13/21.
//

import UIKit
import BTCacheManager

class ClassifiedCell: UITableViewCell {
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var priceLable: UILabel!
    @IBOutlet weak var loadIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        thumbnailImage.layer.masksToBounds = false
        thumbnailImage.layer.cornerRadius = 4.0
        thumbnailImage.clipsToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.thumbnailImage.image = UIImage(named: "dubizzle_logo")
    }
    
    func configCell(data: ClassifiedData) {
        loadIndicator.startAnimating()
        self.nameLable.text = data.name?.capitalized
        self.priceLable.text = data.price
        if let imageIds = data.imageIds,
           let firstObj = imageIds.first {
            let imageKey =  "\(firstObj)-thumbnail" as NSString
            if let cachedImage = BTCacheManager.shared.getCachedImage(for: imageKey) {
                self.thumbnailImage.image = cachedImage
                loadIndicator.stopAnimating()
            } else if let thumbnailsUrls = data.thumbnailsUrls,
                      let firstObj = thumbnailsUrls.first,
                      let imageUrl = URL(string: firstObj) {
                BTCacheManager.shared.loadImage(key: "\(imageKey)", imageUrl: imageUrl, saveInCache: true) {[weak self] (image) in
                    if let image = image {
                        self?.thumbnailImage.image = image
                    }
                    self?.loadIndicator.stopAnimating()
                }
            }
        }
    }
    
}
