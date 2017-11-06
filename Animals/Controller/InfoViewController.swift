//
//  infoViewController.swift
//  Animals
//
//  Created by Admin on 02.11.17.
//  Copyright © 2017 Bioprom. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    @IBOutlet private weak var ibImageViweAnimal: UIImageView!
    @IBOutlet private weak var ibLabelClass: UILabel!
    @IBOutlet private weak var ibLabelFamily: UILabel!
    @IBOutlet private weak var ibLabelType: UILabel!
    var animalInfo: Animal?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = animalInfo?.name
        ibImageViweAnimal.image = animalInfo?.imageInfo
        ibLabelClass.text = animalInfo?.clas
        ibLabelType.text = animalInfo?.type
        ibLabelFamily.text = animalInfo?.family
    }

}
