//
//  QuestionView.swift
//  OpenQuizz
//
//  Created by Mallah on 23/10/2019.
//  Copyright © 2019 MallahTaher. All rights reserved.
//

import UIKit

class QuestionView: UIView {  // to simplify the use of the view // Vue customisée
    @IBOutlet private var label : UILabel!  // Au départ optional? car valeur de la var inconnue puis optional! (car val != nil)
    @IBOutlet private var icon : UIImageView! // @IBOutlet car connexion possible
    
    enum Style{
        case correct, incorrect, standard
    }
    
    var style : Style = .standard{
        didSet{
            setStyle(style)
        }
    }
    
    private func setStyle(_ style: Style){
        switch style{
        case .correct:
            backgroundColor = UIColor(red: 200/255.0, green: 236/255.0, blue: 160/255.0, alpha: 1)
            icon.image = UIImage(named: "Icon Correct")
            icon.isHidden = false // ne cache pas l'image
        case .incorrect:
            backgroundColor = #colorLiteral(red: 0.9527311921, green: 0.5274838805, blue: 0.578542769, alpha: 1)
            icon.image = UIImage(named: "Icon Error")
            icon.isHidden = false
        case .standard:
            backgroundColor = #colorLiteral(red: 0.7496616244, green: 0.769112289, blue: 0.7860391736, alpha: 1)
            icon.isHidden = true
        }
    }
    
    var title = "" {
        didSet{
            label.text = title
        }
    }
    
    
}
