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

        return view
    }

    public func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}
