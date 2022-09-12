//
//  File.swift
//  Salary tax calculator
//
//  Created by Hivzi on 5.9.22.
//
import SwiftUI
import Foundation

struct Calculator {
    var  paga = 0.0
    var llojiIpages = "Bruto"
    var punedhenesi = "Primar"
    var kontribtiIPunetorit = 5.0
    var kontribtiIPunedhenesit = 5.0
     

    var kontributiIPunetoritInStringLabel: String {
        return String(format: "%.0f", kontribtiIPunetorit)
    }
    
    var kontributiIPunedhedhenesitInStringLabel: String {
        return String(format: "%.0f", kontribtiIPunedhenesit)
    }
    
    var kalkulimiIKontributitIPunetorit: Double {
        
        var vleraELlogaritur = 0.0
        
        if llojiIpages == "Bruto" {
            vleraELlogaritur = paga*kontribtiIPunetorit*0.01
            return vleraELlogaritur
        }
        else {
            if punedhenesi == "Primar" {
                if paga >= 427.2 {
                    let  pagaNeto = (10/9 * paga - 222/9)/(1 - kontribtiIPunetorit*0.01)
                    vleraELlogaritur = pagaNeto*kontribtiIPunetorit*0.01
                    return vleraELlogaritur
                } else if paga >= 243.2 {
                    let pagaNeto = ( paga/0.92 - 13.2/0.92)/(1 - kontribtiIPunetorit*0.01)
                    vleraELlogaritur = pagaNeto*kontribtiIPunetorit*0.01
                    return vleraELlogaritur
                } else if paga >= 80 {
                    let pagaNeto = ( paga/0.96 - 3.2/0.96)/(1 - kontribtiIPunetorit*0.01)
                    vleraELlogaritur = pagaNeto*kontribtiIPunetorit*0.01
                    return vleraELlogaritur
                } else  {
                    let pagaNeto = paga/(1 - kontribtiIPunetorit*0.01)
                    vleraELlogaritur = pagaNeto*kontribtiIPunetorit*0.01
                    return vleraELlogaritur
                }
            } else {
                let  pagaNeto = paga/(0.9*(1 - kontribtiIPunetorit*0.01))
                vleraELlogaritur = pagaNeto*kontribtiIPunetorit*0.01
                return vleraELlogaritur
            }
        }
    }
    
    var kontributiIPunetoritString: String {
        return  String(format: "%.2f", kalkulimiIKontributitIPunetorit)
    }
    
    var kontributiIPunedhenesitString: String {
        return  String(format: "%.2f", kalkulimiIKontributitIPunedhenesit)
    }
    
    var pagaQeTatohetString: String {
        return  String(format: "%.2f", pagaQeTatohet)
    }
    
    var gjithsejTatimString: String {
        return String(format: "%.2f", gjithsejTatim)
    }
    
    var pagaString: String {
        return  String(format: "%.2f", paga)
    }
    
    var kalkulimiIPagesNeto: String {
        let vleraEKalkuluar = pagaQeTatohet - gjithsejTatim
        let pagaNetoString = String(format: "%.2f", vleraEKalkuluar)
        return pagaNetoString
    }
    
    var kalkulimiIPagesBruto: String {
        var vleraEkalkuluar = 0.0
        if punedhenesi == "Primar" {
            if paga >= 427.2 {
                vleraEkalkuluar = (10/9 * paga - 222/9) / (1 - kontribtiIPunetorit*0.01)
                let vleraString = String(format: "%.2f", vleraEkalkuluar )
                return vleraString
            } else if paga >= 243.2 {
                vleraEkalkuluar = ( paga/0.92 - 13.2/0.92)/(1 - kontribtiIPunetorit*0.01)
                let vleraString = String(format: "%.2f", vleraEkalkuluar )
                return vleraString
            } else if paga >= 80 {
                vleraEkalkuluar = ( paga/0.96 - 3.2/0.96)/(1 - kontribtiIPunetorit*0.01)
                let vleraString = String(format: "%.2f", vleraEkalkuluar )
                return vleraString
            } else {
                vleraEkalkuluar = paga/(1 - kontribtiIPunetorit*0.01)
                let vleraString = String(format: "%.2f", vleraEkalkuluar )
                return vleraString
            }
        } else {
            vleraEkalkuluar = paga/(0.9*(1 - kontribtiIPunetorit*0.01))
            let vleraString = String(format: "%.2f", vleraEkalkuluar )
            return vleraString
        }
    }
    
    
    var kalkulimiIKontributitIPunedhenesit: Double {
        var vleraELlogaritur = 0.0
        if llojiIpages == "Bruto" {
            vleraELlogaritur = paga*kontribtiIPunedhenesit*0.01
            return vleraELlogaritur
        }
        else {
            if punedhenesi == "Primar" {
                if paga >= 427.2 {
                    let  pagaNeto = (10/9 * paga - 222/9)/(1 - kontribtiIPunedhenesit*0.01)
                    vleraELlogaritur = pagaNeto*kontribtiIPunedhenesit*0.01
                    return vleraELlogaritur
                } else if paga >= 243.2 {
                    let pagaNeto = ( paga/0.92 - 13.2/0.92)/(1 - kontribtiIPunedhenesit*0.01)
                    vleraELlogaritur = pagaNeto*kontribtiIPunedhenesit*0.01
                    return vleraELlogaritur
                } else if paga >= 80 {
                    let pagaNeto = ( paga/0.96 - 3.2/0.96)/(1 - kontribtiIPunedhenesit*0.01)
                    vleraELlogaritur = pagaNeto*kontribtiIPunedhenesit*0.01
                    return vleraELlogaritur
                } else  {
                    let pagaNeto = paga/(1 - kontribtiIPunedhenesit*0.01)
                    vleraELlogaritur = pagaNeto*kontribtiIPunedhenesit*0.01
                    return vleraELlogaritur
                }
            } else {
                let  pagaNeto = paga/(0.9*(1 - kontribtiIPunedhenesit*0.01))
                vleraELlogaritur = pagaNeto*kontribtiIPunedhenesit*0.01
                return vleraELlogaritur
            }
        }
    }
    
