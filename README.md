#  DarkModeDemo-UIKit
## Preparing for iOS 13 Dark Mode

![](./readme-assets/01.gif)

# Theory
Following the introduction of support for **Dark Mode** in macOS, the release of iOS 13 sees iOS devices gain dark mode settings. 
While supporting dark mode is not mandatory at this point, most developers will want to review existing apps to see how they look.
Certainly all newly developed apps should provide explicit support for dark mode.
Happily, supporting dark mode is normally fairly simple. Unless, that is, your design uses lots of "static" custom colors (see below).

At a basic level, all you need to do to support dark mode is re-build your app with the iOS 13 SDK.
All UIKit views such as labels, table views and buttons have been updated to automatically render themselves correctly when dark mode is enabled.

There are likely three main areas where manually review or changes will be necessary:

1. **Static colors**. Where your apps uses colors like **UIColor.red** or **UIColor(red: 0, green: 255, blue: 0, alpha: 1)**
2. **Images**. For example, where an image has a white or light-colored border
3. **Storyboards**. For example, color attributes that use non-default values

___

## Detecting Dark Mode/Light Mode switches
As we'll see, there are often better ways to handle switches between display modes. 
However, if you need to *programmatically* detect when the display mode changes you can use the following 
**traitCollectionDidChange(_:)** code as a template:

``` swift
class TableViewController: UITableViewController {

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        switch traitCollection.userInterfaceStyle {
            case .dark: darkModeEnabled()   // Switch to dark mode colors, etc.
            case .light: fallthrough
            case .unspecified: fallthrough
            default: lightModeEnabled()   // Switch to light mode colors, etc.
        }
    }

    private func lightModeEnabled() { ... }
    private func darkModeEnabled() { ... }
}
```

## Static colors
Colors like **UIColor.red** or **UIColor(red: 0, green: 255, blue: 0, alpha: 1)** are said to be static because they remain fixed whatever 
the display mode setting. 




## Images



## Storyboards

___

# Practice: Updating Writerly

## Storyboard defaults

## Programmatic non-static colors

## WKWebView stylesheet media dark

## HTML using media queries on <img>
See https://webkit.org/blog/8840/dark-mode-support-in-webkit/

___

# SwiftUI
