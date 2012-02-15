//
//  ViewController.h
//  iOSTicketsDatabaseGenerator
//
//  Created by Anton Poluboiarynov on 2/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UILabel*  _statusLabel;
    UIManagedDocument* _ticketsDatabase;
}

@end
