
import SwiftUI


// TODO: Add screen to see previous calculations that the user has made before


struct CalculationList: View {
	@State private var showContentView: Bool = false
	
	
	
	var body: some View {
		
		VStack {
			
			List{					//this list is just a placeholder for now (Soon to be a forEach loop to generate and include the previous results)
				Text("Result 1")
				Text("Result 2")
				Text("Result 3")
				Text("Result 4")
				Text("Result 5")
				Text("Result 6")
				Text("Result 7")
				Text("Result 8")
				Text("Result 9")
				Text("Result 10")
				Text("Result 11")
				Text("Result 12")
				Text("Result 13")
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
