//
//  imageData.swift
//  dem
//
//  Created by Soumik Mukherjee on 28/02/20.
//  Copyright © 2020 Soumik Mukherjee. All rights reserved.
//

import Foundation
struct lvl1Brain{
    let data = [
        lvl(systemWord: "RING", imageWord: "Ring.jpg"),
        lvl(systemWord: "FISH", imageWord: "Fish.jpg"),
        lvl(systemWord: "TREE", imageWord: "tree.jpg"),
        lvl(systemWord: "STAR", imageWord: "star.jpg"),
        lvl(systemWord: "DUCK", imageWord: "duck.jpg"),
        lvl(systemWord: "LION", imageWord: "lion.jpg"),
        lvl(systemWord: "CAKE", imageWord: "cake.jpg"),
        lvl(systemWord: "MOON", imageWord: "moon.jpg"),
        lvl(systemWord: "ROCK", imageWord: "rock.jpg"),
        lvl(systemWord: "ROSE", imageWord: "rose.jpg")
    ]
    func retWord(j:Int)-> String{
        return data[j].systemWord
    }
    func retImage(j:Int)-> String{
        return data[j].imageWord
    }
}
