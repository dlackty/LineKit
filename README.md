# LineKit

Share to Naver Line from your apps. 

LineKit now support sharing text, and images friends, and groups. Sharing to timeline is also supported.

Currently, LineKit supports Line version > 2.0, and should works on iOS > 4.0 with ARC-enabled.

# Usage

To share text to Line, you can simply call:

```
[Line shareText:@"Hello Line!"];
```

To share image to Line, you can call: 

```
[Line shareImage:[UIImage named:@"avatar.png"]];
```

Also, LineKit provides a helper method to check if Line is installed on current device.

```
if (![Line isLineInstalled]) {
  // Prompt error
}
```

# Sample Project

The Xcode project under LKExample folder is a sample app to demonstrate the basic usages of LineKit.

# Installation

We recommend you to install via CocoaPods. However, if you want to install manually, you can follow the instructions below.

1. Download the latest codes from GitHub
2. Add LineKit folder to your Xcode project.

# License

LineKit is available under the MIT license.

Copyright (C) 2012 Chih-Wei Lee

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
