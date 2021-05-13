import * as React from 'react';

import { StyleSheet, View } from 'react-native';
import SimpleGradientProgressbarViewViewManager from 'react-native-simple-gradient-progressbar-view';

export default function App() {
  return (
    <View style={styles.container}>
      <SimpleGradientProgressbarViewViewManager
        style={styles.box} 
        fromColor="#FF0000"
        toColor="#0000FF"
        progress={0.50}
        maskedCorners={[0, 0, 1, 1]}
        cornerRadius={7.0} 
      />
      <SimpleGradientProgressbarViewViewManager
        style={styles.box} 
        fromColor="#FF0000"
        toColor="#0000FF"
        progress={0.75}
        maskedCorners={[1, 1, 1, 1]}
        cornerRadius={7.0} 
    />
    <SimpleGradientProgressbarViewViewManager
        style={styles.box} 
        fromColor="#FF0000"
        toColor="#0000FF"
        progress={1.0}
    />
    </View>
  );
}

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
