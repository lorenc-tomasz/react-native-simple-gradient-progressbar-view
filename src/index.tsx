import { requireNativeComponent, ViewStyle } from 'react-native';

type SimpleGradientProgressbarViewProps = {
  color: string;
  style: ViewStyle;
};

export const SimpleGradientProgressbarViewViewManager = requireNativeComponent<SimpleGradientProgressbarViewProps>(
'SimpleGradientProgressbarViewView'
);

export default SimpleGradientProgressbarViewViewManager;
