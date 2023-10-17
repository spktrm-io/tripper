import { StyleProp, ViewStyle } from "react-native";
import { IButtonProps } from "../Button/IButtonProps";

export interface IHeaderButtonProps {
  icon?: string;
  text?: string;
  navigation: () => void;
  style?: StyleProp<ViewStyle>;
  buttonProps?: IButtonProps;
}
