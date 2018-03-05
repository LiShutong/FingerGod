//
//  SingleUnit.swift
//  FingerGod
//
//  Copyright © 2018年 Ramen Interactive. All rights reserved.
//

import UIKit

//unit 三种类型，people,follower,demigod
enum Character {
    case PEOPLE
    case FOLLOWER
    case DEMIGOD
}

class SingleUnit: NSObject {

    var HP: NSInteger! //hp值
    var character: Character? //该unit的类型的
}
