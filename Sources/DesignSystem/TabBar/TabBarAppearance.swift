import UIKit

public struct TabBarAppearance {
    let tabColor: UIColor
    let tabTintColor: UIColor
    let tabUnselectedColor: UIColor
    let tabItemTitleSelectedColor: UIColor
    let tabItemTitleUnSelectedColor: UIColor
    let tabItemTitleSelectedFont: UIFont
    let tabItemTitleUnSelectedFont: UIFont
    
    public init(tabColor: UIColor,
                tabTintColor: UIColor,
                tabUnselectedColor: UIColor,
                tabItemTitleSelectedColor: UIColor,
                tabItemTitleUnSelectedColor: UIColor,
                tabItemTitleSelectedFont: UIFont,
                tabItemTitleUnSelectedFont: UIFont) {
        self.tabColor = tabColor
        self.tabTintColor = tabTintColor
        self.tabUnselectedColor = tabUnselectedColor
        self.tabItemTitleSelectedColor = tabItemTitleSelectedColor
        self.tabItemTitleUnSelectedColor = tabItemTitleUnSelectedColor
        self.tabItemTitleSelectedFont = tabItemTitleSelectedFont
        self.tabItemTitleUnSelectedFont = tabItemTitleUnSelectedFont
    }
}
