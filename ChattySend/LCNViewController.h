//
//  LCNViewController.h
//  ChattySend
//
//  Created by Lisa Noschese on 7/31/14.
//  Copyright (c) 2014 Lisa Noschese. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCNViewController : UIViewController <UIImagePickerControllerDelegate
, UINavigationControllerDelegate>

@property (nonatomic) NSInteger ImageIndex;

- (IBAction)cameraTapped:(id)sender;
- (IBAction)shareTapped:(id)sender;

@end
