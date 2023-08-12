[Linting, Packages, CI/CD, Testing, Theming](https://www.youtube.com/watch?v=QETClbz1sz8&t=36s&ab_channel=RobertBrunhage)

---

[Linting Rules, Single Responsibility, Read and Learn from the Flutter Repository, Keep Widgets Short, Narrow and Concise,Start your code with CI / CD in mind, Do not Hard Code Styles into your widgets, Plan before you code](https://www.youtube.com/watch?v=bn5e95b3uLY&t=129s&ab_channel=FlutterExplained)

---

# Lint or just use flutter_lint
lint is a hand-picked, open-source, community-driven collection of lint rules for Dart and Flutter projects. The set of rules follows the Effective Dart: Style Guide.

This package can be used as a replacement for package:lints or the discontinued package:pedantic for those who prefer stricter rules.

```yaml
dev_dependencies:
  lint: ^2.0.0
```

Create an `analysis_options.yaml` file in the root of your project with the following content:
```yaml
# This file configures the analyzer to use the lint rule set from `package:lint`

include: package:lint/strict.yaml # For production apps
# include: package:lint/casual.yaml # For code samples, hackathons and other non-production code
# include: package:lint/package.yaml # Use this for packages with public API


# You might want to exclude auto-generated files from dart analysis
analyzer:
  exclude:
    #- '**.freezed.dart'
    #- '**.g.dart'

# You can customize the lint rules set to your own liking. A list of all rules
# can be found at https://dart-lang.github.io/linter/lints/options/options.html
linter:
  rules:
    # Util classes are awesome!
    # avoid_classes_with_only_static_members: false
    
    # Make constructors the first thing in every class
    # sort_constructors_first: true

    # Choose wisely, but you don't have to
    # prefer_double_quotes: true
    # prefer_single_quotes: true
```
