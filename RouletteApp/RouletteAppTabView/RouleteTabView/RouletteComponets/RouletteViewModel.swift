//
//  RouletteViewModel.swift
//  RouletteApp
//
//  Created by Igor Kononov on 17.08.2023.
//

import SwiftUI

class RouletteViewModel: ObservableObject {
    @Published var isAnimating = false
    @Published var spinDegrees = 0.0
    @Published var rand = 0.0
    @Published var newAngle = 0.0
    let halfSector = 360.0 / 37.0 / 2.0
    let sectors: [SectorModel] = SectorMeneger.shared.sectors
    
    var spinAnimation: Animation {
        Animation.easeOut(duration: 3.0)
            .repeatCount(1, autoreverses: false)
    }
    
    func doSpin() {
        isAnimating = true
        rand = Double.random(in: 1...360)
        spinDegrees += 720.0 + rand
        newAngle = getAngle(angle: spinDegrees)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.9) {
            self.isAnimating = false
        }
    }
    
    func sectorFromAngle() -> String {
        let angle = newAngle
        var i = 0
        var sector: SectorModel = SectorModel(number: -1, color: .empty, whichOfTwelveModel: nil, whichOfHalfModel: nil, whicOfEvenModel: nil, whichOfTwoInOne: nil)
        
        while sector == SectorModel(number: -1, color: .empty, whichOfTwelveModel: nil, whichOfHalfModel: nil, whicOfEvenModel: nil, whichOfTwoInOne: nil) && i < sectors.count {
            let start: Double = halfSector * Double((i*2 + 1)) - halfSector
            let end: Double = halfSector * Double((i*2 + 3))
            
            if(angle >= start && angle < end) {
                sector = sectors[i]
            }
            i+=1
        }
        return "Sector - \(sector.number) \(sector.color.rawValue)"
    }
    
    private func getAngle(angle: Double) -> Double {
         let deg = 360 - angle.truncatingRemainder(dividingBy: 360)
         return deg
     }
}
