//
//  Games.swift
//  football
//
//  Created by Pranav Gore on 20/06/15.
//  Copyright (c) 2015 Pranav Gore. All rights reserved.
//

import Foundation



struct MCQ {
    var imagePath: String
    var options: [String]
    var correctOptionIndex: Int
}

struct Game{
    var id: Int
    var name: String
    var questionString: String
    var data: [MCQ]
}


func generateMCQ()-> [MCQ]{
    var data = [MCQ]()
    var x = MCQ(imagePath: "juve", options: ["Juventus", "Real Madrid", "Arsenal", "Napoli"], correctOptionIndex: 0)
    data.append(x)
    x = MCQ(imagePath: "barca", options: ["FC Barcelona", "Milan", "Arsenal", "FC Barcelona"], correctOptionIndex: 0)
    data.append(x)
    x = MCQ(imagePath: "manu", options: ["Manchester United", "Real madrid", "Napoli", "FC Barcelona"], correctOptionIndex: 0)
    data.append(x)
    x = MCQ(imagePath: "real", options: ["Real Madrid", "Arsenal", "Borussia Dortmund", "FC Barcelona"], correctOptionIndex: 0)
    data.append(x)
    x = MCQ(imagePath: "chelsea", options: ["Chelsea", "Real madrid", "Arsenal", "Schalke 04"], correctOptionIndex: 0)
    data.append(x)
    return data
}




