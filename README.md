# ImageAlertPresenter

_Present UIAlertController with an image :stars:_

![Platform iOS](https://img.shields.io/badge/platform-iOS-blue.svg)
[![MIT license](http://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/longhorn499/ActivityNavigationItem/raw/master/LICENSE.md)

## Description

Present iOS alert with a configurable image. Use as is or as a starting point for your custom image alert.

<img src="https://raw.githubusercontent.com/longhorn499/ImageAlertPresenter/master/Screenshots/screenshot.png" height = 
"646"/>

## Installation

Manually import the files from the Source folder.


## Usage

Initialize and present from view controller:

``` swift
let imageAlert = ImageAlertPresenter.init(root: self, image: #imageLiteral(resourceName: "yourImage"))
imageAlert.delegate = self
imageAlert.present()
```

## Configuration

Change properties on the presenter's configuration struct during or after initialization: 

````swift
imageAlert.config.completeTitle = "Send Image"
````

## Requirements

Written in Swift 4.0


## Credits

Inspired by UIMediaAlertController - https://github.com/iosdec/UIMediaAlertController

Created by [Kevin Johnson](http://www.johnsonkevin.com).


## License

Available under the MIT license. See the LICENSE file for more info.
