import UIKit

extension UITabBar {
    
    static func tabAppearance(appearance: TabBarAppearance) {
        
        if #available(iOS 15.0, *){
            let tabBarApperance = UITabBarAppearance()
            tabBarApperance.configureWithOpaqueBackground()
            tabBarApperance.backgroundColor = appearance.tabColor
            tabBarApperance.compactInlineLayoutAppearance.normal.titleTextAttributes = [.foregroundColor : appearance.tabItemTitleUnSelectedColor, .font: appearance.tabItemTitleUnSelectedFont]
            tabBarApperance.compactInlineLayoutAppearance.selected.titleTextAttributes = [.foregroundColor : appearance.tabItemTitleSelectedColor, .font: appearance.tabItemTitleSelectedFont]
            UITabBar.appearance().scrollEdgeAppearance = tabBarApperance
            UITabBar.appearance().standardAppearance = tabBarApperance
            UITabBar.appearance().tintColor = appearance.tabTintColor
            UITabBar.appearance().unselectedItemTintColor = appearance.tabUnselectedColor
        } else {
            UITabBar.appearance().tintColor = appearance.tabTintColor
            UITabBar.appearance().barTintColor = appearance.tabTintColor
            UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: appearance.tabItemTitleSelectedColor, NSAttributedString.Key.font: appearance.tabItemTitleSelectedFont],
                                                             for: .selected)
            UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: appearance.tabItemTitleUnSelectedColor, NSAttributedString.Key.font: appearance.tabItemTitleUnSelectedFont],
                                                             for: .normal)
        }
    }
}
