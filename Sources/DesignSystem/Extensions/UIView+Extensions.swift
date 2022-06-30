import UIKit

extension UIView {
    
    func tabItemBounceAnimation() {
        let timeInterval: TimeInterval = 0.5
        let propertyAnimator = UIViewPropertyAnimator(duration: timeInterval, dampingRatio: 0.5) {
            self.transform = CGAffineTransform.identity.scaledBy(x: 1.2, y: 1.2)
        }
        propertyAnimator.addAnimations({ self.transform = .identity }, delayFactor: CGFloat(timeInterval))
        propertyAnimator.startAnimation()
    }
    
    func pin(someView: UIView) {
        someView.translatesAutoresizingMaskIntoConstraints = false
        someView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        someView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        someView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        someView.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
