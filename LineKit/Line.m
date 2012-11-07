//
//  Line.m
//  LKExample
//
//  Created by Chih-Wei Lee on 11/7/12.
//  Copyright (c) 2012 Polydice, Inc. All rights reserved.
//

#import "Line.h"

@implementation Line

+ (BOOL)isLineInstalled {
  return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"line://"]];
}

+ (BOOL)shareText:(NSString *)text {
  return [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"line://msg/text/%@", [text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]]];
}

+ (BOOL)shareImage:(UIImage *)image {
  UIPasteboard *pasteboard = [UIPasteboard pasteboardWithName:@"jp.naver.linecamera.pasteboard" create:YES];
  [pasteboard setData:UIImageJPEGRepresentation(image, 0.8) forPasteboardType:@"public.jpeg"];
  return [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"line://msg/image/%@", pasteboard.name]]];
}

@end
