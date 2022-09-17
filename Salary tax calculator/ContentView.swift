//
//  ContentView.swift
//  Salary tax calculator
//
//  Created by Hivzi on 1.9.22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var calculator = Calculator()
    @FocusState private var pagaIsFocused: Bool
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField( "", text: $calculator.text)
                               
//                               format: .currency(code:  Locale.current.currencyCode ?? "EUR"))
                               
                        .keyboardType(.decimalPad)
                        .focused($pagaIsFocused)
                        .onChange(of: calculator.text) { newValue in
                            calculator.paga = Double(newValue) ?? 0.0
                        }
                        .showClearButton($calculator.text)
              }
                header: {
                    Text("Shkruaje pagën")
                }

                
                Section {
                    Picker("Lloji i pagës:", selection: $calculator.llojiIpages) {
                        ForEach(calculator.llojetEPagave, id: \.self) {
                            Text($0)
                        }
                    } .pickerStyle(.segmented)
                   
                } header: {
                    Text("Zgjidh llojin e pagës")
                }
                .padding(.trailing, -5.0)
                
                Section {
                    Picker("Punëdhënësi:", selection: $calculator.punedhenesi) {
                        ForEach(calculator.llojiIPunedhenesit, id: \.self) {
                            Text($0)
                        }
                    }
                }  header: {
                    Text("Zgjidh punëdhënësin")
                    }
                  .padding(.trailing, -5.0) .pickerStyle(.segmented)
                 
                
                
                Section {
                    Stepper ("Kontributi i punetorit           \(calculator.kontributiIPunetoritInStringLabel)%", value: $calculator.kontribtiIPunetorit,
                            in: 5...15,
                             step: 1)
                    .padding(.trailing, -10.0)
                    
                    Stepper("Kontributi i punëdhënësit   \(calculator.kontributiIPunedhedhenesitInStringLabel)%", value: $calculator.kontribtiIPunedhenesit,
                            in: 5...15,
                            step: 1)
                    .padding(.trailing, -10.0)
                    
                    
                }
                
                Section {
                    HStack {
                        Text("\(calculator.pagaFillestareLabel)")
                        Spacer()
                        Text("\(calculator.pagaString)€")
                    }
                    HStack {
                        Text("Kontributi i punëtorit")
                        Spacer()
                        Text("\(calculator.kontributiIPunetoritString)€")
                    }
                    HStack {
                        Text("Kontributi i punëdhënënsit")
                        Spacer()
                        Text("\(calculator.kontributiIPunedhenesitString)€")
                    }
                    HStack {
                        Text("Paga që tatohet")
                        Spacer()
                        Text("\(calculator.pagaQeTatohetString)€")
                    }
                    
                    HStack {
                        Text("Gjithsej tatimi")
                        Spacer()
                        Text("\(calculator.gjithsejTatimString)€")
                    }
                    HStack {
                        Text("\(calculator.pagaPerfundimtareLabel)")
                        Spacer()
                        Text("\(calculator.pagaPerfundimtare)€")
                           
                    }
                }
                
            }
            .navigationTitle("KALKULATORI I TATIMIT NË PAGË")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        pagaIsFocused = false
                    }
                }
            }
        }
        Spacer()
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

extension View {
    func showClearButton(_ text: Binding<String>) -> some View {
        self.modifier(TextFieldClearButton(fieldText: text))
    }
}
