//
//  DogTableViewCell.swift
//  foodtrackerapp
//
//  Created by Gwendolyn Howes on 09/02/2020.
//  Copyright © 2020 Gwendolyn Howes. All rights reserved.
//

import UIKit

class DogTableViewCell: UITableViewCell {
    //MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
