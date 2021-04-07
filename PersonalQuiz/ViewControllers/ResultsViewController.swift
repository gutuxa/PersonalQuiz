//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 05.04.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результат в соответсвии с этим животным
    // 4. Избавиться от кнопки возврата назад на экране результатов
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var answersChoosen: [Answer]!
    
    private var resultAnimal: AnimalType?

    override func viewDidLoad() {
        super.viewDidLoad()

        findResultAnimal()
        setupUI()
    }
    
    private func setupUI() {
        if let resultAnimal = resultAnimal {
            titleLabel.text = "Вы - \(resultAnimal.rawValue)"
            descriptionLabel.text = resultAnimal.definition
        }
        
        navigationItem.hidesBackButton = true
    }
    
    private func findResultAnimal() {
        resultAnimal = Dictionary(grouping: answersChoosen, by: { $0.type })
            .sorted(by: { $0.value.count > $1.value.count })
            .first?.key
    }

}
