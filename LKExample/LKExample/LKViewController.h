//
//  LKViewController.h
//  LKExample
//
//  Created by Chih-Wei Lee on 11/7/12.
//  Copyright (c) 2012 Polydice, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LKViewController : UIViewController <
UINavigationControllerDelegate,
UIImagePickerControllerDelegate>

- (IBAction)shareTextButtonClicked:(id)sender;
- (IBAction)shareImageButtonClicked:(id)sender;

@end
