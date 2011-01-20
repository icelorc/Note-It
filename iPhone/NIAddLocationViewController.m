//
//  NIAddLocationViewController.m
//  NoteIt
//
//  Created by icelorc on 2010/12/19.
//  Copyright 2010 Polydice Inc. All rights reserved.
//

#import "NIAddLocationViewController.h"

@implementation NIAddLocationViewController

@synthesize mapView = _mapView;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
 if (self) {
 // Custom initialization.
 }
 return self;
 }
 */

- (void)locate {
  DDAnnotation *annotation = [[[DDAnnotation alloc] initWithCoordinate:self.mapView.userLocation.coordinate addressDictionary:nil] autorelease];
  annotation.title = @"ToDo";
  [self.mapView addAnnotation:annotation];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.mapView.showsUserLocation = YES;
	[self.mapView setDelegate: self];
	[self.mapView setMapType: MKMapTypeStandard];
	self.mapView.scrollEnabled = YES; 
	self.mapView.zoomEnabled = YES; 
  UIBarButtonItem *locateButton = [[UIBarButtonItem alloc] initWithTitle:@"Drop Pin" style:UIBarButtonItemStyleBordered target:self action:@selector(locate)];
  self.navigationItem.rightBarButtonItem = locateButton;
  
}

#pragma mark -
#pragma mark annotations method

- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views { 
  MKAnnotationView *aV; 
  for (aV in views) {
    CGRect endFrame = aV.frame;
    
    aV.frame = CGRectMake(aV.frame.origin.x, aV.frame.origin.y - 230.0, aV.frame.size.width, aV.frame.size.height);
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.45];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [aV setFrame:endFrame];
    [UIView commitAnimations];
    
  }
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)annotationView didChangeDragState:(MKAnnotationViewDragState)newState fromOldState:(MKAnnotationViewDragState)oldState {
	if (oldState == MKAnnotationViewDragStateDragging) {
		DDAnnotation *annotation = (DDAnnotation *)annotationView.annotation;
    double latitude = annotation.coordinate.latitude;
    double longitude = annotation.coordinate.longitude;
}
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
  
  if ([[annotation title] isEqualToString:@"Current Location"]) {
    return nil;		
	}
	
	static NSString * const kPinAnnotationIdentifier = @"PinIdentifier";
	MKAnnotationView *draggablePinView = [mapView dequeueReusableAnnotationViewWithIdentifier:kPinAnnotationIdentifier];
	
	if (draggablePinView) {
		draggablePinView.annotation = annotation;
	} else {		
		// Use class method to create DDAnnotationView (on iOS 3) or built-in draggble MKPinAnnotationView (on iOS 4).
    draggablePinView = [DDAnnotationView annotationViewWithAnnotation:annotation reuseIdentifier:kPinAnnotationIdentifier mapView:self.mapView];
    if ([draggablePinView isKindOfClass:[DDAnnotationView class]]) {
      // draggablePinView is DDAnnotationView on iOS 3.
    } else {
      // draggablePinView instance will be built-in draggable MKPinAnnotationView when running on iOS 4.
    }
	}		
  
  UIButton *button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
  [button addTarget:self action:@selector(toLiveView) forControlEvents:UIControlEventTouchDown];
  draggablePinView.rightCalloutAccessoryView = button;
  
	return draggablePinView;
}


- (void)didReceiveMemoryWarning {
  // Releases the view if it doesn't have a superview.
  [super didReceiveMemoryWarning];
  
  // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
  [super viewDidUnload];
  // Release any retained subviews of the main view.
  // e.g. self.myOutlet = nil;
}


- (void)dealloc {
  [super dealloc];
}


@end
