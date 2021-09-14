//
//  UnderTheHoodCode.swift
//  TicTacToe
//
//  Created by Emmett Shaughnessy on 9/14/21.
//

import Foundation

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
