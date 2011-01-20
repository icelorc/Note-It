//
//  DDAnnotation.h
//  EDCamViewer
//
//  Created by icelorc on 2010/9/30.
//  Copyright 2010 Polydice Inc. All rights reserved.
//

#import <MapKit/MapKit.h>


@interface DDAnnotation : MKPlacemark {
  CLLocationCoordinate2D _coordinate;
  NSString *_title;
  NSString *_subtitle;  
}

@property (nonatomic, readwrite, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *subtitle;

@end
