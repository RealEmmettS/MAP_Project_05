//
//  UnderTheHoodCode.swift
//  TicTacToe
//
//  Created by Emmett Shaughnessy on 9/14/21.
//

import Foundation
import UIKit

enum Player {
    case x, o
}


struct gameBoard{
    var topLeft         : Player?
    var topMiddle       : Player?
    var topRight        : Player?
    var middleLeft      : Player?
    var middleMiddle    : Player?
    var middleRight     : Player?
    var bottomLeft      : Player?
    var bottomMiddle    : Player?
    var bottomRight     : Player?
}



let winningCombinations = [ [1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [7, 5, 3] ]

var xArray = [Int]()
var oArray = [Int]()
var totalArray = [Int]()



enum Winner{
    case x, o
}













//For the TicTacToe Buttons (the code below gives more option in Xcode Storyboard interface
//https://spin.atomicobject.com/2017/07/18/swift-interface-builder/
extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }

    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}
