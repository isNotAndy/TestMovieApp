//
//  View.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 25.03.2024.
//

import Foundation
import SwiftUI

// MARK: - View+Frame

extension View {
    
    /// An extension to simplify setting both width and height of a view to create a square frame.
    ///
    /// - Parameters:
    ///   - size: The size to be applied to both width and height of the view.
    /// - Returns: A view with equal width and height based on the provided size.
    public func frame(size: CGFloat) -> some View {
        self.frame(width: size, height: size)
    }
}
