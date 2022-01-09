# Models folder
Contains all the models used in the application.

## JSON models
For JSON models, use the @JSONSerializable() annotation and follow the configuration used in the example_json file

After the JSON model was created, run the following command in a terminal with the folder

```script
flutter pub run build_runner build
```

This will create a generated file with the implementation of fromJson and toJson methods