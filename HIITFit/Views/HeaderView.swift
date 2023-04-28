import SwiftUI

struct HeaderView: View {
  @Binding var selectedTab: Int
  let titleText: String
  
  var body: some View {
    VStack {
      Text(titleText)
        .foregroundColor(Color(.white))
        .font(.largeTitle)
        .fontWeight(.black)
        .kerning(2)
        .padding(.bottom, 2)
      HStack {
        ForEach(Exercise.exercises.indices, id: \.self) { index in
          ZStack {
            Circle()
              .frame(width: 32, height: 32)
              .foregroundColor(Color(.white))
              .opacity(index == selectedTab ? 0.5 : 0.0)
            Circle()
              .frame(width: 16, height: 16)
              .foregroundColor(Color(.white))
          }
          .onTapGesture {
            selectedTab = index
          }
        }
      }
      .font(.title2)
    }
  }
}

struct HeaderView_Previews: PreviewProvider {
  static var previews: some View {
    HeaderView(selectedTab: .constant(0), titleText: "Squat")
      .previewLayout(.sizeThatFits)
  }
}
