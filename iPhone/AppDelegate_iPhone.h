//
//  AppDelegate_iPhone.h
//  NoteIt
//
//  Created by icelorc on 2010/12/17.
//  Copyright 2010 Polydice Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate_Shared.h"
#import "NIMainViewController.h"
#import "NIMapViewController.h"
#import "NICalendarViewController.h"
#import "DemoCalendarMonth.h"

@interface AppDelegate_iPhone : AppDelegate_Shared {
  NIMainViewController *_mainViewController;
  NIMapViewController *_mapViewController;
  NICalendarViewController *_calendarViewController;
}

@end

