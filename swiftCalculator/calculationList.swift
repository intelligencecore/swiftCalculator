
import SwiftUI


// TODO: Add screen to see previous calculations that the user has made before


struct CalculationList: View {
	@State private var showContentView: Bool = false
	
	
	
	var body: some View {
		
		VStack {
			
			List{					//this list is just a placeholder for now (Soon to be a forEach loop to generate and include the previous results)
				Button("Result 1"){
					print("Button 1 Pressed")
				}
				
				Button("Result 2"){
					print("Button 2 Pressed")
				}
				
				Button("Result 3"){
					print("Button 3 Pressed")
				}
				
				Button("Result 4"){
					print("Button 4 Pressed")
				}
				
				Button("Result 5"){
					print("Button 5 Pressed")
				}
				
				Button("Result 6"){
					print("Button 6 Pressed")
				}
				
				Button("Result 7"){
					print("Button 7 Pressed")
				}
				Button("Result 8"){
					print("Button 8 Pressed")
				}
					
				Button("Result 9"){
					print("Button 9 Pressed")
				}
				
				Button("Result 10"){
					print("Button 10 Pressed")
				}
					
				Button("Result 11"){
					print("Button 11 Pressed")
				}
					
				Button("Result 12"){
					print("Button 12 Pressed")
				}
					
				Button("Result 13"){
					print("Button 13 Pressed")
				}
			}
			
			
			
			
			Button("Delete all") {
				print("Deleting all")
			}
			.tint(.red)
			.buttonStyle(GlassButtonStyle())
			.padding()
			
			
		}
		.toolbar{
			ToolbarItem(placement: .principal) {
				Text("Previous Calculations")
					.foregroundStyle(.primary)
					.font(.headline)
					.bold()
			}
		}
		
	}
	
	
	
}
        


#Preview {
		CalculationList()
}
