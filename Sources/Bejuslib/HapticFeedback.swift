//
//  File.swift
//  
//
//  Created by Julian Beck on 28.01.20.
//

import Foundation
import SwiftUI

class HapticFeedback {

    public enum FeedbackStyle {
        case success
        case selection
        case error
        case warning
        case impactSoft
        case impactLight
        case impactMedium
        case impactHeavy
        case impactRigid
    }
    
    static func play (_ type:FeedbackStyle){
        switch type {
        case .success:
            let generator = UINotificationFeedbackGenerator()
                            generator.notificationOccurred(.success)
        case .selection:
            #if os(watchOS)
            //watchOS implementation
                WKInterfaceDevice.current().play(.click)
            
            #else
            //iOS implementation
                UISelectionFeedbackGenerator().selectionChanged()
            #endif
        case .error:
            let generator = UINotificationFeedbackGenerator()
                       generator.notificationOccurred(.error)
        case .warning:
            let generator = UINotificationFeedbackGenerator()
                       generator.notificationOccurred(.warning)
        case .impactSoft:
            let generator = UIImpactFeedbackGenerator(style: .soft)
                      generator.impactOccurred()
        case .impactLight:
            let generator = UIImpactFeedbackGenerator(style: .light)
                      generator.impactOccurred()
        case .impactMedium:
            let generator = UIImpactFeedbackGenerator(style: .medium)
                      generator.impactOccurred()
        case .impactHeavy:
            let generator = UIImpactFeedbackGenerator(style: .heavy)
                      generator.impactOccurred()
        case .impactRigid:
            let generator = UIImpactFeedbackGenerator(style: .rigid)
                      generator.impactOccurred()
        }
    }
}
