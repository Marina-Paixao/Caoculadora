//  Porte.swift
//  Caoculadora-xcodeArquivo
//
//  Created by Marina Meirelles Paixão on 13/05/24.

import Foundation

enum Porte: String, CaseIterable {
    case pequeno = "Pequeno"
    case médio = "Médio"
    case grande = "Grande"
    
    func calcularIdade(deAnos anosCaninos: Int,
                       eMeses mesesCaninos: Int) -> Int {
    
        // o resultado vai ser os anos * multiplicador + a fração do ano em meses * 7
        //multiplicador:
        // * pequeno: 6
        // * médio: 7
        // * grande: 8
        
        let multiplicador: Int
        
        switch self {
        case .pequeno:
            multiplicador = 6
        case .médio:
            multiplicador = 7
        case .grande:
            multiplicador = 8
        }
        
//        Picker("Portes", selection: $porteSelecionado)
//        {
//            ForEach(portes, id:\.self) {porte in Text(porte)
//        let multiplicador: Int
//        switch porteSelecionado {
//        case "Pequeno":
//            multiplicador = 6
//        case "Médio":
//            multiplicador = 7
//        case "Grande":
//            multiplicador = 8
//        default:
//            multiplicador = 0
        
        let result = anosCaninos * multiplicador + mesesCaninos * multiplicador/12
        return result
    }
        
    }

