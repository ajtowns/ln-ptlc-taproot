# Layered transactions

When dealing with payment channels we have two timeouts to consider:

 * the payment timeout, after which the sender of the payment can
   require a refund if the payment hasn't completed.

 * the revocation timeout, after which the channel state can be considered
   final, and not subject to being updated (eg in eltoo channels) or
   subject to a penalty (eg in current Poon-Dryja channels).

The interaction between these two timeouts can cause problems.

## Without layered commitments

The worst case scenario for obtaining a refund occurs when you're
forwarding a payment, and the node to which you've forwarded the payment
has gone completely offline, forcing you to drop the channel to the
blockchain.

In this case, without layered commitments, in order to claim the funds...

![no layers sequence diagram](layered-no-layers.png)

