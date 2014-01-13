//  Line.m
//
// Copyright (C) 2012 Chih-Wei Lee
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

#import "Line.h"

@implementation Line

#pragma mark - Private

+ (BOOL)isiOS7 {
  NSArray *versions = [[UIDevice currentDevice].systemVersion componentsSeparatedByString:@"."];
  return [versions[0] intValue] >= 7;
}

+ (UIPasteboard *)pasteboard {
  if ([self isiOS7]) {
    return [UIPasteboard generalPasteboard];
  } else {
    return [UIPasteboard pasteboardWithName:@"jp.naver.linecamera.pasteboard" create:YES];
  }
}

#pragma mark - Public

+ (BOOL)isLineInstalled {
  return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"line://"]];
}

+ (BOOL)shareText:(NSString *)text {
  return [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"line://msg/text/%@", [text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]]];
}

+ (BOOL)shareImage:(UIImage *)image {
  UIPasteboard *pasteboard = self.pasteboard;
  [pasteboard setData:UIImageJPEGRepresentation(image, 0.8) forPasteboardType:@"public.jpeg"];
  return [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"line://msg/image/%@", pasteboard.name]]];
}

@end
