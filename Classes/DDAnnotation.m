//
//  DDAnnotation.m
//  EDCamViewer
//
//  Created by icelorc on 2010/9/30.
//  Copyright 2010 Polydice Inc. All rights reserved.
//

#import "DDAnnotation.h"


@implementation DDAnnotation

@synthesize coordinate = _coordinate, title = _title, subtitle = _subtitle;

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate addressDictionary:(NSDictionary *)addressDictionary {
  
	if ((self = [super initWithCoordinate:coordinate addressDictionary:addressDictionary])) {
		self.coordinate = coordinate;
	}
	return self;
}

@end
