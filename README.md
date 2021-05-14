# react-native-simple-gradient-progressbar-view

Simple gradient progressbar view for React Native

## Installation

```sh
npm install react-native-simple-gradient-progressbar-view
```

## Usage

```js
import SimpleGradientProgressbarView from "react-native-simple-gradient-progressbar-view";

<View style={styles.container}>
      <SimpleGradientProgressbarView
        style={styles.box} 
        fromColor="#FF0000"
        toColor="#0000FF"
        progress={0.50}
        maskedCorners={[0, 0, 1, 1]}
        cornerRadius={7.0} 
      />
      <SimpleGradientProgressbarView
        style={styles.box} 
        fromColor="#FF0000"
        toColor="#0000FF"
        progress={0.75}
        maskedCorners={[1, 1, 1, 1]}
        cornerRadius={7.0} 
    />
    <SimpleGradientProgressbarView
        style={styles.box} 
        fromColor="#FF0000"
        toColor="#0000FF"
        progress={1.0}
    />
    </View>
  );

  const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 300,
    height: 30,
    marginVertical: 20,
    borderColor: '#000000',
    borderWidth: 1,
    borderRadius: 7.0,
  },
});

```

## Availabale properites

```js
// Available properties
type SimpleGradientProgressbarViewProps = {
  style: ViewStyle;
  fromColor: string; // color 
  toColor: string; // color
  progress: number; // 0.0 - 1.0
  maskedCorners?: Array<number>; 
  cornerRadius?: number;
};
```

## Screenshots

### iPhone
![iPhone](/screenshots/iphone.png | width=100px)
<img src="/screenshots/iphone.png" width="100">

### Android
![Android](/screenshots/android.png)

## License

MIT
