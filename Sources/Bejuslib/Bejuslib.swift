//
//  File.swift
//  
//
//  Created by Julian Beck on 31.01.20.
//

import Foundation
//
//  File.swift
//
//
//  Created by Julian Beck on 28.01.20.
//

import Foundation
import SwiftUI
#if os(iOS)
public extension Color {
    init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (r, g, b) = ((int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (r, g, b) = (int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (r, g, b) = (int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (r, g, b) = (0, 0, 0)
        }
        self.init(red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255)
    }
}


public class HapticFeedback {

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
    
    public static func play (_ type:FeedbackStyle){
        switch type {
        case .success:
            let generator = UINotificationFeedbackGenerator()
                            generator.notificationOccurred(.success)
        case .selection:
            //iOS implementation
                UISelectionFeedbackGenerator().selectionChanged()
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
#endif
