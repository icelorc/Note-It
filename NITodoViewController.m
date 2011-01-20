//
//  NITodoViewController.m
//  NoteIt
//
//  Created by icelorc on 2010/12/18.
//  Copyright 2010 Polydice Inc. All rights reserved.
//

#import "NITodoViewController.h"


@implementation NITodoViewController


#pragma mark -
#pragma mark Initialization


- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    self = [super initWithStyle:style];
    if (self) {
      _todoItems = [NSArray arrayWithObjects:@"Photo", @"Name", @"Location", @"Due Date", @"Calendar", @"Note", nil];
    }
    return self;
}

- (void)done {
  
}


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
  UIBarButtonItem *doneButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done)] autorelease];
  UIBarButtonItem *cancelButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(dismissModalViewControllerAnimated:)];
  self.navigationItem.leftBarButtonItem = cancelButtonItem;
  self.navigationItem.rightBarButtonItem = doneButtonItem;
  self.title = @"Todo";
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 6;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"ToDoCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
       cell.textLabel.text = [_todoItems objectAtIndex:indexPath.row];
      
     if (indexPath.row != 1) {
       cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
     }
    }
    
    return cell;
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
  if (indexPath.row == 0) {
    NIPhotoViewController *photoViewController = [[NIPhotoViewController alloc] initWithNibName:@"NIPhotoViewController" bundle:nil];
    [self.navigationController pushViewController:photoViewController animated:YES];
    [photoViewController release];      
  } else if (indexPath.row == 2) {
    NIAddLocationViewController *addLocationViewController = [[NIAddLocationViewController alloc] initWithNibName:@"NIAddLocationViewController" bundle:nil];
    [self.navigationController pushViewController:addLocationViewController animated:YES];
    [addLocationViewController release];
  } else if (indexPath.row == 3) {
    DemoCalendarMonth *calendar = [[DemoCalendarMonth alloc] initWithSunday:YES];
    [self.navigationController pushViewController:calendar animated:YES];
    [calendar release];
  } else if (indexPath.row == 4) {
    NIDetailCategoryViewController *detailViewController = [[NIDetailCategoryViewController alloc] initWithStyle:UITableViewStyleGrouped];
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
  }
     
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end

