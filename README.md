#  DarkModeDemo-UIKit
## Preparing for iOS 13 Dark Mode

![](./readme-assets/adaptiveColors50.gif)

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
Using static colors like **UIColor.red** or **UIColor(red: 255, green: 0, blue: 0, alpha: 1)** means that when the user switches display modes 
those colors do not automatically adapt. A better practice is to define *adaptive colors* in the asset catalog.

Open the asset catalog, right-click in the list of assets (or click the “+” at the bottom of the asset pane) and select **New Color Set**:

![](./readme-assets/image01.jpg)

You’ll see:

![](./readme-assets/image02.jpg)

In the **Attribute Inspector** select **Any, Light, Dark** from the **Appearance** dropdown list:

![](./readme-assets/image03.jpg)

![](./readme-assets/image04.jpg)

You can now name the define the color you want for each display mode:

![](./readme-assets/image05.jpg)

You can then use the color in Interface Builder or in code:

![](./readme-assets/image06.jpg)

``` swift
// The colors adaptiveRed and adaptiveBlue are defined in the asset catalogue
cell.colorTabView.backgroundColor = UIColor(named: selectedAnimal.canFly ? "adaptiveRed" : "adaptiveBlue")
```

In the above code snippet I’m adding a background color to a View in a custom table view cell. 
You can see the color adapts according to light or dark mode being selected:

![](./readme-assets/adaptiveColors50.gif)

![](./readme-assets/image07.jpg)

## Images
In a very similar way as for adaptive colors, we can make use of adaptive images in the asset catalog.

Select an image in the asset catalog and then select **Any, Dark** from the **Appearance** dropdown list:

![](./readme-assets/image08.jpg)

Now drag in a new image for for use in dark mode:

![](./readme-assets/image09.jpg)

In this example I’m adding images to the table view like this:

``` swift
// thumbName is the name of an adaptive image in the asset catalog
cell.animalImageView.image = UIImage(named: selectedAnimal.thumbName)
```

You can see that the image adapts automatically when the display mode changes:

![](./readme-assets/image10.jpg)

## Storyboards
TODO

___

# Practice: Updating Writerly
TODO

## Storyboard defaults

## Programmatic non-static colors

## WKWebView stylesheet media dark

## HTML using media queries on <img>
See https://webkit.org/blog/8840/dark-mode-support-in-webkit/

___

# SwiftUI
TODO
