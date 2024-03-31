//
//  DeskListState.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 30.03.2024.
//

import Foundation
import ComposableArchitecture

// MARK: - DeskListState

public struct DeskListState: Equatable {
    
    // MARK: - Properties
    
    // MARK: - Children
    
    /// An array of items representing the data to be displayed in the interactive list.
    ///
    /// The `items` property is of type `IdentifiedArrayOf<DeskItemState>`, where `CardItemState` is a type
    /// describing the state of individual cells in the interactive list.
    public var items: IdentifiedArrayOf<DeskItemState> = []
    
    /// `CardListState` instance
    ///
    /// It's an instance of `cardList` submodule.
    /// We use it here to be able to integrate `cardList` feature into a current module logic.
    /// All necessary processing is placed inside current reducer. Also, if you change the state
    /// inside the `cardList` module all changes will be saved here.
    @PresentationState public var cardList: CardListState?
    
    // MARK: - Binding
    
    /// Title of desk
    @BindingState public var title: String = ""
}
