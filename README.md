# Marlow

Marlow is a small Flutter shop front built against the public [DummyJSON](https://dummyjson.com) API. Sign in, then browse a paginated product list and open any product for its details.

Demo account: `emilys` / `emilyspass`

## Run

```bash
flutter pub get
flutter run
```

Tests:

```bash
flutter test
```

## What it does

- **Login** posts to `POST /auth/login`. The access token and refresh token are stored with `flutter_secure_storage` (Keychain on iOS and macOS, Keystore-backed AES-GCM on Android). The next launch skips login when an access token is already stored.
- **Products** loads `GET /products?limit=10&skip=…`. A page that was opened before is shown from disk immediately, then replaced when the network responds. The list has a loading shimmer, an error view with retry, an empty view, pull-to-refresh, and pagination as you scroll. A short first page also keeps loading until the screen is filled or the catalog ends.
- **Detail** loads `GET /products/{id}` and shows images, price, rating, stock, description, and reviews. If that product is already in the saved catalog, it opens without waiting for the network.
- Authenticated requests send `Authorization: Bearer <accessToken>`. A `401` while a session is stored calls `POST /auth/refresh`, saves the new access and refresh tokens, and retries the request once. If that refresh fails, the session is cleared and the app returns to login.

## Structure

GetX is used for state, routing, and dependency injection.For complex applications we will use Bloc. The domain layer does not import GetX, Dio, or Flutter.

```
lib/
  app/            composition root: routes, theme, Dio, bindings
  core/           failures, HTTP client, shared widgets
  features/
    auth/
      domain/     User, AuthRepository, use cases
      data/       DummyJSON + secure storage
      presentation/
    products/
      domain/     Product, ProductRepository, use cases
      data/       DummyJSON plus the on-device catalog
      presentation/
```

Dependencies point inward: presentation and data depend on domain. Domain only depends on the pure-Dart `Result` and `Failure` types.

## Decisions

**Clean architecture.** Login and products each have a domain repository and a use case. Controllers talk to use cases, not to Dio. That keeps parsing, token storage, and widgets independently testable.

**GetX.** Route bindings create controllers. `InitialBinding` creates the long-lived graph (storage, Dio, repositories, use cases) once. Screens use `Obx` for loading, error, empty, and list state. Navigation after login, logout, and a failed token refresh goes through a small `AppNavigator` so controllers can be tested without a widget tree.

**Secure session.** Tokens are not kept in `SharedPreferences` or memory only. The access token is written last, so a crash mid-save does not look like a valid session. Logout deletes the access token, refresh token, and cached profile. When a signed-in request comes back `401`, the saved refresh token is exchanged and both new tokens are written before the original call is retried.

**Offline first.** The on-device catalog is what the screens render. Drift stores each product, its images, tags, and reviews, plus the id list for every page already fetched, in a SQLite database. Opening the floor list or a product emits that saved copy first, then `GET` runs, the database is rewritten, and the screen updates. If the network fails and a copy exists, the copy stays and a message is shown. If nothing has been saved yet, the first page shows the error view. Sign-out and a rejected refresh delete the catalog with the session. Photos that were displayed once stay available through the image cache. Tokens stay in secure storage, not in the catalog database.

**Pagination.** DummyJSON uses `limit` and `skip`, with `total` on the response. Each request bumps a generation counter. A refresh ignores an older page that returns late, so a slow scroll-load cannot overwrite the refreshed list. A saved page and the network page that follows it replace the same rows, so the list is not duplicated. Page size is 10 so pagination is visible without loading the full catalog (about 194 products).

**Errors.** Dio failures become `NetworkFailure` or `ServerFailure`. The first page shows a full-screen error when nothing is saved. A later page, a failed refresh, or an offline open of a saved catalog keeps the products already on screen and shows a message.
