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
        setupTabel()
        generateData()
    }
    
    private func setupTabel() {
        ibTableViewAnimals.dataSource = self
        ibTableViewAnimals.delegate = self
    }
    
    private func generateData(){
        animals.append(Animal(imageTitle: #imageLiteral(resourceName: "Aist_main"), imageInfo: #imageLiteral(resourceName: "Aist_Info"), name: "Аист белый", clas: "Птицы", family: "Аистовые", type: "Аисты"))
        animals.append(Animal(imageTitle: #imageLiteral(resourceName: "Albatros_main"), imageInfo: #imageLiteral(resourceName: "Albatros_info"), name: "Альбатрос", clas: "Птицы", family: "Альбатросовые", type: "Альбатросы"))
        animals.append(Animal(imageTitle: #imageLiteral(resourceName: "Kolibri_main"), imageInfo: #imageLiteral(resourceName: "Kolibri_info"), name: "Колибри", clas: "Птицы", family: "Колибриобразные", type: "Колибри"))
        animals.append(Animal(imageTitle: #imageLiteral(resourceName: "karp_main"), imageInfo: #imageLiteral(resourceName: "karP_info"), name: "Карп", clas: "Лучепёрые рыбы", family: "Карповые", type: "Карпы"))
        animals.append(Animal(imageTitle: #imageLiteral(resourceName: "som_main"), imageInfo: #imageLiteral(resourceName: "some_info"), name: "Сом", clas: "Лучепёрые рыбы", family: "Сомовые", type: "Сомы"))
        animals.append(Animal(imageTitle: #imageLiteral(resourceName: "shmel_main"), imageInfo: #imageLiteral(resourceName: "shmel_info"), name: "Шмель", clas: "Насекомые", family: "Пчёлы настоящие", type: "Шмели"))
        animals.append(Animal(imageTitle: #imageLiteral(resourceName: "lev_main"), imageInfo: #imageLiteral(resourceName: "lev_info"), name: "Лев", clas: "Млекопитающие" , family: "Кошачьи", type: "Пантеры"))
        animals.append(Animal(imageTitle: #imageLiteral(resourceName: "zac_main"), imageInfo: #imageLiteral(resourceName: "zac_info"), name: "3аяц", clas: "Млекопитающие", family: "Зайцевые", type: " "))
        animals.append(Animal(imageTitle: #imageLiteral(resourceName: "bear_main"), imageInfo: #imageLiteral(resourceName: "Bear_info"), name: "Бурый медведь", clas: "Млекопитающие", family: "Медвежьи", type: "Медведи"))
        
        for animal  in animals {
            var newAnimal = datasource[animal.clas] ?? []
            newAnimal.append(animal)
            datasource[animal.clas] = newAnimal
        }
        keysAnimal = Array(datasource.keys)
    }
    
    private func getAnimal(for indexPath: IndexPath) -> Animal? {
        let key = keysAnimal[indexPath.section]
        let animalForSectiom = datasource[key]
        return animalForSectiom?[indexPath.row]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ViewInfoAnimal",
            let destVC = segue.destination as? InfoViewController else { return }
        guard let cell = sender as? UITableViewCell else { return }
        guard let indexPath = ibTableViewAnimals.indexPath(for: cell) else { return }
        guard let item = getAnimal(for: indexPath) else { return }
        destVC.animalInfo = item
    }
    
}

extension TableViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return datasource.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = keysAnimal[section]
        let animalForSection = datasource[key] ?? []
        return animalForSection.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return keysAnimal[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tcAnimalCell", for: indexPath) as? AnimalTableViewCell else {
            print("Error")
            fatalError("Error: Type call error")
        }
        guard let item = getAnimal(for: indexPath) else {
            fatalError("Error: Error inex Path")
        }
        cell.update(image: item.imageTitle, name: item.name)
        return cell
    }
    
}
