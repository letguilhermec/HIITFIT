import SwiftUI

struct RaisedButton: View {
  let buttonText: String
  let action: () -> Void
  
  var body: some View {
    Button(action: {
      action()
    }, label: {
      Text(buttonText)
        .raisedButtonTextStyle()
    })
    .buttonStyle(.raised)
  }
}

extension Text {
  func raisedButtonTextStyle() -> some View {
    self
      .font(.body)
      .fontWeight(.bold)
  }
}

struct RaisedButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .frame(maxWidth: .infinity)
      .padding([.top, .bottom], 12)
      .background(
        Capsule()
          .foregroundColor(Color("background"))
          .shadow(color: Color("drop-shadow"), radius: 4, x: 6, y: 6)
          .shadow(color: Color("drop-highlight"), radius: 4, x: -6, y: -6)
      )
  }
}

extension ButtonStyle where Self == RaisedButtonStyle {
  static var raised: RaisedButtonStyle {
    .init()
  }
}

struct RaisedButton_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      RaisedButton(buttonText: "Get Started") {
        print("Hello, world")
      }
    }
    .background(Color("background"))
    .previewLayout(.sizeThatFits)
  }
}
