//
//  NIToDo.h
//  NoteIt
//
//  Created by icelorc on 2010/12/21.
//  Copyright 2010 Polydice Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NIToDo : NSObject {
  UIImageView *_photo;
  NSString *_name;
  NSNumber *_latitude;
  NSNumber *_longitude;
  NSString *_dualDate;
  NSInteger _calendar;
}

@property (nonatomic, retain)UIImageView *photo;
@property (nonatomic, retain)NSString *name;
@property (nonatomic, retain)NSNumber *latitude;
@property (nonatomic, retain)NSNumber *longitude;
@property (nonatomic, retain)NSString *dualDate;
@property (nonatomic)NSInteger calendar;

@end
