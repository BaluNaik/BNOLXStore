//
//  DetailsTableViewCell.swift
//  BNOLXSTORE
//
//  Created by Balu Naik on 1/14/21.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @objc func updateUI(name: String, price: String, date: String) {
        self.nameLabel.text = name.capitalized
        self.priceLabel.text = price
        self.dateLabel.text = self.getFormattedDate(input: date)
    }
    
    private func getFormattedDate(input: String) -> String {
        let inputDateFormatter = DateFormatter()
        inputDateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss T"

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM,yyyy"

        let date: Date = inputDateFormatter.date(from: input) ?? Date()
        
        return dateFormatter.string(from: date)
    }

}
