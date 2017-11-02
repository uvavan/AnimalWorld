//
//  infoViewController.swift
//  Animals
//
//  Created by Admin on 02.11.17.
//  Copyright © 2017 Bioprom. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var ibImageViweAnimal: UIImageView!
    @IBOutlet weak var ibLabelClass: UILabel!
    @IBOutlet weak var ibLabelFamily: UILabel!
    @IBOutlet weak var ibLabelType: UILabel!
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
