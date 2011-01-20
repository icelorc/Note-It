//
//  NIPhotoViewController.h
//  NoteIt
//
//  Created by icelorc on 2010/12/18.
//  Copyright 2010 Polydice Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NIPhotoDetailViewController.h"

@interface NIPhotoViewController : UIViewController <UIImagePickerControllerDelegate, NIPhotoDetailViewControllerDelegate>{
  UIImageView *imageView;
  UIToolbar *myToolbar;
  
  NIPhotoDetailViewController *photoDetailViewController; // the camera custom overlay view
  
  NSMutableArray *capturedImages; // the list of images captures from the camera (either 1 or multiple)
}

@property (nonatomic, retain)IBOutlet UIImageView *imageView;
@property (nonatomic, retain)IBOutlet UIToolbar *myToolbar;

@property (nonatomic, retain)NIPhotoDetailViewController *photoDetailViewController;

@property (nonatomic, retain)NSMutableArray *capturedImages;

// toolbar buttons
- (IBAction)photoLibraryAction:(id)sender;
- (IBAction)cameraAction:(id)sender;

@end
