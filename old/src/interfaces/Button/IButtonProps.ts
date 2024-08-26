import { ReactNode } from "react";
import {
  DimensionValue,
  StyleProp,
  TouchableOpacityProps,
  ViewStyle,
} from "react-native";

export interface IButtonProps extends TouchableOpacityProps {
  text?: string;
  secondary?: boolean;
  rounded?: boolean;
  width?: DimensionValue | undefined;
  height?: DimensionValue | undefined;
  icon?: string;
  contained?: boolean;
  m?: DimensionValue | undefined;
  mx?: DimensionValue | undefined;
  my?: DimensionValue | undefined;
  mt?: DimensionValue | undefined;
  mb?: DimensionValue | undefined;
  mr?: DimensionValue | undefined;
  ml?: DimensionValue | undefined;
  children?: ReactNode;
  style?: StyleProp<ViewStyle>;
}
