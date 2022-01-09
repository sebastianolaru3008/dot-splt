# Data folder
Contains the business logic of the application.

## network_wrapper
Contains a wrapper around http package. This is used to override header and JWT token authorization in one place, rather
than making it in every single call. When using network calls, please provide an instance of Network Wrapper.

## repositories
Repositories represent single source of truth data. Define them as abstract classes and then provide an implementation
for specific cases. When used in another places, the abstract class should be added as dependencies.
