I would normally never suggest using two package managers but this is the lesser of two evils.  Carthage allows me to manage packages while the Swift community struggles to transition from Swift 2.0 to 3.1.  Carthage is awesome but Firebase won't support it.  So the goal is to use Cocoapods only for Firebase / Google libraries and Carthage for everything else.  

# Carthage

```language-powerbash
carthage update --platform ios
```

# Podfile

```language
pod update
```