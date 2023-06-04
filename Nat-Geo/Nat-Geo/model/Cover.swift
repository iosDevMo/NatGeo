//
//  Cover.swift
//  Nat-Geo
//
//  Created by mohamdan on 04/06/2023.
//

import Foundation

struct Cover : Identifiable {
    var id : Int
    var coverName : String
    var thumbnail : String {
        return "thumb-" + coverName
    }
}
