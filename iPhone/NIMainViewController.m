//
//  NIMainViewController.m
//  NoteIt
//
//  Created by icelorc on 2010/12/18.
//  Copyright 2010 Polydice Inc. All rights reserved.
//

#import "NIMainViewController.h"


@implementation NIMainViewController


#pragma mark -
#pragma mark Initialization


- (id)initWithStyle:(UITableViewStyle)style {
  // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
  self = [super initWithStyle:style];
  if (self) {
    self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:@"ToDos" image:[UIImage imageNamed:@"Clipboard.png"] tag:0] autorelease];
    _categories = [[NSArray alloc] initWithObjects:@"School", @"Exercise", @"Life", @"Entertainment", @"Work", nil];
    _todos = [[NSMutableArray alloc] init];
    _todos2 = [[NSMutableArray alloc] init];
    NIToDo *todo1 = [[NIToDo alloc] init];
    todo1.name = @"鐵人三項final exam";  
    //todo1.latitude = @"24.778289";
    //todo1.longitude = @"120.988108";
    todo1.dualDate = @"2011/01/12";
    
    [_todos addObject:todo1];
    
    NIToDo *todo2 = [[NIToDo alloc] init];
    todo2.name =@"統計期末考";  
    //todo2.latitude=@"25.043059";
    //todo2.longitude=@"121.521309";
    todo2.dualDate=@"2011/12/23";

    [_todos2 addObject:todo2];
    
    NIToDo *todo3 = [[NIToDo alloc] init];
    todo3.name =@"念書!";  
    //todo3.latitude=@"24.986701";
    //todo3.longitude=@"121.577698";
    todo3.dualDate=@"2010/12/22";
    [_todos addObject:todo3];
    
    _todos3 = [[NSMutableArray alloc] init];
    
    NIToDo *todo4 = [[NIToDo alloc] init];
    todo4.name =@"Eric's B-day";  
    //todo4.latitude=@"25.159194";
    //todo4.longitude=@"121.427932";
    todo4.dualDate=@"2011/10/3";
    //todo4.calendar=@"entertainment";
    
    [_todos3 addObject:todo4];
    
    NIToDo *todo5 = [[NIToDo alloc] init];
    todo5.name =@"龍願travel";  
    //todo5.latitude=@"22.396428";
    //todo5.longitude=@"114.109497";
    todo5.dualDate=@"2010/08/09";
    //todo5.calendar=@"entertainment";
    
    [_todos3 addObject:todo5];
    
    NIToDo *todo7 = [[NIToDo alloc] init];

    todo7.name =@"EXPO";  
    //todo7.latitude=@"31.230393";
    //todo7.longitude=@"121.473704";
    todo7.dualDate=@"2010/08/11";
    //todo7.calendar=@"entertainment";
    [_todos3 addObject:todo7];

    NIToDo *todo8 = [[NIToDo alloc] init];

    todo8.name =@"把妹";  
   // todo8.latitude=@"24.150187";
    //todo8.longitude=@"120.642999";
    todo8.dualDate=@"2010/08/16";
    //todo8.calendar=@"entertainment";
    [_todos3 addObject:todo8];

  }
  return self;
}


-(void)addButton {
  NITodoViewController *todoViewController = [[NITodoViewController alloc] initWithStyle:UITableViewStyleGrouped];
  UINavigationController *todoNavigationViewController = [[UINavigationController alloc] initWithRootViewController:todoViewController];
  [self presentModalViewController:todoNavigationViewController animated:YES];
  [todoViewController release];
  [todoNavigationViewController release];
}

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
  [super viewDidLoad];

  self.title = @"Note it!!";
  
  self.tableView.allowsSelectionDuringEditing = YES;

  UIBarButtonItem *addButtomItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButton)];
  self.navigationItem.rightBarButtonItem = addButtomItem;
  self.navigationItem.leftBarButtonItem = self.editButtonItem;
}


/*
 - (void)viewWillAppear:(BOOL)animated {
 [super viewWillAppear:animated];
 }
 */
/*
 - (void)viewDidAppear:(BOOL)animated {
 [super viewDidAppear:animated];
 }
 */
/*
 - (void)viewWillDisappear:(BOOL)animated {
 [super viewWillDisappear:animated];
 }
 */
/*
 - (void)viewDidDisappear:(BOOL)animated {
 [super viewDidDisappear:animated];
 }
 */
/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations.
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  // Return the number of sections.
  return [_categories count];
}

- (NSString *)tableView:(UITableView *)table titleForFooterInSection:(NSInteger)section {
  return [_categories objectAtIndex:section];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  // Return the number of rows in the section.
  
  if (section == 0) {
    return [_todos count];
  } else if (section == 2) {
    return [_todos3 count];
  }{
    return [_todos2 count];
  }

  
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
  static NSString *CellIdentifier = @"Cell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    if (indexPath.section == 0) {
      cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
      cell.backgroundColor = [UIColor colorWithRed:((0xF90000) >> 16) / 255.0  green:(((0xF20000) >> 16) / 255.0) blue:(((0xA60000) >> 16) / 255.0) alpha:1.0];
      cell.textLabel.text = [[_todos objectAtIndex:indexPath.row] name];
      cell.imageView.image = [UIImage imageNamed:@"3.png"];
      cell.detailTextLabel.text = [[_todos objectAtIndex:indexPath.row] dualDate];
    } else if (indexPath.section == 2) {
      cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
      cell.backgroundColor = [UIColor colorWithRed:((0xF90000) >> 16) / 255.0  green:(((0xF20000) >> 16) / 255.0) blue:(((0xA60000) >> 16) / 255.0) alpha:1.0];
      cell.textLabel.text = [[_todos3 objectAtIndex:indexPath.row] name];
      if (indexPath.row == 0) {
        cell.imageView.image = [UIImage imageNamed:@"8.png"];
      } else {
        cell.imageView.image = [UIImage imageNamed:@"5.png"];
      }
      cell.detailTextLabel.text = [[_todos3 objectAtIndex:indexPath.row] dualDate];
    } else {
      cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
      cell.backgroundColor = [UIColor colorWithRed:((0xF90000) >> 16) / 255.0  green:(((0xF20000) >> 16) / 255.0) blue:(((0xA60000) >> 16) / 255.0) alpha:1.0];
      cell.textLabel.text = [[_todos2 objectAtIndex:indexPath.row] name];
      if (indexPath.row == 0) {
         cell.imageView.image = [UIImage imageNamed:@"exercise.jpg"];
      } else {
         cell.imageView.image = [UIImage imageNamed:@"6.png"];
      }

     
      cell.detailTextLabel.text = [[_todos2 objectAtIndex:indexPath.row] dualDate];
    }
    
  }
  
  // Configure the cell...
  
  return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
}
 


 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source.
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
 }   
}
 



 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 



 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
  if (self.editing) {
    NITodoViewController *todoViewController = [[NITodoViewController alloc] initWithStyle:UITableViewStyleGrouped];
    UINavigationController *todoNavigationViewController = [[UINavigationController alloc] initWithRootViewController:todoViewController];
    [self presentModalViewController:todoNavigationViewController animated:YES];
    [todoViewController release];
    [todoNavigationViewController release];
  } else {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType =  UITableViewCellAccessoryCheckmark;
    UIAlertView *alerView = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Are you sure you have done this todo?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
    [alerView show];
    [alerView release];
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

