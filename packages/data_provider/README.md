A package which handle 3rd layer data from out.

Where the all api requests implemented there.

## Features

- Token to Header
- Language to Header
- Request Logger
- API request
- Models with json parsers generated using `json_annotation`

## Getting started

[Swagger API documentaion](https://food.asmanexpress.com/api/documentation)

In `src/api/` folder exists base custom HTTP class with interceptors implements.

In `src/models/` folder exists all models used to parse json data from api response.

In `src/client/` folder exists all api request methods implements that backend gives to us.

## Usage

1. Initialize HTTP client
2. Use created instance for API clients
3. Get data from server

```dart
    /// HTTP Client
    final httpClient = Http(
      defaultBaseUrl: defaultBaseUrl,
      tokenProvider: tokenStorage.readToken,
      languageProvider: settingsStorage.fetchAppLanguage,
    );

    /// Example API client
    final exampleClient = ExampleClient(
        httpClient: httpClient,
    );

    /// Get data from server
    final response = exampleClient.getData();
```

## Additional information

Atasan Bratan _+99364530230_
