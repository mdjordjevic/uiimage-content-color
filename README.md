UIImage+MDContentColor
=====================

Useful UIImage category for getting average color and average content darkness level.

### Installation with CocoaPods
```ruby
pod 'UIImage+MDContentColor'
```

## Usage
```objc
#import "UIImage+MDContentColor.h"

UIImage *backgroundImage = /* get background image */
MDContentColor contentColor = [backgroundImage md_imageContentColor];
if( contentColor == MDContentColorLight ) {
    // background is light, so use dark text
}
else {
    // background is dark, so use light text
}
```
