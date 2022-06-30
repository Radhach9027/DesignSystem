import UIKit

public enum TabBar {
    case makeTab(controller: UIViewController,
                 title: String,
                 image: UIImage,
                 selectedImage: UIImage)
}

public class TabBarController: UITabBarController {
    private var didSelected: ((_ controller: UIViewController) -> Void)?
    private var controllers: [TabBar]
    private var tabBarAppearance: TabBarAppearance?

    public init(viewControllers: [TabBar],
                didSelected: ((_ controller: UIViewController) -> Void)? = nil,
                tabBarAppearance: TabBarAppearance? = nil) {
        self.controllers = viewControllers
        self.didSelected = didSelected
        self.tabBarAppearance = tabBarAppearance
        super.init(nibName: nil, bundle: nil)
        delegate = self
        setupViewControllers()
        guard let appearance = tabBarAppearance else { return }
        setAppearance(appearance: appearance)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TabBarController {
    
    public convenience init(viewControllers: [TabBar]) {
        self.init(viewControllers: viewControllers,
                  didSelected: nil,
                  tabBarAppearance: nil)
    }
    
    public convenience init(viewControllers: [TabBar],
                            tabBarAppearance: TabBarAppearance) {
        self.init(viewControllers: viewControllers,
                  didSelected: nil,
                  tabBarAppearance: tabBarAppearance)
    }
    
    public convenience init(viewControllers: [TabBar],
                            didSelected: ((_ controller: UIViewController) -> Void)?) {
        self.init(viewControllers: viewControllers,
                  didSelected: didSelected,
                  tabBarAppearance: nil)
    }
}

private extension TabBarController {
    
    func setAppearance(appearance: TabBarAppearance) {
        UITabBar.tabAppearance(appearance: appearance)
    }
    
    func setupViewControllers() {
        viewControllers = controllers.map({
            switch $0 {
            case let .makeTab(controller,
                              title,
                              image,
                              selectedImage):
                let cont = controller
                cont.tabBarItem = makeTabBarItem(title: title,
                                                 defaultImage: image,
                                                 selectedImage: selectedImage)
                return cont
            }
        })
    }
    
    func makeTabBarItem(title: String,
                        defaultImage: UIImage,
                        selectedImage: UIImage) -> UITabBarItem {
        UITabBarItem(title: title,
                     image: defaultImage,
                     selectedImage: selectedImage)
    }
}

extension TabBarController: UITabBarControllerDelegate {
    
    public func tabBarController(_ tabBarController: UITabBarController,
                                 animationControllerForTransitionFrom fromVC: UIViewController,
                                 to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return TabFadeAnimation()
    }
    
    public override func tabBar(_ tabBar: UITabBar,
                                didSelect item: UITabBarItem) {
        guard let barItemView = item.value(forKey: "view") as? UIView else { return }
        barItemView.tabItemBounceAnimation()
    }
    
    public func tabBarController(_ tabBarController: UITabBarController,
                                 didSelect viewController: UIViewController) {
        guard let handler = didSelected else { return }
        handler(viewController)
    }
}
