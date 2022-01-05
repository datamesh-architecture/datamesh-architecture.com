Shopify API

https://shopify.dev/api/admin-rest/2021-10/resources/event#top

Article
---
- create
- destroy
- published
- unpublished
- update

Order Events
---
- authorization_failure
- authorization_pending
- authorization_success
- cancelled
- capture_failure
- capture_pending
- capture_success
- closed
- confirmed
- fulfillment_cancelled
- fulfillment_pending
- fulfillment_success
- mail_sent
- placed
- re_opened
- refund_failure
- refund_pending
- refund_success
- restock_line_items
- sale_failure
- sale_pending
- sale_success
- update
- void_failure
- void_pending
- void_success

Fulfillment Event
---
- label_printed: A label for the shipment was purchased and printed.
- label_purchased: A label for the shipment was purchased, but not printed.
- attempted_delivery: Delivery of the shipment was attempted, but unable to be completed.
- ready_for_pickup: The shipment is ready for pickup at a shipping depot.
- picked_up: The fulfillment was successfully picked up.
- confirmed: The carrier is aware of the shipment, but hasn't received it yet.
- in_transit: The shipment is being transported between shipping facilities on the way to its destination.
- out_for_delivery: The shipment is being delivered to its final destination.
- delivered: The shipment was successfully delivered.
- failure: Something went wrong when pulling tracking information for the shipment, such as the tracking number was invalid or the shipment was canceled.

Inventory
---

- {organization}-fulfillment.data_products.inventory_item
- {organization}-fulfillment.data_products.inventory_level
- {organization}-fulfillment.data_products.inventory_level_historical
- {organization}-fulfillment.data_products.inventory_level_by_location
- {organization}-fulfillment.data_products.inventory_level_by_location_historical



---

Customer Journey

Awareness / Search
- Products
- Articles
- Recommendations
- SEO
- Navigation
- Filters/Categories

Consider and Decide / Product Details
- Inventory
- Articles
- Sizes
- Images
- Availability

Purchase
- Shopping Cart
- Order
- Customer
- Payment
- Fraud

Fulfillment
- Stock/Inventory https://shopify.dev/api/admin-rest/2021-10/resources/fulfillmentevent#[get]/admin/api/2021-10/orders/{order_id}/fulfillments/{fulfillment_id}/events.json
    - {organization}-fulfillment.data_products.stock
    - {organization}-fulfillment.data_products.stock_historical
- Shipments
- Carrier

Service
- Cancellations
- Support Contacts
- Refunds

Returns

