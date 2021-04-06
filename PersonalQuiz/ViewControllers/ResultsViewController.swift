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

    override func viewDidLoad() {
        super.viewDidLoad()

        let resultType = Dictionary(grouping: answersChoosen, by: { $0.type })
            .sorted(by: { $0.value.count > $1.value.count })
            .first?.key
        
        if let resultType = resultType {
            titleLabel.text = "Вы - \(resultType.rawValue)"
            descriptionLabel.text = resultType.definition
        }
        
        navigationItem.hidesBackButton = true
    }

}
