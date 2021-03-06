//
//  ObjCViewController.m
//  ServiceProviderExample
//
//  Created by Короткий Виталий on 08.06.2018.
//  Copyright © 2018 ProVir. All rights reserved.
//

#import "ObjCViewController.h"
@import ServiceContainerKit;
#import "Example-Swift.h"


@interface ObjCViewController ()

@property (nonatomic, readonly) ServiceContainer* serviceContainer;

@end

@implementation ObjCViewController

- (void) setupWithContainer:(id)container {
    _serviceContainer = container;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (IBAction) testContainer {
    printf("\n\nSTART TEST SERVICE CONTAINER OBJC\n");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        printf("\nSTOP TEST SERVICE CONTAINER OBJC\n");
    });
    
    printf("\nCreate and test FirstService\n");
    FirstService* firstService = [self.serviceContainer.firstServiceProvider getService];
    [firstService test];
    
    printf("\n\nTest shared FirstService\n");
    FirstService* sharedService = self.serviceContainer.sharedFirstService;
    [sharedService test];
    
    printf("\n\nAll experiments completed, removed all services created in current selector.\n");
}

- (IBAction) testLocator {
    printf("\n\nSTART TEST SERVICE LOCATOR OBJC\n");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        printf("\nSTOP TEST SERVICE LOCATOR OBJC\n");
    });
    
    printf("\nCreate and test FirstService\n");
    FirstService* firstService = [ServiceLocator getServiceWithClass:FirstService.class];
    [firstService test];
    
    printf("\n\nTest shared FirstService\n");
    FirstService* sharedService = [ServiceLocator getServiceWithProtocol:@protocol(FirstServiceShared)];
    [sharedService test];
    
    printf("\n\nAll experiments completed, removed all services created in current selector.\n");
}

@end

