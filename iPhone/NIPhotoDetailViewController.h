//
//  NIPhotoDetailViewController.h
//  NoteIt
//
//  Created by icelorc on 2010/12/18.
//  Copyright 2010 Polydice Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioServices.h>

@protocol NIPhotoDetailViewControllerDelegate;

@interface NIPhotoDetailViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
  id <NIPhotoDetailViewControllerDelegate> delegate;
  
  UIImagePickerController *_imagePickerController;
  
  UIBarButtonItem *_takePictureButton;
  UIBarButtonItem *_startStopButton;
  UIBarButtonItem *_timedButton;
  UIBarButtonItem *_cancelButton;
  
  NSTimer *_tickTimer;
  NSTimer *_cameraTimer;
  
  SystemSoundID tickSound;
}    

@property (nonatomic, assign) id <NIPhotoDetailViewControllerDelegate> delegate;
@property (nonatomic, retain) UIImagePickerController *imagePickerController;

@property (nonatomic, retain) IBOutlet UIBarButtonItem *takePictureButton;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *startStopButton;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *timedButton;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *cancelButton;

@property (nonatomic, retain) NSTimer *tickTimer;
@property (nonatomic, retain) NSTimer *cameraTimer;

- (void)setupImagePicker:(UIImagePickerControllerSourceType)sourceType;

- (IBAction)done;
- (IBAction)takePhoto;
- (IBAction)startStop;
- (IBAction)timedTakePhoto;

@end

@protocol NIPhotoDetailViewControllerDelegate
- (void)didTakePicture:(UIImage *)picture;
- (void)didFinishWithCamera;
@end
