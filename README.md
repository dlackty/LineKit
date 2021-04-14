# LineKit

[![Build Status](https://travis-ci.org/dlackty/LineKit.svg?branch=master)](https://travis-ci.org/dlackty/LineKit)

Share to LINE from your apps.

LineKit now support sharing text, and images friends, and groups. Sharing to timeline is also supported.

Also, an `UIActivity` subclass is also provided for use with `UIActivityController`.

## Usage

LineKit provides a helper method to check if LINE app is installed on current device.

```ObjC
if (![Line isLineInstalled]) {
  // Prompt error
}
```

To share text to LINE, you can simply call:

```ObjC
[Line shareText:@"Hello Line!"];
```

To share image to LINE, you can call:

```ObjC
[Line shareImage:[UIImage named:@"avatar.png"]];
```

To add friend or official account, use:

```ObjC
[Line addFriend:@"hPtAUZX6w5"];
```

To show shop detail (usually stickers), try:

```ObjC
[Line showShopDetail:@"2"];
```

You can redirect user to App Store to download LINE app via:

```ObjC
[Line openLineInAppStore];
```

### Add `line://` to `LSApplicationQueriesSchemes`

For LineKit to properly detect LINE's installation, please add `line://` to `LSApplicationQueriesSchemes`.

After iOS 9.0, you must declare the URL schemes you pass to this method by adding the [`LSApplicationQueriesSchemes`](https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/LaunchServicesKeys.html#//apple_ref/doc/plist/info/LSApplicationQueriesSchemes) key to your app's Info.plist file. 

### UIActivity

To use LineKit with UIActivityViewController is simple and recommended:

```ObjC
UIActivityViewController *controller = 
  [[UIActivityViewController alloc] initWithActivityItems:items
                                    applicationActivities:@[[[LKLineActivity alloc] init]]];
```

### iOS 7's limitation for image sharing

Due to iOS 7 limitation, custom `UIPasteboard` objects couldn't be shared across apps without the same namespace (i.e. `jp.naver.*`)

So for iOS 7, general `UIPasteboard` object is used for image sharing. Be careful that users might lose paste data.

## Sample Project

The Xcode project under LKExample folder is a sample app to demonstrate the usages of LineKit.

## Installation

We recommend you to install via CocoaPods.

## Thanks

Thanks [@bcylin](https://github.com/bcylin) for some part of codes for LKLineActivity.

Thanks [@trisix](https://github.com/trisix) for LKLineActivity images.

## Users

* [iCook 愛料理](https://icook.tw/)
* [kurashiru [クラシル]](https://www.kurashiru.com/)

Feel free to open a pull request or send a issue to let me know!

## License

LineKit is available under the MIT license.

Copyright (C) 2014 Richard Lee

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
