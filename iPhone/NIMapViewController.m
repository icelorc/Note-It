//
//  NIMapViewController.m
//  NoteIt
//
//  Created by icelorc on 2010/12/18.
//  Copyright 2010 Polydice Inc. All rights reserved.
//

#import "NIMapViewController.h"


@implementation NIMapViewController

@synthesize mapView = _mapView;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
      self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:@"Map" image:[UIImage imageNamed:@"Scanner.png"] tag:1] autorelease];
      self.title = @"Map";
    }
    return self;
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
  [super viewDidLoad];
  self.mapView.showsUserLocation = YES;
  
  CLLocationCoordinate2D coordinate;
  coordinate.latitude = 24.778289;
  coordinate.longitude = 120.988108;
  DDAnnotation *annotation = [[[DDAnnotation alloc] initWithCoordinate:coordinate addressDictionary:nil] autorelease];
  annotation.title = @"鐵人三項final exam";
  [self.mapView addAnnotation:annotation];
  
  CLLocationCoordinate2D coordinate1;
  coordinate1.latitude = 25.043059;
  coordinate1.longitude = 121.521309;
  DDAnnotation *annotation1 = [[[DDAnnotation alloc] initWithCoordinate:coordinate1 addressDictionary:nil] autorelease];
  annotation1.title = @"統計期末考";
  [self.mapView addAnnotation:annotation1];
  
  CLLocationCoordinate2D coordinate2;
  coordinate2.latitude = 24.98670;
  coordinate2.longitude = 121.577698;
  DDAnnotation *annotation2 = [[[DDAnnotation alloc] initWithCoordinate:coordinate2 addressDictionary:nil] autorelease];
  annotation2.title = @"念書";
  [self.mapView addAnnotation:annotation2];

}

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


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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
