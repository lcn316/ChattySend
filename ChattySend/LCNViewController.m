//
//  LCNViewController.m
//  ChattySend
//
//  Created by Lisa Noschese on 7/31/14.
//  Copyright (c) 2014 Lisa Noschese. All rights reserved.
//

#import "LCNViewController.h"
#import "LCNAppDelegate.h"
@interface LCNViewController () {
    IBOutlet UIImageView *myImageView;
    IBOutlet UITextField *myTextField;
    
    LCNAppDelegate *myDelegate;
}

- (UIImage *)saveImageMessage;

@end

@implementation LCNViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    UIBarButtonItem *cameraButton = [[UIBarButtonItem alloc]
        initWithBarButtonSystemItem:UIBarButtonSystemItemCamera
        target:self action:@selector(cameraTapped:)];
    UIBarButtonItem *shareButton = [[UIBarButtonItem alloc]
        initWithBarButtonSystemItem:UIBarButtonSystemItemAction
        target:self action:@selector(shareTapped:)];
            
            self.navigationItem.rightBarButtonItems = @[cameraButton,shareButton];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.ImageIndex >= 0) {
        myTextField.text = myDelegate.imageTexts[self.ImageIndex];
        myImageView.image = myDelegate.images[self.ImageIndex];
}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cameraTapped:(id)sender
{
    UIImagePickerController *myPicker = [[UIImagePickerController alloc] init];
    myPicker.delegate = self;
    [self presentViewController:myPicker animated:YES completion:nil];
}

- (IBAction)shareTapped:(id)sender {
    UIImage *savedImage = [self saveImageMessage];
    
    UIActivityViewController *myActivityController = [[UIActivityViewController alloc] initWithActivityItems:@[savedImage] applicationActivities:nil];
        
        [self presentViewController:myActivityController animated: YES completion:nil];
                                                      
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *selectedImage = info
        [UIImagePickerControllerOriginalImage];
    [myImageView setImage:selectedImage];
    if (self.ImageIndex >=0) {
        myDelegate.images[self.ImageIndex] = selectedImage;
    } else {
        [myDelegate.images addObject:selectedImage];
    }

    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    if (self.ImageIndex >=0) {
        myDelegate.imageTexts[self.ImageIndex] = textField.text;
    } else {
        [myDelegate.imageTexts addObject:textField.text];
        
    return YES;
}

    //- (UIImage *)saveImageMessage {
        UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, self.view.opaque, 0.0);
        [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage *imageView = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return imageView;
    }

@end