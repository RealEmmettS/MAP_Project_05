//
//  ViewController.swift
//  TicTacToe
//
//  Created by Emmett Shaughnessy on 9/14/21.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Variable / Outlet Setup
    @IBOutlet weak var currentPlayerLabel: UILabel!
    
    var ticTacToe:gameBoard = gameBoard()
    
    var currentPlayer : Player?{
        didSet{
            if currentPlayer != nil{
                currentPlayerLabel.text = "\(currentPlayer!)"
            }
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
    
    
    //MARK: Winner Actions
    var winner : Winner? {
        didSet{
            
            if winner != nil{
                
                let buttonList : [UIButton] = [topLeft, topMiddle, topRight, middleLeft, middleMiddle, middleRight, bottomLeft, bottomMiddle, bottomRight]
                
                for button in buttonList{
                    if button.isEnabled{
                        button.isEnabled = false
                    }
                    
                }//end of for loop
                
                currentPlayerLabel.text = "\(winner!)"
                currentPlayerLabel.textColor = UIColor(red: 0.30, green: 0.76, blue: 0.25, alpha: 1.00)
                
                restartGame(5)
                
            }
            
            
        }//end of didSet()
    }//end of winner variable
    
    //MARK: startGame()
    func startGame(){
        
        xArray = []
        oArray = []
        winner = nil
        currentPlayer = nil
        
        currentPlayerLabel.textColor = .black
        
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
        
        print("Starting Player: \(currentPlayer!)\n\n")
        
        
        
        let buttonList : [UIButton] = [topLeft, topMiddle, topRight, middleLeft, middleMiddle, middleRight, bottomLeft, bottomMiddle, bottomRight]
        
        for button in buttonList{
            button.setTitle("", for: .normal)
            button.isEnabled = true
            button.isHidden = false
            
        }
        
    }//End of startGame()
    
    
    
    //MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startGame()
        
        
    }//end of viewDidLoad()
    
    
    
    //MARK: restartGame()
    func restartGame(_ totalTime: Int = 10){
        
        print("Timer Started")
        var timeLeft = totalTime
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            print("Time Left: \(timeLeft)")
            timeLeft -= 1
            
            if timeLeft == 2{
                self.currentPlayerLabel.text = "..."
            }
            
            if timeLeft == 0 {
                //This code runs when the timer is up
                self.startGame()
                timer.invalidate()
            }
            
        }//End of Timer
    }//End of restartTimer
    
    
    
    //MARK: - nextPlayer()
    func nextPlayer() {
        switch currentPlayer {
        case .x:
            currentPlayer = .o
        case .o:
            currentPlayer = .x
        case .none:
            print("This should never happen, but currentPlayer is empty...")
        }//end of switch
    }//end of nextPlayer()
    
    
    
    
    //MARK: savePlayerTurn()
    func savePlayerTurn(placeOnBoard spot: Int){
        if currentPlayer == .x{
            xArray.append(spot)
            totalArray.append(spot)
            print("X was placed on spot \(spot)")
        }else{
            oArray.append(spot)
            totalArray.append(spot)
            print("O was placed on spot \(spot)")
        }
        
        print("Total Array updated with play from \(currentPlayer!)\n")
    }
    
    
    
    //MARK: checkForWin()
    /**
     Checks for a win from  currentPlayer. If there is a win, the game ends. If there is no winner or draw, nextPlayer() is called
     */
    func checkForWin(){
        
        if currentPlayer == .x{ //runs for player X
            
            for combo in winningCombinations {
                var matches = 0
                
                for spot in combo{
                    if xArray.contains(spot){
                        matches += 1
                    }
                }
                
                if matches == 3{
                    print("\n\nX wins!\n\n")
                    winner = .x
                }
                
                
            }//end of root For loop
            
        } else if currentPlayer == .o{ //runs for player O
            for combo in winningCombinations {
                var matches = 0
                
                for spot in combo{
                    if oArray.contains(spot){
                        matches += 1
                    }
                }
                
                if matches == 3{
                    print("\n\nO wins!\n\n")
                    winner = .o
                }
                
                
            }//end of root For loop
            
        }
        
        if (xArray.count + oArray.count >= 9) && winner == nil {
            //MARK: Draw / Tie Condition
            currentPlayerLabel.textColor = UIColor(red: 0.98, green: 0.33, blue: 0.33, alpha: 1.00)
            
            restartGame(5)
        }
        
        
        if winner == nil{
            nextPlayer()
        }
    }//end checkForWin()
    
    
    
    //MARK: - Button Functions
    @IBAction func topLeft(_ sender: Any) {
        ticTacToe.topLeft = currentPlayer
        topLeft.setTitle("\(currentPlayer!)", for: .normal)
        topLeft.isEnabled = false
        savePlayerTurn(placeOnBoard: 1)
        checkForWin()
    }
    
    @IBAction func topMiddle(_ sender: Any) {
        ticTacToe.topMiddle = currentPlayer
        topMiddle.setTitle("\(currentPlayer!)", for: .normal)
        topMiddle.isEnabled = false
        savePlayerTurn(placeOnBoard: 2)
        checkForWin()
    }
    
    @IBAction func topRight(_ sender: Any) {
        ticTacToe.topRight = currentPlayer
        topRight.setTitle("\(currentPlayer!)", for: .normal)
        topRight.isEnabled = false
        savePlayerTurn(placeOnBoard: 3)
        checkForWin()
    }
    
    @IBAction func middleLeft(_ sender: Any) {
        ticTacToe.middleLeft = currentPlayer
        middleLeft.setTitle("\(currentPlayer!)", for: .normal)
        middleLeft.isEnabled = false
        savePlayerTurn(placeOnBoard: 4)
        checkForWin()
    }
    
    @IBAction func middleMiddle(_ sender: Any) {
        ticTacToe.middleMiddle = currentPlayer
        middleMiddle.setTitle("\(currentPlayer!)", for: .normal)
        middleMiddle.isEnabled = false
        savePlayerTurn(placeOnBoard: 5)
        checkForWin()
    }
    
    @IBAction func middleRight(_ sender: Any) {
        ticTacToe.middleRight = currentPlayer
        middleRight.setTitle("\(currentPlayer!)", for: .normal)
        middleRight.isEnabled = false
        savePlayerTurn(placeOnBoard: 6)
        checkForWin()
    }
    
    @IBAction func bottomLeft(_ sender: Any) {
        ticTacToe.bottomLeft = currentPlayer
        bottomLeft.setTitle("\(currentPlayer!)", for: .normal)
        bottomLeft.isEnabled = false
        savePlayerTurn(placeOnBoard: 7)
        checkForWin()
    }
    
    @IBAction func bottomMiddle(_ sender: Any) {
        ticTacToe.bottomMiddle = currentPlayer
        bottomMiddle.setTitle("\(currentPlayer!)", for: .normal)
        bottomMiddle.isEnabled = false
        savePlayerTurn(placeOnBoard: 8)
        checkForWin()
    }
    
    @IBAction func bottomRight(_ sender: Any) {
        ticTacToe.bottomRight = currentPlayer
        bottomRight.setTitle("\(currentPlayer!)", for: .normal)
        bottomRight.isEnabled = false
        savePlayerTurn(placeOnBoard: 9)
        checkForWin()
    }
    
    
}

