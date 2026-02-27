import SwiftUI




// TODO: Make this app the main app that the app will show when the user opens the app ✅
// TODO: Make an array of buttons in the screen ✅
// TODO: Make a bar with to show the result of the calculation in the screen ✅
// TODO: Make a button that saves a list of calculations that the user has done before ✅
// TODO: Make the numbers from "displayText" available to copy
// TODO: Make the numbers in the display become slammer (12345678900)




struct ContentView: View {
    // MARK:  - Property Wrappers
    @State private var displayText = ""
    @State private var firstNumber = "0"
    @State private var currentOperation: Operation? = nil
	@State private var calculationHistory: [String] = [] // array to save the results

    
    
    // enumeration to use use in the calculations.
    
    enum Operation {
        case add
        case subtract
        case multiply
        case divide
    }
    

    
    // MARK: - Buttons
    let buttons = [
        ["Del", "AC", "%", "÷"],
        ["7", "8", "9", "×"   ],
        ["4", "5", "6", "-"   ],
        ["1", "2", "3", "+"   ],
        ["0", ".", "=", ""    ]  // 0 takes 2 spaces, last is empty
    ]
    
    
    // MARK: Button handle tap
    // function to handle whe the user taps the buttons of the calculator, this is just a mock for now, an implementation wil be done in a later commit.
    
    func handleTap(_ button: String) {  //Debug
        switch button {
        case "C", "AC":
            displayText = "0"
		case "1", "2", "3", "4", "5", "6", "7", "8", "9", "0":
			displayText += button
            
        default:
            displayText = "0"
        }
    }

    
    
    
    
    
    var body: some View {
        
        TabView {
	NavigationStack {

			
		HStack{
		NavigationLink{
				CalculationList()
					} label: {
				Image(systemName: "person.badge.clock")
		.frame(maxWidth: .infinity, alignment: .leading)
		.foregroundStyle(Color.primary)
		.font(.system(size: 25))
		.buttonStyle(GlassButtonStyle())
							
		}
	}
		
			
// Screen with digit display (.green when is a psoitive value, .red when is a negative value)
                VStack(alignment: .trailing){
                    Text(displayText)
					.lineLimit(1)
					.minimumScaleFactor(0.5)
					.frame(width: 385, height: 70, alignment: .trailing)
					.font(.system(size: 78, weight: .bold))
					.padding(.trailing, 16)
//                  .foregroundColor(displayText > 0 ? .green : (displayText < 0 ? .red : .gray))
					.foregroundColor(Color.primary)
					.background(RoundedRectangle(cornerRadius: 15)
					.frame(width: 398, height: 100, alignment: .center)
					.foregroundStyle(Color(.systemGray6))
                        )
					.padding(.top, 20)
                }
                
                Spacer()
                
     // For each button in the array of buttons make a HStack.
     // For each button in the array [buttons] with the id (.self) make a row with a HStack.
     //For each row with the id (.self) with the title in the button (Show the item as the buttom title)
                // call the handleTap function with the title as input
			   ForEach(buttons, id: \.self) { row in
				HStack(spacing: 12) {
					ForEach(row, id: \.self) { title in
										Button {
                                    handleTap(title)
                                        } label: {
                                            // Logic to swap text strings for SF Symbols
										switch title {
										case "Del":
                                                Image(systemName: "delete.left")
                                                    .font(.system(size: 40))
                                            case "÷":
                                                Image(systemName: "divide")
                                            case "×":
                                                Image(systemName: "multiply")
                                            case "-":
                                                Image(systemName: "minus")
                                                    .font(.system(size: 40))
                                            case "+":
                                                Image(systemName: "plus")
                                            case "PLACEHOLDER":
                                                Text("")
                                            default:
                                                Text(title)
                                            }
                                        }
                                        .frame(width: 75.5, height: 60)
                                        .font(.system(size: 50))
                                        .foregroundStyle(Color.primary)
                            
                            
                            
                        }
                    }
            }
                .padding()
        }
                        
				.tabItem {
                            Image(systemName: "plus.forwardslash.minus")
                            Text("Calculator")
                          }
                        
                        // Second Tab: Settings
                        SettingsView()
                            .tabItem {
                                Image(systemName: "gear")
                                Text("Settings")
                            }
                    }
                    
                }
             }

            
        


#Preview {
    ContentView()
}
