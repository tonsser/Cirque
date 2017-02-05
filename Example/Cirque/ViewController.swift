//
//  ViewController.swift
//  Cirque
//
//  Created by philipengberg on 02/05/2017.
//  Copyright (c) 2017 philipengberg. All rights reserved.
//

import UIKit
import Cirque

enum RankingGroup : CirqueDataType {
    case match(value: Double)
    case achievements(value: Double)
    case votes(value: Double)
    
    var color : UIColor {
        switch self {
        case .match:        return UIColor(red: 0, green: 177/255.0, blue: 1, alpha: 1)
        case .achievements: return UIColor(red: 0, green: 1, blue: 200/255.0, alpha: 1)
        case .votes:        return UIColor(red: 249/255.0, green: 255/255.0, blue: 0, alpha: 1)
        }
    }
    
    var value : Double {
        switch self {
        case .match(let value):         return value
        case .achievements(let value):  return value
        case .votes(let value):         return value
        }
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        let size: CGFloat = 110
        let cirque = CirqueView(frame: CGRect(x: view.bounds.size.width / 2 - size / 2, y: 150, width: size, height: size))
        
        cirque.dataPoints = [RankingGroup.match(value: 0.3), RankingGroup.achievements(value: 0.2), RankingGroup.votes(value: 0.2)]
        
        view.addSubview(cirque)
    }

}

