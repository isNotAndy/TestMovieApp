//
//  CardListAction.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 29.03.2024.
//

import Foundation

public enum CardListAction: Equatable {
    
    // MARK: - Cases
    
    /// An action that triggers an update to the list's items.
    case onAppear
    
    ///
    case deleteItemTapped
    
    ///
    case item(id: CardItemState.ID, action: CardItemAction)
}
