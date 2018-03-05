//
//  UnitGroup.swift
//  FingerGod
//
//  Copyright © 2018年 Ramen Interactive. All rights reserved.
//

import UIKit

class UnitGroup: NSObject {
    var peopleArray:NSMutableArray?
    var followerArray:NSMutableArray?
    var demiGodArray:NSMutableArray?

    //初始化unitGroup
    func initUnitGroupWith(peopleNum: NSInteger, followerNum :NSInteger, demiGodNum :NSInteger) -> UnitGroup {
        let unitGroup = UnitGroup.init()
        for var i in 0...peopleNum {
            let singleUnit = SingleUnit.init()
            singleUnit.character = Character.PEOPLE
            unitGroup.peopleArray?.add(singleUnit)
        }
        for var i in 0...followerNum {
            let singleUnit = SingleUnit.init()
            singleUnit.character = Character.FOLLOWER
            unitGroup.followerArray?.add(singleUnit)
        }
        for var i in 0...demiGodNum {
            let singleUnit = SingleUnit.init()
            singleUnit.character = Character.DEMIGOD
            unitGroup.demiGodArray?.add(singleUnit)
        }
        return unitGroup
    }

    //攻击完成后根据hp值删减人口，demygod如果死亡，返回死亡的数量，以用于敌方demigod数量的增加
    func removeUnitNum() -> NSInteger{
        var num:NSInteger = (self.peopleArray?.count)!
        for m in 0...num - 1  {
            let singleUnit: SingleUnit = self.peopleArray![m] as! SingleUnit
            if singleUnit.HP <= 0 {
                self.peopleArray?.removeObject(at: m)
            }
        }
        num = (self.followerArray?.count)!
        for m in 0...num - 1  {
            let singleUnit: SingleUnit = self.followerArray![m] as! SingleUnit
            if singleUnit.HP <= 0 {
                self.peopleArray?.removeObject(at: m)
            }
        }
        num = (self.demiGodArray?.count)!
        var deathDemyGodNum = 0
        for m in 0...num - 1  {
            let singleUnit: SingleUnit = self.demiGodArray![m] as! SingleUnit
            if singleUnit.HP <= 0 {
                self.peopleArray?.removeObject(at: m)
                deathDemyGodNum = deathDemyGodNum + 1
            }
        }
        return deathDemyGodNum
    }


}
