//
//  AppConstants.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 05.04.2024.
//

import Foundation

// MARK: - Constants

public enum AppConstants {
    
    // MARK: - Pagination
    
    public enum Pagination {
        static let pageSize = 20
    }
    
    // MARK: - Network
    
    public enum Network {
        static let apiURL = URL(string: "http://thisIsNotLink.com").unsafelyUnwrapped
    }
}