    var pagaFillestareLabel: String {
        if llojiIpages == "Bruto" {
            return "Paga Bruto"
        } else {
            return "Paga Neto"
        }
    }
    var pagaPerfundimtareLabel: String {
        if llojiIpages == "Bruto" {
            return "Paga Neto"
        } else {
            return "Paga Bruto"
        }
    }
    
    var pagaPerfundimtare: String {
        if llojiIpages == "Bruto" {
            return kalkulimiIPagesNeto
        } else {
            return kalkulimiIPagesBruto
        }
    }
    
    var pagaQeTatohet: Double {
        var vleraELlogaritur = 0.0
        if llojiIpages == "Bruto" {
            vleraELlogaritur = paga - kalkulimiIKontributitIPunetorit
            return vleraELlogaritur
        }
        else   {
            if punedhenesi == "Primar" {
                if paga >= 427.2 {
                    let  pagaNeto = (10/9 * paga - 222/9)/(1 - kontribtiIPunetorit*0.01)
                    vleraELlogaritur = pagaNeto - kalkulimiIKontributitIPunetorit
                    
                    return vleraELlogaritur
                } else if paga >= 243.2 {
                    let  pagaNeto = ( paga/0.92 - 13.2/0.92)/(1 - kontribtiIPunetorit*0.01)
                    vleraELlogaritur = pagaNeto - kalkulimiIKontributitIPunetorit
                    return vleraELlogaritur
                }else if paga >= 80 {
                    let  pagaNeto = (paga/0.96 - 3.2/0.96)/(1 - kontribtiIPunetorit*0.01)
                    vleraELlogaritur = pagaNeto - kalkulimiIKontributitIPunetorit
                    return vleraELlogaritur
                } else  {
                    let  pagaNeto = paga/(1 - kontribtiIPunetorit*0.01)
                    vleraELlogaritur = pagaNeto - kalkulimiIKontributitIPunetorit
                    return vleraELlogaritur
                }
            } else {
                let  pagaNeto = paga/(0.9*(1 - kontribtiIPunetorit*0.01))
                vleraELlogaritur = pagaNeto - kalkulimiIKontributitIPunetorit
                return vleraELlogaritur
            }
        }
    }
    
    var gjithsejTatim: Double {
        var vleraELlogaritur = 0.0
        if llojiIpages == "Bruto" {
            if punedhenesi == "Primar" {
                if pagaQeTatohet >= 450 {
                    vleraELlogaritur = (pagaQeTatohet - 450)*0.1 + 22.8
                    return vleraELlogaritur
                } else if pagaQeTatohet >= 250 {
                    vleraELlogaritur = (pagaQeTatohet -  250)*0.08 + 6.8
                } else if pagaQeTatohet >= 80 {
                    vleraELlogaritur = (pagaQeTatohet -  80)*0.04
                } else {
                    return 0
                }
            } else {
                vleraELlogaritur = pagaQeTatohet * 0.1
                return vleraELlogaritur
            }
            // paga neto
        } else {
            if punedhenesi == "Primar" {
                if paga >= 427.2 {
                    vleraELlogaritur =  (pagaQeTatohet - 450)*0.1 + 22.8
                    return vleraELlogaritur
                } else if paga >= 243.2 {
                    vleraELlogaritur = (pagaQeTatohet - 250)*0.08 + 6.8
                    return vleraELlogaritur
                } else if paga >= 80 {
                    vleraELlogaritur = (pagaQeTatohet - 80)*0.04
                    return vleraELlogaritur
                }else {
                    return 0
                }
            } else {
                return pagaQeTatohet * 0.1
            }
        }
        return vleraELlogaritur
    }
    
    let llojetEPagave = ["Neto", "Bruto"]
    let llojiIPunedhenesit = ["Primar", "Sekondar"]
    
}
