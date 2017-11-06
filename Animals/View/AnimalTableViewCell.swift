//
//  AnivalTableViewCell.swift
//  Animals
//
//  Created by Admin on 02.11.17.
//  Copyright © 2017 Bioprom. All rights reserved.
//

import UIKit

class AnimalTableViewCell: UITableViewCell {

    @IBOutlet private weak var ibImageAnimal: UIImageView!
    @IBOutlet private weak var ibLabelAnimal: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    func update (image: UIImage, name: String) {
        ibImageAnimal.image = image
        ibLabelAnimal.text = name
    }
}
