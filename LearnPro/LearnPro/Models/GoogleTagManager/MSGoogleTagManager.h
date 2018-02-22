//
//  MSGoogleTagManager.h
//  MegaShopping
//
//  Created by Megatex on 11/28/16.
//  Copyright © 2016 Gor Hakobyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TAGManager;
@class TAGContainer;

//@class HBProduct;
//@class HBShoppingCartModel;
//@class HBPurchaseInfo;

extern NSString *const kMSGTMEcommerceListShop;
extern NSString *const kMSGTMEcommerceListSearch;
extern NSString *const kMSGTMEcommerceListUserPosts;
extern NSString *const kMSGTMEcommerceListUserLikes;
extern NSString *const kMSGTMEcommerceListUserProducts;
extern NSString *const kMSGTMEcommerceListUserProductsAdd;
extern NSString *const kMSGTMEcommerceListRelatedPosts;
extern NSString *const kMSGTMEcommerceListRelatedItems;
extern NSString *const kMSGTMEcommerceListDiscover;
extern NSString *const kMSGTMEcommerceListPost;
extern NSString *const kMSGTMEcommerceListPostAdd;
extern NSString *const kMSGTMEcommerceListBrandProducts;

extern NSUInteger const kMSGTMEcommerceCheckoutStepReviewCart;
extern NSUInteger const kMSGTMEcommerceCheckoutStepShippingPaymentInfo;
extern NSUInteger const kMSGTMEcommerceCheckoutStepPurchaseCompleted;

extern NSString *const kMSGTMEcommerceAffiliationOnlineStore;

@interface MSGoogleTagManager : NSObject

@property (nonatomic, strong, readonly) TAGManager *tagManager;
@property (nonatomic, strong, readonly) TAGContainer *container;

//+ (instancetype)sharedInstance;
//
//+ (void)startWithContainerId:(NSString *)containerId;
//
//+ (void)sendScreenViewWithName:(NSString *)screenName;
//
//+ (void)sendEvent:(NSString *)eventName withVariables:(NSDictionary *)variables;
//
////+ (void)sendProductImpression:(HBProduct *)product list:(NSString *)list;
////+ (void)sendProductClick:(HBProduct *)product list:(NSString *)list;
////+ (void)sendProductDetails:(HBProduct *)product list:(NSString *)list;
////
////+ (void)sendAddToShoppingCart:(HBShoppingCartModel *)cartItem;
////+ (void)sendRemoveFromShoppingCart:(HBShoppingCartModel *)cartItem;
////+ (void)sendAddToShoppingCart:(HBShoppingCartModel *)cartItem quantity:(NSUInteger)quantity;
////+ (void)sendRemoveFromShoppingCart:(HBShoppingCartModel *)cartItem quantity:(NSUInteger)quantity;
//
//+ (void)sendCheckoutStep:(NSUInteger)step withShoppingCartItems:(NSSet *)cartItems;
//+ (void)sendCheckoutStep:(NSUInteger)step option:(NSString *)option withShoppingCartItems:(NSSet *)cartItems;
//+ (void)sendCheckoutOptionStep:(NSUInteger)step option:(NSString *)option;
//+ (void)abandonCheckout;
//
////+ (void)sendPurchase:(HBPurchaseInfo *)purchase;
//+ (void)sendRefundWithTransactionId:(NSString *)transactionId orderItems:(NSSet *)items;

@end
