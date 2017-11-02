//
//  TableViewControllViewController.swift
//  Animals
//
//  Created by Admin on 02.11.17.
//  Copyright © 2017 Bioprom. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    @IBOutlet private weak var ibTableViewAnimals: UITableView!
    
    private var datasource: [String : [Animal]] = [:]
    private var animals: [Animal] = []
    private var keysAnimal: [String] = []
    
    override func viewDidLoad(){
        super.viewDidLoad()
        title = "В мире животных"
        ibTableViewAnimals.dataSource = self
        ibTableViewAnimals.delegate = self
    }
    
    func generateData(){
//        animals.append(Animal(image: <#T##UIImage#>, title: "Аист", clas: "Птицы", family: "Аистовые", type: "Аисты"))
    }

}

extension TableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = ibTableViewAnimals.dequeueReusableCell(withIdentifier: "AnimalCell") as? AnimalTableViewCell else {
            fatalError("Error: Type call error")
        }
        return cell
    }
    
}
