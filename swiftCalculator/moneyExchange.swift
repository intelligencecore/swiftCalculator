import Foundation
import SwiftUI










struct MoneyExchange: View {
	
	var body: some View {
		VStack{
			
			Menu("Select Currency"){
				Button("American Dollar"){
						// calculation
				}
				Button("Canadian Dollar"){
						// calculation
				}
				Button("Euro"){
						// calculation
				}
				
			}
		}
		.frame(width: 1000, height: 1000)
		.background(Color.white)
		}
	}


#Preview {
	MoneyExchange()
}
