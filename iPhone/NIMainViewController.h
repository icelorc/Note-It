//
//  NIMainViewController.h
//  NoteIt
//
//  Created by icelorc on 2010/12/18.
//  Copyright 2010 Polydice Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NITodoViewController.h"
#import "NIToDo.h"


@interface NIMainViewController : UITableViewController {
  NSMutableArray *_todos, *_todos2, *_todos3;
  NSArray *_categories;
}

@end
