//
//  NIMapViewController.h
//  NoteIt
//
//  Created by icelorc on 2010/12/18.
//  Copyright 2010 Polydice Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "DDAnnotation.h"
#import "DDAnnotationView.h"


@interface NIMapViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>{
  MKMapView *_mapView;
}

@property (nonatomic, retain)IBOutlet MKMapView *mapView;

@end
