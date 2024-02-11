//
//  Modifiers.swift
//  TestTask
//
//  Created by Misha Vrana on 11.02.2024.
//

import Foundation
import SwiftUI

struct StrokedButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(height: 56)
            .frame(maxWidth: .infinity)
            .background(
                ZStack() {
                    RoundedRectangle(cornerRadius: 18)
                        .fill(Color.blue)
                    RoundedRectangle(cornerRadius: 18)
                        .stroke(Color.indigo, lineWidth: 3)
                }
            )
            .foregroundColor(.white)
    }
}

extension View {
    func strokedButton() -> some View {
        modifier(StrokedButton())
    }
}
