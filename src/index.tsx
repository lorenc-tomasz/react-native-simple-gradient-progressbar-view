import { requireNativeComponent, ViewStyle } from 'react-native';

type SimpleGradientProgressbarViewProps = {
  style: ViewStyle;
  fromColor: string; // color
  toColor: string; // color
  progress: number; // 0.0 - 1.0
  maskedCorners?: Array<number>; 
  cornerRadius?: number;
};

export const SimpleGradientProgressbarView = requireNativeComponent<SimpleGradientProgressbarViewProps>(
'SimpleGradientProgressbarView'
);

export default SimpleGradientProgressbarView;
