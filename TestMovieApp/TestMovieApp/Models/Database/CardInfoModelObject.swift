//
//  CardInfoModelObject.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 29.03.2024.
//

import Foundation
import SDAO
import RealmSwift

// MARK: - CardInfoModelObject

public final class CardInfoModelObject: RealmModel {
    
    // MARK: - Properties
    
    /// ID of card
    @objc dynamic public var id = ""

    /// Title of card
    @objc dynamic public var frontTitle = ""

    /// Description of card
    @objc dynamic public var backTitle = ""
}
