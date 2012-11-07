//
//  LKViewController.m
//  LKExample
//
//  Created by Chih-Wei Lee on 11/7/12.
//  Copyright (c) 2012 Polydice, Inc. All rights reserved.
//

#import "LKViewController.h"
#import "Line.h"

@implementation LKViewController

#pragma mark - Private

- (BOOL)checkIfLineInstalled {
  BOOL isInstalled = [Line isLineInstalled];
  
  if (!isInstalled) {
    [[[UIAlertView alloc] initWithTitle:@"Line is not installed." message:@"Please download Line from App Store, and try again later." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
  }
  
  return isInstalled;
}

#pragma mark - IBAction

- (IBAction)shareTextButtonClicked:(id)sender {
  if ([self checkIfLineInstalled]) {
    [Line shareText:@"Hello Line!"];
  }
}

- (IBAction)shareImageButtonClicked:(id)sender {
  if ([self checkIfLineInstalled]) {
    UIImagePickerController *controller = [[UIImagePickerController alloc] init];
    controller.delegate = self;
    [self presentViewController:controller animated:YES completion:NULL];
  }
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
  UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
  [Line shareImage:image];
  [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
