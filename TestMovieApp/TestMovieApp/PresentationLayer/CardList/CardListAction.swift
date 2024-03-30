//
//  CardListAction.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 29.03.2024.
//

import Foundation
import ComposableArchitecture

// MARK: - CardListAction

public enum CardListAction: Equatable, BindableAction {
    
    // MARK: - Cases
    
    /// An action that triggers an update to the list's items.
    case onAppear
    
    /// An action that triggers the deletion of one or more items from the list.
    case deleteItemTapped
    
    /// An action that triggers a specific action on a single item in the list.
    /// The `id` parameter specifies the unique identifier of the item,
    /// and the `action` parameter represents the specific action to be performed on the item.
    case item(id: CardItemState.ID, action: CardItemAction)
    
    /// Button was pressed
    case buttonPressed(String, String)
    
    // MARK: - Binding
    
    case binding(BindingAction<CardListState>)
}
