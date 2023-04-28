import SwiftUI

struct SuccessView: View {
  @Binding var selectedTab: Int
  @Environment(\.dismiss) var dismiss
  
  var body: some View {
    ZStack(alignment: .topTrailing) {
      VStack {
        Spacer()
        Image(systemName: "hand.raised.fill")
          .resizedToFill(width: 75, height: 75)
          .foregroundColor(Color("Launchscreen-background"))
          .padding()
        Text("High Five!")
          .font(.title)
          .fontWeight(.heavy)
        Text("Good job completing all four exercises!\nRemember tomorrow's another day.\nSo eat well and get some rest.")
          .multilineTextAlignment(.center)
          .font(.subheadline)
          .foregroundColor(.secondary)
        Spacer()
        Button("Continue") {
          selectedTab = 9
          dismiss()
        }
          .padding(.bottom)
      }
    }
  }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
      SuccessView(selectedTab: .constant(3))
        .previewLayout(.sizeThatFits)
    }
}
