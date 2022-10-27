import SwiftUI
import Lottie

public struct LottieView: UIViewRepresentable {
    
    public init(file: String) {
        self.init(file: file, loopMode: .loop)
    }

    public init(file: String, loopMode: LottieLoopMode) {
        self.lottieFileName = file
        self.loopMode = loopMode
    }
    
    var lottieFileName: String
    
    var loopMode: LottieLoopMode

    public func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)

        if fileExist {
            let animationView = LottieAnimationView()
            let animation = LottieAnimation.named(lottieFileName)
            animationView.animation = animation
            animationView.contentMode = .scaleAspectFit
            animationView.loopMode = loopMode
            animationView.play()
            
            animationView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(animationView)
            NSLayoutConstraint.activate([
                animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
                animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
            ])
        } else {
            let label = UILabel()
            label.text = "⚠️ No file found 🛑"
            label.font = .boldSystemFont(ofSize: 24)
            label.textColor = .systemRed
            
            view.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                label.heightAnchor.constraint(equalTo: view.heightAnchor),
                label.widthAnchor.constraint(equalTo: view.widthAnchor)
            ])
        }
        
        return view
    }

    var fileExist: Bool {
        Bundle.main.path(forResource: lottieFileName, ofType: "json") != nil
    }
    
    public func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}
