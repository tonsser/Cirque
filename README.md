
![cirque icon 2](/img/Cirque.png)

![Swift](https://img.shields.io/badge/Swift-3.0-brightgreen.svg)
[![Version](https://img.shields.io/cocoapods/v/Cirque.svg?style=flat)](http://cocoapods.org/pods/Cirque)
[![License](https://img.shields.io/cocoapods/l/Cirque.svg?style=flat)](http://cocoapods.org/pods/Cirque)
[![Platform](https://img.shields.io/cocoapods/p/Cirque.svg?style=flat)](http://cocoapods.org/pods/Cirque)

# Cirque 🎨
Cirque is an iOS component that enables you to draw **multi color** circle strokes with **gradient trasitions** between colors.

## Why?
`CAGradientLayer` currently only supports linear gradients, and most solutions out there only support two colors. However, we needed a modular, configurable component that could handle any number of colors at any size.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

First create a data structure that implements `CirqueDataType` (an `enum` would make sense), then create a new `CirqueView` and set the `dataPoints` property with an array of `CirqueDataType`.
```swift
let cirque = CirqueView(frame: CGRect(x: 0, y: 0, width: 110, height: 110))
cirque.dataPoints = [RankingGroup.match(value: 0.3), 
                     RankingGroup.achievements(value: 0.2), 
                     RankingGroup.votes(value: 0.2)]
view.addSubview(cirque)
```
and boom 💥

![Example](/img/Example.png)

### Customization
You can further customize the appearance be tweaking

| Property | Description | Default value |
|:---------|:------------|:--------------|
|**`transitionSize`**| A `Float` between 0 and 1 indicating the percentage of the circle circumference that should be used to transition fully from one color to the next. | `0.025` |
|**`stepSize`**| A `Float` between 0 and 1 indicating the percentage of the `transitionSize` that each gradient step should fill. So with a value of `0.1`, each color step is 10% of the `transitionSize`, meaning there will be 10 steps in total. | `0.1` |
|**`lineWidth`**| A `Float` indicating the stroke width of the circle. | `5` |

### How it works
The idea is to draw as much as possible with ordinary strokes on a bezier arc. Then when it's time to shift color, `1/stepSize` little arcs are drawn which each go one step closer to the next color. This is illustrated below:

![Example](/img/HowItWorks.gif)

## Installation

Cirque is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Cirque"
```

## Author

**Mr. Engberg**, Lead Mobile Developer @ [Tonsser](https://github.com/tonsser)

![GitHub](/img/GitHub.png)[philipengberg](https://github.com/philipengberg)

![Twitter](/img/Twitter.png)[philipengberg](https://twitter.com/philipengberg)

## License

Cirque is available under the MIT license. See the LICENSE file for more info.
