//
//  ContentView.swift
//  SwiftUICalculator
//
//  Created by iOS Dev on 9/5/24.
//

import SwiftUI

struct ContentView: View {
    enum Buttons {
        case AC
        case pm
        case percent
        case divide
        case seven
        case eight
        case nine
        case multiple
        case four
        case five
        case six
        case minus
        case one
        case two
        case three
        case plus
        case zero
        case dot
        case equal
        
        var rawValue: String {
            switch self {
            case .AC:
                return "AC"
            case .pm:
                return "+/-"
            case .percent:
                return "%"
            case .divide:
                return "/"
            case .seven:
                return "7"
            case .eight:
                return "8"
            case .nine:
                return "9"
            case .multiple:
                return "x"
            case .four:
                return "4"
            case .five:
                return "5"
            case .six:
                return "6"
            case .minus:
                return "-"
            case .one:
                return "1"
            case .two:
                return "2"
            case .three:
                return "3"
            case .plus:
                return "+"
            case .zero:
                return "0"
            case .dot:
                return "."
            case .equal:
                return "="
            }
        }
        
        var backgroundColor: Color {
            switch self {
            case .AC, .pm, .percent:
                return  .secondary
            case .divide, .multiple, .minus, .plus, .equal:
                return .orange
            case .seven, .eight, .nine, .four, .five, .six, .one, .two, .three, .zero, .dot:
                return .gray
            }
        }
    }
    
    @State private var resultNumber = 0
    
    private let buttonArray: [[Buttons]] = [
        [.AC, .pm, .percent, .divide],
        [.seven, .eight, .nine, .multiple],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .dot, .equal]
    ]
    private let buttonSize = UIScreen.main.bounds.width / 4
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 1) {
                Spacer()
                HStack {
                    Spacer()
                    Text(String(resultNumber))
                        .foregroundStyle(.white)
                        .padding()
                        .font(.system(size: 50))
                        
                }
                ForEach(buttonArray, id: \.self) { row in
                    HStack(spacing: 1) {
                        ForEach(row, id: \.self) { col in
                            Button {
                                resultNumber = Int(col.rawValue)!
                            } label : {
                                let width = col == .zero ? (buttonSize * 2) + 1 : buttonSize
                                let height = col == .zero ? buttonSize * 2 : buttonSize
                                
                                Text(col.rawValue)
                                    .frame(width: width, height: buttonSize, alignment: .center)
                                    .foregroundStyle(.white)
                                    .background(col.backgroundColor)
                                    .font(.system(size: 25, weight: .medium))
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
