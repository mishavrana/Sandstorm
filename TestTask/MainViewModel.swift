//
//  ViewMocel.swift
//  TestTask
//
//  Created by Misha Vrana on 11.02.2024.
//

import Foundation
import SwiftUI

final class MainViewModel: ObservableObject {
    @Published private(set) var isShowingFullImage = false
    @Published private(set) var isLocked = false
    
    func openFromTop() {
        withAnimation {
            isShowingFullImage = true
        }
    }
    
    func closeFullImage() {
        withAnimation {
            isShowingFullImage = false
        }
    }
    
    func lockShowTopButton() {
        isLocked = true
    }
    
    func unlockShowTopButton() {
        isLocked = false
    }
}
