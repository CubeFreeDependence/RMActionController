//
//  RMCustomViewActionControllerTests.m
//  RMActionController-Demo
//
//  Created by Roland Moers on 20.06.15.
//  Copyright © 2015 Roland Moers. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "RMCustomViewActionController.h"

@interface RMCustomViewActionControllerTests : XCTestCase

@end

@implementation RMCustomViewActionControllerTests

- (void)testPresentingCustomViewActionController {
    XCTestExpectation *expectation = [self expectationWithDescription:@"PresentationCompleted"];
    
    RMCustomViewActionController *controller = [RMCustomViewActionController actionControllerWithStyle:RMActionControllerStyleWhite title:@"Test" message:@"This is a test controller." selectAction:nil andCancelAction:nil];
    
    [controller addAction:[RMAction actionWithTitle:@"Select1" style:RMActionStyleDone andHandler:nil]];
    [controller addAction:[RMAction actionWithTitle:@"Select2" style:RMActionStyleDone andHandler:nil]];
    
    [controller addAction:[RMAction actionWithTitle:@"Cancel1" style:RMActionStyleCancel andHandler:nil]];
    [controller addAction:[RMAction actionWithTitle:@"Cancel2" style:RMActionStyleCancel andHandler:nil]];
    
    [controller addAction:[RMAction actionWithTitle:@"Additional1" style:RMActionStyleAdditional andHandler:nil]];
    [controller addAction:[RMAction actionWithTitle:@"Additional2" style:RMActionStyleAdditional andHandler:nil]];
    
    XCTAssertNotNil(controller.contentView);
    
    BOOL catchedException = NO;
    @try {
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:controller animated:YES completion:^{
            [expectation fulfill];
        }];
    }
    @catch (NSException *exception) {
        catchedException = YES;
    }
    @finally {
        XCTAssertFalse(catchedException);
    }
    
    [self waitForExpectationsWithTimeout:2 handler:nil];
    
    expectation = [self expectationWithDescription:@"DismissalCompleted"];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController dismissViewControllerAnimated:YES completion:^{
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:2 handler:nil];
}

- (void)testPresentingCustomViewActionControllerWithEffectsDisabled {
    XCTestExpectation *expectation = [self expectationWithDescription:@"PresentationCompleted"];
    
    RMCustomViewActionController *controller = [RMCustomViewActionController actionControllerWithStyle:RMActionControllerStyleWhite title:@"Test" message:@"This is a test controller." selectAction:nil andCancelAction:nil];
    
    [controller addAction:[RMAction actionWithTitle:@"Select1" style:RMActionStyleDone andHandler:nil]];
    [controller addAction:[RMAction actionWithTitle:@"Select2" style:RMActionStyleDone andHandler:nil]];
    
    [controller addAction:[RMAction actionWithTitle:@"Cancel1" style:RMActionStyleCancel andHandler:nil]];
    [controller addAction:[RMAction actionWithTitle:@"Cancel2" style:RMActionStyleCancel andHandler:nil]];
    
    [controller addAction:[RMAction actionWithTitle:@"Additional1" style:RMActionStyleAdditional andHandler:nil]];
    [controller addAction:[RMAction actionWithTitle:@"Additional2" style:RMActionStyleAdditional andHandler:nil]];
    
    controller.disableBlurEffects = YES;
    controller.disableBouncingEffects = YES;
    controller.disableMotionEffects = YES;
    
    XCTAssertNotNil(controller.contentView);
    
    BOOL catchedException = NO;
    @try {
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:controller animated:YES completion:^{
            [expectation fulfill];
        }];
    }
    @catch (NSException *exception) {
        catchedException = YES;
    }
    @finally {
        XCTAssertFalse(catchedException);
    }
    
    [self waitForExpectationsWithTimeout:2 handler:nil];
    
    expectation = [self expectationWithDescription:@"DismissalCompleted"];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController dismissViewControllerAnimated:YES completion:^{
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:2 handler:nil];
}

@end
