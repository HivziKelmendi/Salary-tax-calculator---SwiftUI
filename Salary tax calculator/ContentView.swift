//
//  ContentView.swift
//  Salary tax calculator
//
//  Created by Hivzi on 1.9.22.
//

import SwiftUI

struct ContentView: View {
    @State private var paga = 0.0
    @State private var llojiIpages = "Bruto"
    @State private var punedhenesi = "Primar"
    @State private var kontribtiIPunetorit = 5.0
    @State private var kontribtiIPunedhenesit = 5.0
    @State private var pagaPrej80Deri250 = 0.0
    @State private var pagaPrej250Deri450 = 0.0
    @State private var pagaMbi450 = 0.0
    @State private var pagaNeto = 0.0
    @State private var pagaBruto = 0.0
    
    var kontributiIPunetoritInStringLabel: String {
        return String(format: "%.0f", kontribtiIPunetorit)
    }
    var kontributiIPunedhedhenesitInStringLabel: String {
        return String(format: "%.0f", kontribtiIPunedhenesit)
    }
    
    private var kalkulimiIKontributitIPunetorit: Double {
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
    
    private var kontributiIPunetoritString: String {
        return  String(format: "%.2f", kalkulimiIKontributitIPunetorit)
    }
    
    private var kontributiIPunedhenesitString: String {
        return  String(format: "%.2f", kalkulimiIKontributitIPunedhenesit)
    }
    
    private var pagaQeTatohetString: String {
        return  String(format: "%.2f", pagaQeTatohet)
    }
    
    private var gjithsejTatimString: String {
         return String(format: "%.2f", gjithsejTatim)
    }
    
    private var pagaString: String {
        return  String(format: "%.2f", paga)
    }
    
    private var kalkulimiIPagesNeto: String {
        var vleraEKalkuluar = pagaQeTatohet - gjithsejTatim
        let pagaNetoString = String(format: "%.2f", vleraEKalkuluar)
        return pagaNetoString
    }
    
    private var kalkulimiIPagesBruto: String {
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
    
    
    private var kalkulimiIKontributitIPunedhenesit: Double {
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
    
    private var pagaFillestareLabel: String {
        if llojiIpages == "Bruto" {
            return "Paga Bruto"
        } else {
            return "Paga Neto"
        }
    }
    private var pagaPerfundimtareLabel: String {
        if llojiIpages == "Bruto" {
            return "Paga Neto"
        } else {
            return "Paga Bruto"
        }
    }
    
    private var pagaPerfundimtare: String {
        if llojiIpages == "Bruto" {
            return kalkulimiIPagesNeto
        } else {
            return kalkulimiIPagesBruto
        }
    }
    
    private var pagaQeTatohet: Double {
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
                   print(pagaNeto)
                return vleraELlogaritur
                } else if paga >= 243.2 {
                   let  pagaNeto = ( paga/0.92 - 13.2/0.92)/(1 - kontribtiIPunetorit*0.01)
                   vleraELlogaritur = pagaNeto - kalkulimiIKontributitIPunetorit
                   print(pagaNeto)
                   return vleraELlogaritur
                }else if paga >= 80 {
                    let  pagaNeto = (paga/0.96 - 3.2/0.96)/(1 - kontribtiIPunetorit*0.01)
                    vleraELlogaritur = pagaNeto - kalkulimiIKontributitIPunetorit
                    print(pagaNeto)
                    return vleraELlogaritur
                    } else  {
                        let  pagaNeto = paga/(1 - kontribtiIPunetorit*0.01)
                        vleraELlogaritur = pagaNeto - kalkulimiIKontributitIPunetorit
                        print(pagaNeto)
                        return vleraELlogaritur
                        }
            } else {
                let  pagaNeto = paga/(0.9*(1 - kontribtiIPunetorit*0.01))
                vleraELlogaritur = pagaNeto - kalkulimiIKontributitIPunetorit
                print(pagaNeto)
                return vleraELlogaritur
            }
        }
    }
    
    private var gjithsejTatim: Double {
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
    
    private let llojetEPagave = ["Neto", "Bruto"]
    private  let llojiIPunedhenesit = ["Primar", "Sekondar"]

    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("paga", value: $paga, format: .currency(code: Locale.current.currencyCode ?? "EUR"))
                        .keyboardType(.decimalPad)
                    
                } header: {
                    Text("Shkruaje pagën")
                }
                
                Section {
                    Picker("Lloji i pagës:", selection: $llojiIpages) {
                        ForEach(llojetEPagave, id: \.self) {
                            Text($0)
                        }
                    }
                    Picker("Punëdhënësi:", selection: $punedhenesi) {
                        ForEach(llojiIPunedhenesit, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    Stepper ("Kontributi i punetorit          \(kontributiIPunetoritInStringLabel)%", value: $kontribtiIPunetorit,
                            in: 5...15,
                            step: 1)
                    
                    Stepper("Kontributi i punëdhënësit   \(kontributiIPunedhedhenesitInStringLabel)%", value: $kontribtiIPunedhenesit,
                            in: 5...15,
                            step: 1)
                }
                
                Section {
                    HStack {
                        Text("\(pagaFillestareLabel)")
                        Spacer()
                        Text("\(pagaString)€")
                    }
                    HStack {
                        Text("Kontributi i punetorit")
                        Spacer()
                        Text("\(kontributiIPunetoritString)€")
                    }
                    HStack {
                        Text("Kontributi i punëdhënënsit")
                        Spacer()
                        Text("\(kontributiIPunedhenesitString)€")
                    }
                    HStack {
                        Text("Paga që tatohet")
                        Spacer()
                        Text("\(pagaQeTatohetString)€")
                    }
                    
                    HStack {
                        Text("Gjithsej tatimi")
                        Spacer()
                        Text("\(gjithsejTatimString)€")
                    }
                    HStack {
                        Text("\(pagaPerfundimtareLabel)")
                        Spacer()
                        Text("\(pagaPerfundimtare)€")
                            .fontWeight(.bold)
                    }
                }
            }
            .navigationTitle("Kalkuatori i tatimit ne page")
            .navigationBarTitleDisplayMode(.inline)
            .lineSpacing(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
            
        }
        
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Double {
    func round(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return Darwin.round(self * divisor) / divisor
    }
}
