
import SwiftUI


// TODO: Add screen to see previous calculations that the user has made before


struct CalculationList: View {
	@State private var showContentView: Bool = false
	
	
	
	var body: some View {
		
		HStack {
			
			
			Text("This view shows a list of previous result that the user has calculated before and a delete button at the end")
		}
		
		HStack{
			List{
				Text("Result 1")
				Text("Result 2")
				Text("Result 3")
				Text("Resutl 4")
				Text("Result 5")
				Text("Result 6")
				Text("Result 7")
				Text("Result 8")
				Text("Result 9")
				Text("Result 10")
				Text("Result 11")
				Text("Result 12")
				Text("Resut 13")
			}
			
			
			
			
			
		}
		
		
		HStack{
			
			Button("Delete all") {
				
				print("Deleting 1")
				
			}
		}
		.tint(.red)
		.buttonStyle(GlassButtonStyle())
		
	}
}
        
        


#Preview {
    CalculationList()
}
