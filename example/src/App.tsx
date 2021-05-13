import * as React from 'react';

import { StyleSheet, View } from 'react-native';
import SimpleGradientProgressbarViewViewManager from 'react-native-simple-gradient-progressbar-view';

export default function App() {
  return (
    <View style={styles.container}>
      <SimpleGradientProgressbarViewViewManager
        style={styles.box} 
          fromColor="#FA3A33"
          toColor="#FA3A55"
          progress={0.8}
          maskedCorners={[0, 0, 1, 1]}
          cornerRadius={0.0} 
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
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
