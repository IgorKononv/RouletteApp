//
//  RouletteViewModel.swift
//  RouletteApp
//
//  Created by Igor Kononov on 17.08.2023.
//

import SwiftUI

class RouletteViewModel: ObservableObject {
    
    @Published var spinDegrees = 0.0
    @Published var rand = 0.0
    @Published var newAngle = 0.0
    let halfSector = 360.0 / 37.0 / 2.0
    let sectors: [SectorModel] = SectorMeneger.shared.sectors
    
    func doSpin() {
        let wheelSpeed = 2000.0
        
        InfoBoardMenager.shared.isAnimating = true
        withAnimation(.easeOut(duration: 3.0)) {
            rand = Double.random(in: 1...360)
            spinDegrees += wheelSpeed + rand
            newAngle = getAngle(angle: spinDegrees)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.9) {
            self.sectorFromAngle()
        }
    }
    
    func sectorFromAngle() {
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
        DispatchQueue.main.async {
            InfoBoardMenager.shared.currentSector = sector
            InfoBoardMenager.shared.isAnimating = false
        }
    }
    
    private func getAngle(angle: Double) -> Double {
         let deg = 360 - angle.truncatingRemainder(dividingBy: 360)
         return deg
     }
}
