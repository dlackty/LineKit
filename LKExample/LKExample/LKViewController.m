//  LKViewController.m
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

- (IBAction)openLineInAppStoreButtonClicked:(id)sender {
  [Line openLineInAppStore];
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
  UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
  [Line shareImage:image];
  [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
