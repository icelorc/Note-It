//
//  NIPhotoViewController.m
//  NoteIt
//
//  Created by icelorc on 2010/12/18.
//  Copyright 2010 Polydice Inc. All rights reserved.
//

#import "NIPhotoViewController.h"


@implementation NIPhotoViewController

@synthesize imageView, myToolbar, photoDetailViewController, capturedImages;


#pragma mark -
#pragma mark View Controller

- (void)viewDidLoad
{
  self.photoDetailViewController =
  [[[NIPhotoDetailViewController alloc] initWithNibName:@"NIPhotoDetailViewController" bundle:nil] autorelease];
  
  // as a delegate we will be notified when pictures are taken and when to dismiss the image picker
  self.photoDetailViewController.delegate = self;
  
  self.capturedImages = [NSMutableArray array];
  
  if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
  {
    // camera is not on this device, don't show the camera button
    NSMutableArray *toolbarItems = [NSMutableArray arrayWithCapacity:self.myToolbar.items.count];
    [toolbarItems addObjectsFromArray:self.myToolbar.items];
    [toolbarItems removeObjectAtIndex:2];
    [self.myToolbar setItems:toolbarItems animated:NO];
  }
}

- (void)viewDidUnload
{
  self.imageView = nil;
  self.myToolbar = nil;
  
  self.photoDetailViewController = nil;
  self.capturedImages = nil;
}

- (void)dealloc
{	
	[imageView release];
	[myToolbar release];
  
  [photoDetailViewController release];
	[capturedImages release];
  
  [super dealloc];
}


#pragma mark -
#pragma mark Toolbar Actions

- (void)showImagePicker:(UIImagePickerControllerSourceType)sourceType
{
  if (self.imageView.isAnimating)
    self.imageView.stopAnimating;
	
  if (self.capturedImages.count > 0)
    [self.capturedImages removeAllObjects];
  
  if ([UIImagePickerController isSourceTypeAvailable:sourceType])
  {
    [self.photoDetailViewController setupImagePicker:sourceType];
    [self presentModalViewController:self.photoDetailViewController.imagePickerController animated:YES];
  }
}

- (IBAction)photoLibraryAction:(id)sender
{   
	[self showImagePicker:UIImagePickerControllerSourceTypePhotoLibrary];
}

- (IBAction)cameraAction:(id)sender
{
  [self showImagePicker:UIImagePickerControllerSourceTypeCamera];
}


#pragma mark -
#pragma mark NIPhotoDetailViewControllerDelegate

// as a delegate we are being told a picture was taken
- (void)didTakePicture:(UIImage *)picture
{
  [self.capturedImages addObject:picture];
}

// as a delegate we are told to finished with the camera
- (void)didFinishWithCamera
{
  [self dismissModalViewControllerAnimated:YES];
  
  if ([self.capturedImages count] > 0)
  {
    if ([self.capturedImages count] == 1)
    {
      // we took a single shot
      [self.imageView setImage:[self.capturedImages objectAtIndex:0]];
    }
    else
    {
      // we took multiple shots, use the list of images for animation
      self.imageView.animationImages = self.capturedImages;
      
      if (self.capturedImages.count > 0)
        // we are done with the image list until next time
        [self.capturedImages removeAllObjects];  
      
      self.imageView.animationDuration = 5.0;    // show each captured photo for 5 seconds
      self.imageView.animationRepeatCount = 0;   // animate forever (show all photos)
      self.imageView.startAnimating;
    }
  }
}

@end