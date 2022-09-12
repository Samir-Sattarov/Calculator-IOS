//
//  ContentView.swift
//  Calculator
//
//  Created by Samuel Sattarov on 08/09/22.
//

import SwiftUI

struct ContentView: View {
    @State var field = ""
    @State var operation = ""
    @State var history = ""
    @State var a = 0.0
    @State var b = 0.0
    @State var result = 0.0


    @State var isDarkTheme = false

    let darkButtonColor = Color(hex: 0xff505050)
    let ligthButtonColor = Color(hex: 0xffB7B7B7)
    let activeButtonColor = Color(hex: 0xffFF6D3F)


    let darkBackgroundColor = Color(hex: 0xff343434)
    let lightBackgroundColor = Color(hex: 0xffEEEEEE)



    var body: some View {
        VStack {

            HStack {

                Button(action: {
                    self.isDarkTheme.toggle()
                }, label: {
                    if isDarkTheme {
                        Image("sun")
                    } else {
                        Image("moon")
                    }
                }).padding(.leading, 30)
                Spacer()

            }.frame(maxWidth: 1000)






            Text(String(field)).fontWeight(Font.Weight.bold).foregroundColor(isDarkTheme ? Color.white : Color(hex: 0xff545454)).font(.system(size: 42)).padding(.top, 110).frame(maxWidth: 1000, alignment: .trailing).padding(.trailing, 26).padding(.bottom, 22)

            Text(history).fontWeight(Font.Weight.bold).foregroundColor(isDarkTheme ? Color(hex: 0xff959595) : Color(hex: 0xffC8C8C8)).font(.system(size: 32)).frame(maxWidth: 1000, alignment: .trailing).padding(.trailing, 26)
            Spacer()
            HStack {

                Button(action: {
                    clearAll()
                }, label: {
                    Text("AC").foregroundColor(Color.white).fontWeight(Font.Weight.heavy).frame(width: 70, height: 70)
                })
                    .background(activeButtonColor
                ).cornerRadius(18)

                Button(action: {
                    onReverse()
                }, label: {
                    Text("+/-").foregroundColor(Color.white).fontWeight(Font.Weight.heavy).frame(width: 70, height: 70)
                })
                    .background(activeButtonColor
                ).cornerRadius(18)

                Button(action: {
                    onMultiply()
                }, label: {
                    Text("X").foregroundColor(Color.white).fontWeight(Font.Weight.heavy).frame(width: 70, height: 70)
                })
                    .background(activeButtonColor
                ).cornerRadius(18)

                Button(action: {
                    removeLast()
                }, label: {
                    Image("backspace").frame(width: 70, height: 70)

                })
                    .background(activeButtonColor
                ).cornerRadius(18)
            }.padding(.bottom, 10)
            HStack {

                Button(action: {
                    printValue(value: "7")
                }, label: {
                    Text("7").foregroundColor(Color.white).fontWeight(Font.Weight.heavy).frame(width: 70, height: 70)
                })
                    .background(isDarkTheme ? darkButtonColor : ligthButtonColor
                ).cornerRadius(18)

                Button(action: {
                    printValue(value: "8")
                }, label: {
                    Text("8").foregroundColor(Color.white).fontWeight(Font.Weight.heavy).frame(width: 70, height: 70)
                })
                    .background(isDarkTheme ? darkButtonColor : ligthButtonColor
                ).cornerRadius(18)

                Button(action: {
                    printValue(value: "9")
                }, label: {
                    Text("9").foregroundColor(Color.white).fontWeight(Font.Weight.heavy).frame(width: 70, height: 70)
                })
                    .background(isDarkTheme ? darkButtonColor : ligthButtonColor
                ).cornerRadius(18)

                Button(action: {
                    onDivice()
                }, label: {
                    Text("/").foregroundColor(Color.white).fontWeight(Font.Weight.heavy).frame(width: 70, height: 70)
                })
                    .background(activeButtonColor
                ).cornerRadius(18)
            }.padding(.bottom, 10)

            HStack {

                Button(action: { printValue(value: "4")

                }, label: {
                    Text("4").foregroundColor(Color.white).fontWeight(Font.Weight.heavy).frame(width: 70, height: 70)
                })
                    .background(isDarkTheme ? darkButtonColor : ligthButtonColor
                ).cornerRadius(18)

                Button(action: {
                    printValue(value: "5")
                }, label: {
                    Text("5").foregroundColor(Color.white).fontWeight(Font.Weight.heavy).frame(width: 70, height: 70)
                }) .background(isDarkTheme ? darkButtonColor : ligthButtonColor).cornerRadius(18)

                Button(action: {
                    printValue(value: "6")
                }, label: {
                    Text("6").foregroundColor(Color.white).fontWeight(Font.Weight.heavy).frame(width: 70, height: 70)
                })
                    .background(isDarkTheme ? darkButtonColor : ligthButtonColor
                ).cornerRadius(18)

                Button(action: {
                    onMinus()
                }, label: {
                    Text("-").foregroundColor(Color.white).fontWeight(Font.Weight.heavy).frame(width: 70, height: 70)
                })
                    .background(activeButtonColor
                ).cornerRadius(18)
            }.padding(.bottom, 10)
            HStack {

                Button(action: {
                    printValue(value: "1")
                }, label: {
                    Text("1").foregroundColor(Color.white).fontWeight(Font.Weight.heavy).frame(width: 70, height: 70)
                })
                    .background(isDarkTheme ? darkButtonColor : ligthButtonColor
                ).cornerRadius(18)

                Button(action: {
                    printValue(value: "2")
                }, label: {
                    Text("2").foregroundColor(Color.white).fontWeight(Font.Weight.heavy).frame(width: 70, height: 70)
                })
                    .background(isDarkTheme ? darkButtonColor : ligthButtonColor
                ).cornerRadius(18)

                Button(action: {
                    printValue(value: "3")
                }, label: {
                    Text("3").foregroundColor(Color.white).fontWeight(Font.Weight.heavy).frame(width: 70, height: 70)
                })
                    .background(isDarkTheme ? darkButtonColor : ligthButtonColor
                ).cornerRadius(18)

                Button(action: {
                    onPlus()
                }, label: {
                    Text("+").foregroundColor(Color.white).fontWeight(Font.Weight.heavy).frame(width: 70, height: 70)
                })
                    .background(activeButtonColor
                ).cornerRadius(18)
            }.padding(.bottom, 10)
            HStack {



                Button(action: {
                    printValue(value: "00")

                }, label: {
                    Text("00").foregroundColor(Color.white).fontWeight(Font.Weight.heavy).frame(width: 70, height: 70)
                })
                    .background(isDarkTheme ? darkButtonColor : ligthButtonColor
                ).cornerRadius(18)

                Button(action: {

                    printValue(value: "0")


                }, label: {
                    Text("0").foregroundColor(Color.white).fontWeight(Font.Weight.heavy).frame(width: 70, height: 70)
                })
                    .background(isDarkTheme ? darkButtonColor : ligthButtonColor
                ).cornerRadius(18)

                Button(action: {
                    printValue(value: ".")
                }, label: {
                    Text(".").foregroundColor(Color.white).fontWeight(Font.Weight.heavy).frame(width: 70, height: 70)
                }).frame(width: 70, height: 70)
                    .background(isDarkTheme ? darkButtonColor : ligthButtonColor
                ).cornerRadius(18)


                Button(action: {
                    onResult()
                }, label: {
                    Text("=").foregroundColor(Color.white).fontWeight(Font.Weight.heavy).frame(width: 70, height: 70)
                })
                    .background(activeButtonColor
                ).cornerRadius(18)
            }.padding(.bottom, 10)

        }.frame(maxWidth: 1000).background(
            isDarkTheme ? darkBackgroundColor : lightBackgroundColor
        )
    }

    func onPlus() {

        operation = "+";

        a = Double(field)!

        field = ""



    }

    func onMinus() {
        operation = "-";

        a = Double(field)!

        field = ""


    }

    func onDivice() {


        operation = "/";

        a = Double(field)!

        field = ""

    }

    func onMultiply() {

        operation = "X";

        a = Double(field)!

        field = ""

    }

    func onReverse() {

        operation = "+/-";

        let negative = Double(field)!

        field = String(-negative)



    }


    func onResult() {
        b = Double(field)!

        history = result.isZero ? "" : String(result)
        switch operation {
        case "+":
            result = Double(a + b)
            field = String(result)
        case "-":
            result = Double(a - b)
            field = String(result)
        case "/":
            result = Double(a / b)
            field = String(result)
        case "X":
            result = Double(a * b)
            field = String(result)

        default:
            result = 0
        }
    }

    func printValue(value: String)
    {
        field += value
    }


    func clearAll() {
        field = ""
        operation = ""
        history = ""

        a = 0.0
        b = 0.0
        result = 0.0
    }

    func removeLast () {

        if !field.isEmpty {
            field.removeLast()
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
                .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
