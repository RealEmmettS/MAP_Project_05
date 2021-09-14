//
//  ViewController.swift
//  TicTacToe
//
//  Created by Emmett Shaughnessy on 9/14/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var currentPlayerLabel: UILabel!
    
    
    var currentPlayer : Player?{
        didSet{
            currentPlayerLabel.text = "\(currentPlayer!)"
        }
    }
    
    @IBOutlet weak var topLeft: UIButton!
    @IBOutlet weak var topMiddle: UIButton!
    @IBOutlet weak var topRight: UIButton!
    
    @IBOutlet weak var middleLeft: UIButton!
    @IBOutlet weak var middleMiddle: UIButton!
    @IBOutlet weak var middleRight: UIButton!
    
    @IBOutlet weak var bottomLeft: UIButton!
    @IBOutlet weak var bottomMiddle: UIButton!
    @IBOutlet weak var bottomRight: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let randomInt = Int.random(in: 1...1000)
        var even:Bool = false
        if randomInt % 2 == 0{
            even = true
        }else{
            even = false
        }
        
        switch even{
        case true:
            currentPlayer = .x
        case false:
            currentPlayer = .o
        }
        
        print("Starting Player: \(currentPlayer!)")
        
        
        
        let buttonList : [UIButton] = [topLeft, topMiddle, topRight, middleLeft, middleMiddle, middleRight, bottomLeft, bottomMiddle, bottomRight]

        var count = 1
        for button in buttonList{
            button.setTitle("", for: .normal)
            button.tag = count
            count += 1
        }
        
    }//end of viewDidLoad()
    
    func nextPlayer() {
        switch currentPlayer {
        case .x:
            currentPlayer = .o
        case .o:
            currentPlayer = .x
        case .none:
            print("This should never happen. currentPlayer is empty...")
        }//end of switch
    }//end of nextPlayer()
    
    
    
    
    
    
    


}

