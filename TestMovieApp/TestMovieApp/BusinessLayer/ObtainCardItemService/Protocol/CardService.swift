//
//  CardService.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 04.04.2024.
//

import Foundation
import ServiceCore
import TCANetworkReducers

// MARK: - Aliases

public typealias CardServiceError = NSError

// MARK: - CardServiceAction

public enum CardServiceAction: Equatable {
    
    // MARK: - Cases
    case cardInfoCacheObtained([CardPlainObject]?)
}

// MARK: - CardService

public protocol CardService {
}
