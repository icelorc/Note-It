//
//  NIToDo.m
//  NoteIt
//
//  Created by icelorc on 2010/12/21.
//  Copyright 2010 Polydice Inc. All rights reserved.
//

#import "NIToDo.h"


@implementation NIToDo

@synthesize photo = _photo;
@synthesize name = _name;
@synthesize latitude = _latitude;
@synthesize longitude = _longitude;
@synthesize dualDate = _dualDate;
@synthesize calendar = _calendar;

- (id)init {
  if (self = [super init]) {
    
  }
  
  return self;
}

@end
