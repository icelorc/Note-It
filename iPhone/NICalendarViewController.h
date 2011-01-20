//
//  NICalendarViewController.h
//  NoteIt
//
//  Created by icelorc on 2010/12/18.
//  Copyright 2010 Polydice Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../src/TapkuLibrary/TapkuLibrary.h"

@interface NICalendarViewController : TKCalendarMonthTableViewController{
	NSMutableArray *dataArray; 
	NSMutableDictionary *dataDictionary;
}

@property (retain,nonatomic) NSMutableArray *dataArray;
@property (retain,nonatomic) NSMutableDictionary *dataDictionary;

- (void) generateRandomDataForStartDate:(NSDate*)start endDate:(NSDate*)end;

@end

