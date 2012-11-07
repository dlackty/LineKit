//
//  Line.h
//  LKExample
//
//  Created by Chih-Wei Lee on 11/7/12.
//  Copyright (c) 2012 Polydice, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Line : NSObject

+ (BOOL)isLineInstalled;

+ (BOOL)shareText:(NSString *)text;
+ (BOOL)shareImage:(UIImage *)image;

@end
