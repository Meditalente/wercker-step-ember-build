# Build Ember Applications with Wercker

As part of the build or deploy process of an Ember Application, it has to be built. This step does exactly that.

## Properties

| Property      | Default      | Description                                        |
| :-------------| -----------: | :--------------------------------------------------|
| `environment` | `production` | Build for environment.                             |
| `use-cache`   | `true`       | Use NPM cache for emebr build, defaults to `true`. |

## Changelog

### 0.2.0 [2017-08-29]

+ Added `use-cache` option.