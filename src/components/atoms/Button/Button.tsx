import { Text, TouchableOpacity } from "react-native";
import Icon from "react-native-vector-icons/FontAwesome";
import { styles } from "./Button.style";
import { IButtonProps } from "../../../interfaces/Button/IButtonProps";

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
  style,
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
        !!width && { width },
        !!height && { height },
        !!m && { margin: m },
        !!mx && { marginHorizontal: mx },
        !!my && { marginVertical: my },
        !!mt && { marginTop: mt },
        !!mb && { marginBottom: mb },
        !!mr && { marginRight: mr },
        !!ml && { marginLeft: ml },
        style,
      ]}
      {...rest}
    >
      {!!text?.length && (
        <Text
          style={[styles.buttonText, secondary && styles.buttonTextSecondary]}
        >
          {text}
        </Text>
      )}
      {!!icon?.length && <Icon name={icon} />}
      {children}
    </TouchableOpacity>
  );
};

export default Button;
