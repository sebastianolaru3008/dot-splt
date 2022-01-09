# bloc folder
Contains the folders for the BLoC architecture using flutter_bloc package.

## app_bloc_observer.dart

Configuration file for the BLoC pattern

## BLoC folder structure

As seen in the example folder, each BLoC should contain the following dart files:

```script
[BlocName]_bloc.dart -> contains the implementation of the BLoC, corellating the events to states.
[BlocName]_event.dart -> contains the BLoC events which will be triggered by UI
[BlocName]_state.dart -> contains the state which will be consumed by UI
```

A broader description of the BLoC architecture can be found in the Wiki




