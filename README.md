
![cirque icon 2](/Cirque.png)

[![CI Status](http://img.shields.io/travis/philipengberg/Cirque.svg?style=flat)](https://travis-ci.org/philipengberg/Cirque)
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

![Example](/Example.png)

### Customization
You can further customize the appearance be tweaking
- `transitionSize`: A `Float` between 0 and 1 indicating the percentage of the circle circumference that should be used to transition fully from one color to the next. **Default value** is `0.025`, i.e. 2.5 %.
- `stepSize`: A `Float` between 0 and 1 indicating the percentage of the `transitionSize` that each gradient step should fill. So with a value of `0.1`, each color step is 10% of the `transitionSize`, meaning there will be 10 steps in total. **Default value** is `0.1`, i.e. 10 steps.
- `lineWidth`: A `Float` indicating the stroke width of the circle. **Default value** is `5`

## Installation

Cirque is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Cirque"
```

## Author

philipengberg, engberg@tonsser.com

## License

Cirque is available under the MIT license. See the LICENSE file for more info.
