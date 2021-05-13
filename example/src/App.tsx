import * as React from 'react';

import { StyleSheet, View } from 'react-native';
import SimpleGradientProgressbarViewViewManager from 'react-native-simple-gradient-progressbar-view';

export default function App() {
  return (
    <View style={styles.container}>
      <SimpleGradientProgressbarViewViewManager
        style={styles.box} 
        fromColor="#FF00AA"
        toColor="#FA3A55"
        progress={0.8}
        maskedCorners={[0, 0, 1, 1]}
        cornerRadius={7.0} 
      />
      <SimpleGradientProgressbarViewViewManager
        style={styles.box} 
        fromColor="#11AACC"
        toColor="#FA3A55"
        progress={0.9}
        maskedCorners={[1, 1, 1, 1]}
        cornerRadius={7.0} 
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
