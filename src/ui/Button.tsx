import { ReactNode } from "react";
import {
  DimensionValue,
  Text,
  TouchableOpacity,
  TouchableOpacityProps,
} from "react-native";
import { StyleSheet } from "react-native";
import Icon from "react-native-vector-icons/FontAwesome";

const styles = StyleSheet.create({
  button: {
    width: "90%",
    padding: 15,
    alignItems: "center",
    justifyContent: "center",
    borderRadius: 5,
    color: "white",
    backgroundColor: "rgb(48, 131, 255)",
  },
  buttonDisabled: {
    backgroundColor: "rgb(139, 185, 255)",
  },
  buttonSecondary: {
    backgroundColor: "rgb(232, 232, 232)",
  },
  buttonContained: {
    width: "100%",
  },
  buttonRounded: {
    borderRadius: 100,
  },
  buttonIcon: {
    borderRadius: 100,
    aspectRatio: 1,
  },
  buttonText: {
    color: "white",
    fontWeight: "800",
    fontSize: 15,
  },
  buttonTextSecondary: {
    color: "black",
  },
});

interface IButtonProps extends TouchableOpacityProps {
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
}

const Button = ({
  text,
  secondary,
  rounded,
  width,
  height,
  icon,
  contained,
  m,
  mx,
  my,
  mt,
  mb,
  mr,
  ml,
  children,
  ...rest
}: IButtonProps) => {
  return (
    <TouchableOpacity
      style={[
        styles.button,
        rest?.disabled && styles.buttonDisabled,
        rounded && styles.buttonRounded,
        secondary && styles.buttonSecondary,
        contained && styles.buttonContained,
        !!icon?.length && styles.buttonIcon,
        width !== undefined && { width },
        height !== undefined && { height },

        m !== undefined && { margin: m },
        mx !== undefined && { marginHorizontal: mx },
        my !== undefined && { marginVertical: my },
        mt !== undefined && { marginTop: mt },
        mb !== undefined && { marginBottom: mb },
        mr !== undefined && { marginRight: mr },
        ml !== undefined && { marginLeft: ml },
      ]}
      {...rest}
    >
      {!!text?.length ? (
        <Text
          style={[styles.buttonText, secondary && styles.buttonTextSecondary]}
        >
          {text}
        </Text>
      ) : !!icon?.length ? (
        <Icon name={icon} />
      ) : (
        children
      )}
    </TouchableOpacity>
  );
};

export default Button;
