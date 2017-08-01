BasicLambda
-----------

A basic example of an AWS Lambda function written in Purescript.

AWS Lambda expects a multi-parameter handler. We implemented a small handler in
javascript that calls immediately into our Purescript handler.

The first argument to the handler is the event data. This is a javascript
object. We define a data type to contain the data we expect. We handle the data
as a Foreign. This allows us to enjoy a measure of type safety when processing
data.

The second argument is a context object, which contains the succeed and fail
callbacks. We use FFI to write succeed and fail functions that we can use to
trigger these callbacks. We define LAMBDA effects to represent the side effects
of calling this context methods.

This just demonstrates one way that we could create a Lambda function using
Purescript. There are some limitations with this implementation.

The Context does not have any type guarantees. If you swap the order of the
arguments in index.js, you will get a runtime error. To take full advantage of
the type system, we would also need to treat Context as a Foreign type.

We did not do anything asynchronous in this example. A more realistic example
would call out to an external service. An S3 event example might be more
instructive.

## Build and Install

To create your own Lambda package:

```
$> git clone https://github.com/kofno/BasicLambda
$> cd BasicLambda
$> bower up
$> npm run build
$> npm run package
```
To install, upload the deploy.zip file as your own Lambda function.

