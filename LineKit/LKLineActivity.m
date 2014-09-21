// LKLineActivity.m
//
// Copyright (C) 2012-2014 Richard Lee
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "LKLineActivity.h"
#import "Line.h"

@interface LKLineActivity ()
@property (nonatomic, assign) BOOL isImageSharing;
@property (nonatomic, assign) BOOL isTextSharing;
@property (nonatomic, strong) NSArray *items;
@end

@implementation LKLineActivity

#pragma mark - UIActivity

- (NSString *)activityType {
  return @"org.dlackty.LKLineActivity";
}

- (NSString *)activityTitle {
  return @"LINE";
}

- (UIImage *)activityImage {
  if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
    return [UIImage imageNamed:@"LKActivity-Flat"];
  } else {
    return [UIImage imageNamed:@"LKActivity"];
  }
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems {
  for (id item in activityItems) {
    if ([item isKindOfClass:[UIImage class]]) {
      self.isImageSharing = YES;
    } else if ([item isKindOfClass:[NSURL class]] ||
        [item isKindOfClass:[NSString class]]) {
      self.isTextSharing = YES;
    } else {
      return NO;
    }
  }
  
  return (self.isImageSharing ^ self.isTextSharing) && [Line isLineInstalled];
}

- (void)prepareWithActivityItems:(NSArray *)activityItems {
  self.items = activityItems;
}

- (void)performActivity {
  if (self.isImageSharing) {
    [Line shareImage:self.items.lastObject];
  } else if (self.isTextSharing) {
    [Line shareText:[self.items componentsJoinedByString:@" "]];
  }
  
  [self activityDidFinish:YES];
}

@end
