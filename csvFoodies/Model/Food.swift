//
//  Food.swift
//  csvFoodies
//
//  Created by Soulchild on 05/08/2019.
//  Copyright © 2019 fluffy. All rights reserved.
//

import Foundation
import RealmSwift

class Food : Object {
    @objc dynamic var name = ""
    @objc dynamic var price = 0
}